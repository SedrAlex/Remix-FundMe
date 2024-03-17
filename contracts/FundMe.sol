// Get  funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

interface AggregatorV3Interface {

  function decimals() external view returns (uint8);
  function description() external view returns (string memory);
  function version() external view returns (uint256);

  // getRoundData and latestRoundData should both raise "No data present"
  // if they do not have data to report, instead of returning unset values
  // which could be misinterpreted as actual reported values.
  function getRoundData(uint80 _roundId)
    external
    view
    returns (
      uint80 roundId,
      int256 answer,
      uint256 startedAt,
      uint256 updatedAt,
      uint80 answeredInRound
    );
  function latestRoundData()
    external
    view
    returns (
      uint80 roundId,
      int256 answer,
      uint256 startedAt,
      uint256 updatedAt,
      uint80 answeredInRound
    );

}

contract FundMe {

    uint256 public  minimumUSD = 50;

    function fund() public payable {

           //we want to send an amount fund amount in USD
           //1. How do we send eth to this contract? 

           require(msg.value > minimumUSD, "Didn't send enough"); //1e18 == 1 * 10 ** 18 =100

           //what is reverting?
           //undo any action before, and send remaining gas back
}

    function getPrice() public {
        //ABI
        //Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
    }

    function getVersion() public view returns (uint256){
          AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
          return  priceFeed.version();
    }
    function getConversionRate() public {

    }
    }
 