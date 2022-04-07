export default [
  {
    "inputs": [
      {
        "components": [
          {
            "internalType": "uint256",
            "name": "tokenId",
            "type": "uint256"
          },
          {
            "internalType": "string",
            "name": "tokenSymbol",
            "type": "string"
          }
        ],
        "internalType": "struct NFTDescriptor.URIParams",
        "name": "params",
        "type": "tuple"
      }
    ],
    "name": "constructTokenURI",
    "outputs": [
      {
        "internalType": "string",
        "name": "",
        "type": "string"
      }
    ],
    "stateMutability": "pure",
    "type": "function"
  }
];
