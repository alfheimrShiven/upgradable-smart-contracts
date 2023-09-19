// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {SmallProxy, ImplementationContract} from "../src/SmallProxy.sol";

contract SmallProxyTest is Test {
    SmallProxy smallProxy;
    ImplementationContract implementationContract;
    bytes callData;

    function setUp() public {
        implementationContract = new ImplementationContract();
        smallProxy = new SmallProxy();
        smallProxy.setImplementation(address(implementationContract));
    }

    function testStorage() public {
        callData = smallProxy.getCallData(999);
        address(smallProxy).call(callData);

        assertEq(smallProxy.readStorage(), 999);
    }
}