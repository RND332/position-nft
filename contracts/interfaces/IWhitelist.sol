//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

interface IWhitelist {
    function isWhitelisted(address user) external view returns(bool);
    function setWhitelist(address user, bool isAllowed) external;
    function addWhitelist(address user) external;
}
