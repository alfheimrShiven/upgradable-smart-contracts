// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {UUPSUpgradeable} from "@openzeppelin/upgradeable-contracts/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "@openzeppelin/upgradeable-contracts/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "@openzeppelin/upgradeable-contracts/access/OwnableUpgradeable.sol";

contract BoxV1 is Initializable, UUPSUpgradeable, OwnableUpgradeable {
    uint256 internal number;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers(); // will disable initialization of this implementation contract by other contracts.
    }

    /*
     * @devs initialize() is used in Implementation contracts to initialize() * variables for the Proxy contract. This is done because the *UUPSUpgradable contracts implementation contracts cannot use *constructors to initialise variables because all state variables have to * be stored in Proxy contracts.
    */
   
    function initialize() public initializer {
        // The initializer() modifier will protect the initialize() to just be used once replecating a constructor's behaviour.

        __Ownable_init(); // setting the deployer as the owner of this contract (owner = msg.sender)
        __UUPSUpgradeable_init();
    
    }

    function getNumber() view public returns(uint256) {
        return number;
    }

    function version() pure public returns(uint256) {
        return 1;
    }

    function _authorizeUpgrade(address newImplementation) internal override {
        // no checks in here cuz we want everyone to be able to authorizeUpgrade. Just implementing cuz it's required by the UUPS abstract contract
    }
}