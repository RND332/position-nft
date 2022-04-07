require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");
require('@symblox/hardhat-abi-gen');
require("dotenv").config()

const { PRIVATEKEY, ETHERSCAN, POLYGONSCAN, FTMSCAN, APIKEY } = process.env;

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  defaultNetwork: "hardhat",
  networks: {
    hardhat: {
    },
    mumbai: {
      networkId: 80001,
      url: "https://matic-mumbai.chainstacklabs.com",
      accounts: [PRIVATEKEY],
      gasPrice: 35000000000,
    }
  },
  etherscan: {
    apiKey: {
        mainnet: ETHERSCAN,
        ropsten: ETHERSCAN,
        rinkeby: ETHERSCAN,
        goerli: ETHERSCAN,
        kovan: ETHERSCAN,
        // ftm
        opera: FTMSCAN,
        ftmTestnet: FTMSCAN,
        // polygon
        polygon: APIKEY,
        polygonMumbai: APIKEY,
    }
  },
  solidity: {
    version: "0.8.12",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  },
  paths: {
    sources: "./contracts",
    tests: "./test",
    cache: "./cache",
    artifacts: "./artifacts"
  },
  mocha: {
    timeout: 80000
  }
};
