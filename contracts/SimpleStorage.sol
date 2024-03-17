// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

//it is really important for contracts to work wi
//EVM Ethereum virtual machine
//Avalanche, Fantom,Polygon
contract SimpleStorage{
	 //boollean, uint,int address, bytes
	 uint256  favouriteNumber;
     //mapping when looking a favourtie number using string key
	 mapping(string => uint256) public nameToFavouriteNumber;
	 
	 struct People{
		uint256 favouriteNumber;
		string name;
	 }

	 	 People[] public people;

	 function store(uint256 _favouriteNumber) public  virtual {
		favouriteNumber = _favouriteNumber;
        retrieve();
 }
	 //view, pure
	 function retrieve() public view returns (uint256){
		return favouriteNumber;
	 }

	 //calldata, memory, storage
	 function addPerson(string memory _name, uint256 _favouriteNumber) public {
		people.push(People(_favouriteNumber, _name));
		nameToFavouriteNumber[_name] = _favouriteNumber;
	 }
}
//0xd9145CCE52D386f254917e481eB44e9943F39138