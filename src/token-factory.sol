// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "./non-fungible-token.sol";
import "./fungible-token.sol";


contract TokenFactory { 
    address[] NFTs; 
    address[] FungibleTokens;

    event NftCreated(address indexed NftAddress, address indexed creator);
    event FungibleTokenCreated(address indexed tokenAddress, address indexed creator);

    function createNFT(string memory _name, string memory _symbol, string memory _uri) external{
        NonFungibleToken newNftToken = new NonFungibleToken(_name, _symbol, _uri);
        NFTs.push(address(newNftToken));
        emit NftCreated(address(newNftToken), msg.sender);
    }

    function createFungibleToken(string memory _name, string memory _symbol, uint256 _initialSupply) external{
        FungibleToken newFungibleToken = new FungibleToken(_name, _symbol, _initialSupply);
        FungibleTokens.push(address(newFungibleToken));
        emit FungibleTokenCreated(address(newFungibleToken), msg.sender);
    }

    function getAllNftContract() external view returns (address[] memory) {
        return NFTs;        
    }

    function getAllFungibleToken() external view returns (address[] memory){
        return FungibleTokens;
    }
    
}