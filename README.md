# Solidity Project - SimpleStorage

This project consists of three Solidity contracts: `SimpleStorage`, `StorageFactory`, and `ExtraStorage`. These contracts are written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain.

## SimpleStorage.sol

```solidity
pragma solidity ^0.8.7;

contract SimpleStorage {
    uint256 favoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    People[] public people;
    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
    }
    
    function retrieve() public view returns (uint256){
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
```

The `SimpleStorage` contract allows storing and retrieving a favorite number. It also includes a `People` struct to store additional information about people, and a mapping to associate a name with a favorite number.

## StorageFactory.sol

```solidity
pragma solidity ^0.8.7;

import "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public simpleStorageArray;
    
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }
    
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageFavNumber) public {
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        simpleStorage.store(_simpleStorageFavNumber);
    }
    
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        return simpleStorageArray[_simpleStorageIndex].retrieve();
    }
}
```

The `StorageFactory` contract acts as a factory for creating and managing instances of the `SimpleStorage` contract. It provides functions to create new instances, store favorite numbers in specific instances, and retrieve favorite numbers from specific instances.

## ExtraStorage.sol

```solidity
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage {
    function store(uint256 _favoriteNumber) public override {
       favoriteNumber = _favoriteNumber + 5;
    }
}
```

The `ExtraStorage` contract is an extension of the `SimpleStorage` contract. It overrides the `store` function to add 5 to the favorite number before storing it.
