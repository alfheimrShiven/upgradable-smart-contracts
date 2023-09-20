// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {UUPSUpgradeable} from "@openzeppelin/upgradeable-contracts/proxy/utils/UUPSUpgradeable.sol";

contract BoxV2 is UUPSUpgradeable {
    uint256 internal number;

    function setNumber(uint256 _number) external {}

    function getNumber() external view returns(uint256) {
        return number;
    }

    function version() external pure returns(uint256) {
        return 2;
    }

    function _authorizeUpgrade(address newImplementation) internal override {
        // no checks in here cuz we want everyone to be authorized to allow upgrade. Just implementing cuz it's required by the UUPS abstract contract
    }
}