// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/SimpleTStore.sol";
import "forge-std/console.sol";

contract TestSimpleTStore is Test, SimpleTStore {
    function testStore() public {
        address token = address(0x123);
        uint debt = 100;
        uint tokenKey = uint(keccak256(abi.encodePacked(token)));
        uint gasBefore = gasleft();
        tstore(tokenKey, debt);
        uint gasAfter = gasleft();
        console.log("gas used", gasBefore - gasAfter);
        console.log("tload", tload(tokenKey));
    }
}
