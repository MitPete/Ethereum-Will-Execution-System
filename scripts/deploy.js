// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
   // Deploy Death certificate 
   const DeathCertificate = await ethers.getContractFactory('DeathCertificate')
   const deathCertificate = await DeathCertificate.deploy()
   await deathCertificate.deployed()

   console.log(`Deployed Death Certificate Contract at: ${deathCertificate.address}`)

   const Executor = await ethers.getContractFactory('Executor')
   const executor = await Executor.deploy()
   await executor.deployed()

  console.log(`Deployed Executor Contract at: ${executor.address}`)

  const Assets = await ethers.getContractFactory('Assets')
   const assets = await Assets.deploy()
   await assets.deployed()

  console.log(`Deployed Assets Contract at: ${assets.address}`)
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
