// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC4626.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SimpleGoldVault is ERC4626 {

    constructor(ERC20 _asset)
        ERC20("Vault Gold Shares", "vGOLD")
        ERC4626(_asset)
    {}
}