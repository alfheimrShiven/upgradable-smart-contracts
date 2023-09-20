// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployBox} from "../script/DeployBox.s.sol";
import {UpgradeBox} from "../script/UpgradeBox.s.sol";
import {BoxV1} from "../src/BoxV1.sol";
import {BoxV2} from "../src/BoxV2.sol";


contract DeployAndUpgradeProxy is Test {
    address owner = makeAddr("owner");
    DeployBox deployer;
    UpgradeBox upgrader;
    address proxy;

    function setUp() external {
        deployer = new DeployBox();
        upgrader = new UpgradeBox();
        proxy = deployer.run(); // proxy pointing to BoxV1
    }

    function testProxyPointsToBoxV1() public {
        assertEq(BoxV1(proxy).version(), 1);
    }

    function testProxyUpgradeToBoxV2() public {
        BoxV2 boxV2 = new BoxV2();
        proxy = upgrader.upgradeBox(address(boxV2), proxy); // proxy pointing to BoxV2

        BoxV2(proxy).setNumber(777);
        assertEq(BoxV2(proxy).getNumber(), 777);

        assertEq(BoxV2(proxy).version(), 2);
    }
}