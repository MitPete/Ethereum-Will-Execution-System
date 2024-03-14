// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;



contract DeathCertificate { 
    address ownerAddress;//Issuers Address 
    bool public AuthenticCertificate = false;//Has the certifcate been authenticated 

    struct Certificate {
        uint  age ;
        string name;
        uint doctorId;
        string  issuer;
        uint256 timeOfDeath; 
        uint256 certificateTime;
        
     }
    
    //Create new variable instance from our type struct 
    Certificate public death_certificate;
    
    //Set the details of the certifcate 
    constructor()  {
        ownerAddress = msg.sender;
        death_certificate.age = 138;
        death_certificate.name = "Pablo Picasso";
        death_certificate.doctorId = 198321;
        death_certificate.issuer = "California";
        death_certificate.timeOfDeath = 1145;
        death_certificate.certificateTime = block.timestamp;
        
    }
    //Manage boolean 
    function certficateCreated () external {
        AuthenticCertificate = true; 
        }

     modifier onlyOwner() {
        require(msg.sender == ownerAddress,"Only the owner can call this!");
        _;
    }
    //Owner can modify the certificate if need be 
    function modifyDeathCertificate(uint _age, string memory _name,uint _doctorId,string memory _issuer,uint256 _timeofDeath,uint256 _certificateTime) external onlyOwner {
        Certificate storage new_death_certificate = death_certificate;
        new_death_certificate.age = _age;
        new_death_certificate.name = _name;
        new_death_certificate.doctorId = _doctorId;
        new_death_certificate.issuer = _issuer;
        new_death_certificate.timeOfDeath = _timeofDeath;
        new_death_certificate.certificateTime = _certificateTime;
    }
  
 }