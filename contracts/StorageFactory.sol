// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./SimpleStorage.sol";
contract StorageFactory{
    SimpleStorage[] public simpleStorageArray;
    
    function createSimpleStorageContract() public {
     //How does storage factory know what simple storage looks like
	 SimpleStorage simpleStorage = new SimpleStorage();
	 simpleStorageArray.push(simpleStorage);
    
    }
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public
 {
        //Address
        //ABI Application Binary  Interface //tell our code exactly how to interact with the contract
        simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }
     function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
       return simpleStorageArray[_simpleStorageIndex].retrieve();

     }
}