const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("poapNFT", function () {
  it("Should return the new greeting once it's changed", async function () {
    const NFTDescriptor = await ethers.getContractFactory("NFTDescriptor");
    const nftDescriptorLib = await NFTDescriptor.deploy();
    await nftDescriptorLib.deployed();

    const poapNFTtest = await ethers.getContractFactory("GTONpoapNFT", {
      libraries: {
        NFTDescriptor: nftDescriptorLib.address,
      },
    });
    const poapNFTDeploed = await poapNFTtest.deploy("GTON NFT", "gtonNFT", "GTON");
    await poapNFTDeploed.deployed();
  });
});
