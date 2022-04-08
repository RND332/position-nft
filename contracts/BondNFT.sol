// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import '@openzeppelin/contracts/token/ERC20/IERC20.sol';
import '@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol';

import './NFT.sol';
import './libraries/NFTDescriptor.sol';
import './libraries/BokkyPooBahsDateTimeLibrary.sol';
import './libraries/HexStrings.sol';
import './interfaces/IBondStorage.sol';
import './access/AdminAccess.sol';
import './Whitelist.sol';

contract GTONpoapNFT is NFT, IPoapStorage, AdminAccess, Whitelist {
    using SafeERC20 for IERC20;
    using Strings for uint256;

    constructor(
        string memory _name,
        string memory _symbol,
        string memory _poapTokenSymbol
    ) NFT(_name, _symbol) {
        poapTokenSymbol = _poapTokenSymbol;
    }

    /* ========== STATE VARIABLES ========== */
    string public poapTokenSymbol;
    mapping(address => uint[]) public userIds;

    function userIdsLength(address user) public view returns (uint) {
        return userIds[user].length;
    }

    /* ========== MUTATIVE FUNCTIONS ========== */
    function mint(address to) public onlyAdminOrOwner returns (uint tokenId) {
        require(isWhitelisted(msg.sender));

        tokenId = _safeMint(to, "");
        userIds[to].push(tokenId);

        setWhitelist(msg.sender, false);
    }

    function transfer(address to, uint tokenId) public {
        require(
            ownerOf(tokenId) == msg.sender,
            "poapStorage: You are not the owner"
        );
        _transfer(msg.sender, to, tokenId);
    }

    function _tokenURI(uint256 tokenId)
        internal
        view
        virtual
        override
        returns (string memory)
    {
        return
            NFTDescriptor.constructTokenURI(
                NFTDescriptor.URIParams({
                    tokenId: tokenId,
                    tokenSymbol: poapTokenSymbol
                })
            );
    }
}
