// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

import "../libraries/openzeppelin/token/ERC20/ERC20.sol";
import "../libraries/openzeppelin/access/Ownable.sol";
import "../libraries/openzeppelin/token/ERC20/extensions/draft-ERC20Permit.sol";
import "../libraries/openzeppelin/token/ERC20/extensions/ERC20Votes.sol";

contract MyToken is ERC20, Ownable, ERC20Permit, ERC20Votes {
    constructor() ERC20("MyToken", "MTK") ERC20Permit("MyToken") {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // The following functions are overrides required by Solidity.

    function _afterTokenTransfer(address from, address to, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._afterTokenTransfer(from, to, amount);
    }

    function _mint(address to, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._mint(to, amount);
    }

    function _burn(address account, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._burn(account, amount);
    }
}