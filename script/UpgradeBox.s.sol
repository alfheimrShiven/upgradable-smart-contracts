// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {BoxV2} from "../src/BoxV2.sol";
import {BoxV1} from "../src/BoxV1.sol";
import {DeployBox} from "./DeployBox.s.sol";

contract UpgradeBox is Script {
    function run() external returns (address) {
        vm.startBroadcast();
        BoxV2 boxV2 = new BoxV2();
        DeployBox deployBoxScript = new DeployBox();
        vm.stopBroadcast();

        address previousProxyAddress = deployBoxScript.run();

        address proxy = upgradeBox(address(boxV2), previousProxyAddress);
        return proxy;
    }

    function upgradeBox(address boxV2Address, address previousProxyAddress) public returns (address){
        vm.startBroadcast();
        BoxV1 proxy = BoxV1(previousProxyAddress); // ? Suppose to return instance of proxy, but here isnt the code looking like returning BoxV1 instance
        proxy.upgradeTo(boxV2Address); // proxy contract now points to boxV2 (new implementation contract) address
        vm.stopBroadcast();

        return address(proxy);
    }
}