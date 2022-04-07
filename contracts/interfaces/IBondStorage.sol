//SPDX-License-Identifier: MIT
pragma solidity 0.8.12;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

interface IPoapStorage is IERC721 {

    /**
     * @dev Mints new token for message sender.
     * 
     * Accessible by owner only!
     */
    function mint(address to) external returns(uint);
}
