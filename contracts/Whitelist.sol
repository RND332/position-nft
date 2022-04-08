//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { IWhitelist } from "./interfaces/IWhitelist.sol";
import { AdminAccess } from "./access/AdminAccess.sol";

contract Whitelist is IWhitelist, AdminAccess {

    mapping(address => bool) whitelist;

    function isWhitelisted(address user) public view returns(bool) {
        return whitelist[user];
    }

    function setWhitelist(address user, bool isAllowed) public onlyAdminOrOwner {
        whitelist[user] = isAllowed;
    }

    function addWhitelist(address user) public onlyAdminOrOwner {
        whitelist[user] = true;
    }
}
