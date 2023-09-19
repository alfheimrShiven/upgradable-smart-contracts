// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Proxy} from "@openzeppelin/contracts/proxy/Proxy.sol";

contract SmallProxy is Proxy {

    // This is the keccak-256 hash of "eip1967.proxy.implementation" subtracted by 1
    bytes32 private constant _IMPLEMENTATION_SLOT =
        0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;

    function setImplementation(address _implementationContract) public {
        assembly {
            sstore(_IMPLEMENTATION_SLOT, _implementationContract)
        }
    }

    function _implementation() internal view override returns (address implementationContract) {
        assembly{
            implementationContract := sload(_IMPLEMENTATION_SLOT)
        }
    }

    function readStorage() public view returns(uint256 valueStored) {
        assembly {
            valueStored := sload(0)
        }
    }

    // helper function
    function getCallData(uint256 _num) public pure returns(bytes memory) {
        return abi.encodeWithSignature("setValue(uint256)", _num);
    }
}

contract ImplementationContract {
    uint256 public number;
    
    function setValue(uint256 _num) public {
        number = _num;
    }
}