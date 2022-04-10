// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/proxy/Clones.sol";
import { Devo } from "./Devo.sol";

contract ProjectTokenFactory {
    address public immutable tokenImplementation;

    constructor() {
        tokenImplementation = address(new Devo());
    }

    function createProjectToken(
        string memory name,
        string memory symbol,
        uint256 initialSupply
    ) external returns (address) {
        address clone = Clones.clone(tokenImplementation);
        Devo(clone).initialize(name, symbol, initialSupply, msg.sender);
        return clone;
    }
}
