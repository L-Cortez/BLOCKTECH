// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract SimpleMintContract is ERC721URIStorage, Ownable {

    uint256 public mintAmount = 0.05 ether;
    uint256 public totalSupply;
    uint256 public maxSupply = 2;
    bool public isMintEnabled;

    mapping(address => uint256) public mintedWallets;

    constructor() 
        ERC721("Simple Minting", "SAMPLEMINT") 
        Ownable(msg.sender)   // ✅ REQUIRED in OZ v5+
    {}

    function toggleIsMintEnabled() external onlyOwner {
        isMintEnabled = !isMintEnabled;
    }

    function setMaxSupply(uint256 _maxSupply) external onlyOwner {
        maxSupply = _maxSupply;
    }

    function mint() external payable {
        require(isMintEnabled, "Minting not enabled");
        require(mintedWallets[msg.sender] < 1, "Exceeds max per wallet");
        require(msg.value == mintAmount, "Wrong value");
        require(totalSupply < maxSupply, "Sold out");

        totalSupply++;
        mintedWallets[msg.sender]++;

        _safeMint(msg.sender, totalSupply);
    }
}