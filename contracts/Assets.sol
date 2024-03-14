// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

interface IExecutor {
    function keyCustodian() external returns (address payable);
}

contract Assets is ERC1155 {
    address public counterAddress;
    address public keyCustodian;
    address[2] public familyMembers; 
    address public Tom; 
    address public Bob; 
    bool public familySet;

    uint256 public constant HOUSE = 0;
    uint256 public constant SAVINGS = 1;
    uint256 public constant LIFE_INSURANCE = 2;
    uint256 public constant COLLECTIBLES = 3;
    uint256 public constant DEBT = 4;

    modifier onlyOwner()  { 
        require(msg.sender == keyCustodian, "Only Key Custodian can call this.");
        _;
    }

    function Getowner() external {
        keyCustodian = IExecutor(counterAddress).keyCustodian(); 
    }

    function setPushFamily(address _Tom, address _Bob, bool _familySet) public onlyOwner {
        Tom = _Tom;
        Bob = _Bob;
        familySet = _familySet; 
        _familySet = true; 
    }

    function setBobandTomInArray() public payable onlyOwner returns (address[2] memory) {  
        if (familySet = true) {
            familyMembers = [address(Bob),(Tom)];
            return familyMembers;
        } else {
            revert ("This is it bro");
        }
    }

    function getIteminArray(uint _index) public view returns (address) {
        return familyMembers[_index]; 
    }

    function getLength() public view returns (uint) {
        return familyMembers.length; 
    }

    function getAddresses() public view returns (address [2] memory)  {
        return familyMembers;
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 id,
        uint256 amount,
        bytes memory data
    ) public virtual override {
        require(
            from == _msgSender() || isApprovedForAll(from, _msgSender()),
            "ERC1155: caller is not token owner or approved"
        );
        if (familyMembers.length == 2 && familyMembers[0] == Bob && familyMembers[1] == Tom ) {
            _safeTransferFrom(from, to, id, amount, data);
        } else {
            revert ("Family addresses have not been approved");
        }
    }

    function safeBatchTransferFrom(
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,      
        bytes memory data
    ) public virtual override {
        require(
            from == _msgSender() || isApprovedForAll(from, _msgSender()),
            "ERC1155: caller is not token owner or approved"
        );
        if (familyMembers.length == 2 && familyMembers[0] == Bob && familyMembers[1] == Tom) {
            _safeBatchTransferFrom(from, to, ids, amounts, data);
        } else {
            revert ("Family addresses have not been approved");
        }
    }

    constructor(address _counterAddress) ERC1155("https://assets.example/api/item/{id}.json") {
        counterAddress = _counterAddress;
        keyCustodian = msg.sender;
        _mint(msg.sender, HOUSE, 5, "");
        _mint(msg.sender, SAVINGS, 3, "");
        _mint(msg.sender, LIFE_INSURANCE, 3, "");
        _mint(msg.sender, COLLECTIBLES, 10**9, "");
        _mint(msg.sender, DEBT, 10**9, "");
    }
}