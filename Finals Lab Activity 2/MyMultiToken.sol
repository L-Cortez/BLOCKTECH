// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// OpenZeppelin imports (version locked for safety)
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.5/contracts/token/ERC1155/ERC1155.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.5/contracts/access/Ownable.sol";

contract MyMultiToken is ERC1155, Ownable {
    // Token IDs as constants
    uint256 public constant GOLD = 1;
    uint256 public constant SILVER = 2;
    uint256 public constant DIAMOND = 3;

    // Constructor: set URI and mint initial supply to owner
    constructor() ERC1155("https://mygame.io/api/item/{id}.json") {
        _mint(msg.sender, GOLD, 1000, "");
        _mint(msg.sender, SILVER, 5000, "");
        _mint(msg.sender, DIAMOND, 100, "");
    }

    // Owner-only mint function
    function mint(
        address to,
        uint256 id,
        uint256 amount
    ) external onlyOwner {
        _mint(to, id, amount, "");
    }

    // Burn function (only token holder can burn their own tokens)
    function burn(
        address from,
        uint256 id,
        uint256 amount
    ) external {
        require(from == msg.sender, "You can only burn your own tokens");
        _burn(from, id, amount);
    }
}