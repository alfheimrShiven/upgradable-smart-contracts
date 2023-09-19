// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

// implementation contract
contract ContractB { 
    uint256 public num;
    address public sender;
    uint256 public value;

    function setVars(uint256 _num) public payable{
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

// Proxy contract
contract ContractA {
    uint256 public num;
    address public sender;
    uint256 public value;

    function setVars(address _implementationContact, uint256 _num) public payable {
        (bool success, ) = _implementationContact.delegatecall(
            abi.encodeWithSignature('setVars(uint256)', _num));
        if(!success) {
            revert ("delegate call failed");
        }
    }
}
