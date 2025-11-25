// SPDX-License-Identifier: MIT
pragma solidity ^ 0.8.20;

contract MappingExample{
mapping(address => uint256) public valueMapping;

function setValue(uint256 _value) public {
valueMapping[msg.sender] = _value;
}
function getValue() public view returns (uint256){
return valueMapping[msg.sender];
}
}