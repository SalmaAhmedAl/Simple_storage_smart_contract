//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

//Just when you import that contract, you get the ABI
import "./SimpleStorage.sol"; 

contract StorageFactory {
    
    SimpleStorage[] public simpleStorageArray;
    
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }
    
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageFavNumber) public {
        // Address 
        // ABI - Application Binary Interface >>Look at Compilation details/ABI (tells you all inputs, outputs and everything you could do with this contract)
       
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        simpleStorage.store(_simpleStorageFavNumber);
        
        //short way
        //simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }
    
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        return simpleStorageArray[_simpleStorageIndex].retrieve();
        //short way
        // return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrieve();
        
    }
}
