pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Campaign.sol";

contract TestCampaign {
  Campaign campaign = Campaign(DeployedAddresses.Campaign());

  uint256[90] valuesA = [98888,97777,96666,95555,94444,93333,92222,91111,90000,88888,
                         87777,86666,85555,84444,83333,82222,81111,80000,78888,77777,
                         76666,75555,74444,73333,72222,71111,70000,68888,67777,66666,
                         65555,64444,63333,62222,61111,60000,58888,57777,56666,55555,
                         54444,53333,52222,51111,50000,48888,47777,46666,45555,44444,
                         43333,42222,41111,40000,38888,37777,36666,35555,34444,33333,
                         32222,31111,30000,28888,27777,26666,25555,24444,23333,22222,
                         21111,20000,18888,17777,16666,15555,14444,13333,12222,11111,
                         10000,8888,7777,6666,5555,4444,3333,2222,1111,0]; 

  uint256[90] valuesB = [12500000,12500000,12500000,12400000,12400000,12400000,12400000,12300000,12300000,12300000,
                         12200000,12200000,12200000,12200000,12100000,12100000,12100000,12000000,12000000,12000000,
                         12000000,11900000,11900000,11900000,11900000,11800000,11800000,11800000,11700000,11700000,
                         11700000,11700000,11600000,11600000,11600000,11500000,11500000,11500000,11500000,11400000,
                         11400000,11400000,11400000,11300000,11300000,11300000,11200000,11200000,11200000,11200000,
                         11100000,11100000,11100000,11000000,11000000,11000000,11000000,10900000,10900000,10900000,
                         10900000,10800000,10800000,10800000,10700000,10700000,10700000,10700000,10600000,10600000,
                         10600000,10500000,10500000,10500000,10500000,10400000,10400000,10400000,10400000,10300000,
                         10300000,10300000,10200000,10200000,10200000,10200000,10100000,10100000,10100000,10000000];

uint256[90] valuesC = [500,500,500,496,496,496,496,492,492,492,
                       488,488,488,488,484,484,484,480,480,480,
                       480,476,476,476,476,472,472,472,468,468,
                       468,468,464,464,464,460,460,460,460,456,
                       456,456,456,452,452,452,448,448,448,448,
                       444,444,444,440,440,440,440,436,436,436,
                       436,432,432,432,428,428,428,428,424,424,
                       424,420,420,420,420,416,416,416,416,412,
                       412,412,408,408,408,408,404,404,404,400];

 // Testing the theFloatMultiplier() function
function testTheFirstMultiplier() {
  uint256 startTestTime = 1512086400 + 10 hours;
  var (a,b,c) = campaign.theFloatMultiplier(startTestTime);

  Assert.equal(a, valuesA[0], "float value");
  Assert.equal(b, valuesB[0], "bonus");
  Assert.equal(c, valuesC[0], "tokens per Ether");

}

function testTheMultipliers() {
  uint256 testTime = 1512086400 + 23 hours + 55 minutes;
  for(uint256 i = 0; i <= 89; i++) {
   var (a,b,c) = campaign.theFloatMultiplier(testTime + i*1 days);
  Assert.equal(a, valuesA[i], "float value");
  Assert.equal(b, valuesB[i], "bonus");
  Assert.equal(c, valuesC[i], "tokens per Ether");
  }
}
  
}
