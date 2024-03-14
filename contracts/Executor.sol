// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

// Interface for death certificate authenticity check
interface IDeathCertificate {
    function AuthenticCertificate() external returns (bool);
}

contract Executor { 
    address public counterAddress; // Address of the death certificate contract
    address public Owner; // Address of the testator 
    address public keyCustodian; // Address of the executor of the will 
    bool keyCustodianIsSet = false; // Flag to check if the executor's address has been set
    uint256 public transactionTime; // Timestamp of the ownership transfer
    bool public AuthenticCertificate; // Flag to check the authenticity of the death certificate

    constructor() {
        Owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == Owner, "Only the testator can call this function.");
        _;
    } 

    modifier onlyKeyCustodian() {
        require(msg.sender == keyCustodian, "Only the executor can call this function.");
        _;
    }
    
    function CertificateIssued() external onlyOwner {
        AuthenticCertificate = IDeathCertificate(counterAddress).AuthenticCertificate();
    }

    function setCouneterAddress (address _counter) external onlyOwner {
        counterAddress = _counter;
    }
  
    function setKeyCustodian(address  _keyCustodian, bool _keyCustodianIsSet) public onlyOwner {
        keyCustodian = _keyCustodian;
        keyCustodianIsSet = _keyCustodianIsSet;
    }    
    
    function transferOwnership(address _newOwner) public onlyOwner {
        require(keyCustodianIsSet && AuthenticCertificate, "Transfer conditions not met.");
        Owner = _newOwner;  
        transactionTime = block.timestamp;
    }
}