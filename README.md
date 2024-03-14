<<<<<<< HEAD
# Executor and Assets Management on Ethereum Blockchain

This project is a smart contract system developed on the Ethereum blockchain using Solidity. It consists of three main contracts: `Executor.sol`, `Assets.sol`, and `DeathCertificate.sol`.

## Executor Contract

The `Executor.sol` contract is responsible for managing the execution of a will. It holds the addresses of the testator, the executor of the will (key custodian), and the death certificate contract. It also maintains a timestamp of the ownership transfer and a flag to check the authenticity of the death certificate.

## Assets Contract

The `Assets.sol` contract extends the ERC1155 contract from the OpenZeppelin library. It manages a set of assets, each identified by a unique ID, and implements a system of ownership and transfer of these assets. It also interacts with the `Executor.sol` contract to ensure that only the key custodian can perform certain actions.

## Death Certificate Contract

The `DeathCertificate.sol` contract plays a crucial role in the system. It represents a death certificate for a person, with details such as age, name, doctor's ID, issuer, time of death, and certificate time. The contract also has a flag to indicate whether the certificate has been authenticated. The owner of the contract can modify the certificate details if necessary. This contract serves as a proof of death and triggers the execution of the will in the `Executor.sol` contract.

This project showcases the potential of blockchain technology in managing and transferring assets in a secure and transparent manner. It can be used as a starting point for developing more complex systems for asset management and execution of wills on the blockchain.
=======
# Ethereum-Will-Execution-System
This repository contains Solidity contracts for a blockchain-based will execution system. It uses a DeathCertificate.sol contract as a trigger for asset transfer, demonstrating blockchain's potential in secure estate management.
>>>>>>> origin/main
