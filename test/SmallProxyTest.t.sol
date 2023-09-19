// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {SmallProxy, ImplementationContract, ImplementationContractV2} from "../src/SmallProxy.sol";

contract SmallProxyTest is Test {
    SmallProxy smallProxy;
    bytes callData;

    function setUp() public {
        smallProxy = new SmallProxy();
        callData = smallProxy.getCallData(999);
    }

    function testStorage() public {
        ImplementationContract implementationContract = new ImplementationContract();
        smallProxy.setImplementation(address(implementationContract));
        
        address(smallProxy).call(callData);
        assertEq(smallProxy.readStorage(), 999);
    }

    function testUpgrade() public {
        ImplementationContractV2 implementationContractV2 = new ImplementationContractV2();
        smallProxy.setImplementation(address(implementationContractV2));
        
        address(smallProxy).call(callData);
        assertEq(smallProxy.readStorage(), (999 + 2));
    }
}