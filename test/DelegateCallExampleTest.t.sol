// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {ContractA, ContractB} from "../src/DelegateCallExample.sol" ;

contract DelegateCallExampleTest is Test {
    ContractB contractB; 
    ContractA contractA;
    function setUp() public {
        contractB = new ContractB();
        contractA = new ContractA();
    }

    function testDelegation() public {
        contractB.setVars(123);
        contractA.setVars(address(contractB),999);

        console.log('Num in contract B', contractB.num());
        console.log('Num in contract A', contractA.num());

        assertEq(contractB.num(), 123);
        assertEq(contractA.num(), 999);
    }
}