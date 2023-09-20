// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {BoxV2} from "../src/BoxV2.sol";
import {BoxV1} from "../src/BoxV1.sol";
import {DeployBox} from "./DeployBox.s.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract UpgradeBox is Script {
    function run() public returns (address) {
        vm.startBroadcast();
        BoxV2 boxV2 = new BoxV2();
        vm.stopBroadcast();

        address previousProxyAddress = DevOpsTools
            .get_most_recent_deployment("ERC1967Proxy", block.chainid);


        address proxy = upgradeBox(address(boxV2), previousProxyAddress);
        return proxy;
    }

    function upgradeBox(address boxV2Address, address previousProxyAddress) public returns (address){
        vm.startBroadcast();
        BoxV1 proxy = BoxV1(previousProxyAddress); // ? Suppose to return instance of proxy, but here isnt the code looking like returning BoxV1 instance. Shouldn't it be ERC1967Proxy(previousProxyAddress)
        proxy.upgradeTo(boxV2Address); // proxy contract now points to boxV2 (new implementation contract) address
        vm.stopBroadcast();

        return address(proxy);
    }
}