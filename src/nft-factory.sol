// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "./nft.sol";

contract NftFactory { 
    address[] public NFTs;

    event NftCreated(address indexed NftAddress, address indexed creator);

    function createNFT(string memory _name, string memory _symbol, string memory _uri) external{
        NftToken newNftToken = new NftToken(_name, _symbol, _uri);
        NFTs.push(address(newNftToken));
    }

    function getAllNfts() external view returns (address[] memory) {
        return NFTs;        
    }
}
