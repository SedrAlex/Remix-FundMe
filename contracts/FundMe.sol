// Get  funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import"./PriceConverter.sol";


contract FundMe {

  using  PriceConverter for uint256;

    uint256 public  minimumUSD = 50 * 1e18; // 1 * 10 ** 18

    address[] public funders;
    mapping (address => uint256) public addressToAmountFunded;

      //we want to send an amount fund amount in USD
      //1. How do we send eth to this contract? 
    function fund() public payable {
           require(msg.value.getConversionRate() >= minimumUSD, "Didn't send enough"); //1e18 == 1 * 10 ** 18 =100 
           // 18 decimals
           funders.push(msg.sender);
           addressToAmountFunded[msg.sender] = msg.value;
           
           //what is reverting?
           //undo any action before, and send remaining gas back
}

function withdraw() public{

  /*starting index, ending index, step amount*/
  for( uint256 funderIndex  = 0; funderIndex < funders.length ;funderIndex++){

    address funder = funders[funderIndex];
    addressToAmountFunded[funder] = 0;
  }
  //reset the array
    funders = new address[](0);
  //actually withdraw the funds

  //transfer
  payable(msg.sender).transfer(address(this).balance);
  //send
  bool sendSuccess = payable(msg.sender).send(address(this).balance);
  require(sendSuccess,"send failed");
  // this is the most favourabile approach that is used to send native Etherium
  //call
    (bool callSuccess,)= payable(msg.sender).call{value: address(this).balance}("");
    require(callSuccess, "call failed");

}
    
    }
 