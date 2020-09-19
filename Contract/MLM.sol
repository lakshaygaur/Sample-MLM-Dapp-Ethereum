pragma solidity >=0.4.22 <0.7.0;

/**
 * @title MLM
 * Grow your network, earn ether
 */
contract MLM {
    
    /**
     * Slot type to buy, and downline addresses
     */
    struct slot {
        address first ; // +50% to the user
        address second ; // +50% to the user
        address third ; // +50% to the user
        address fourth ; // +100% to upline
        address fifth ; // +100% to admin
    }
    
    uint256 number;
    address public owner;

    /**
     * @dev Store value in variable
     * @param num value to store
     */
    function store(uint256 num) public {
        number = num;
    }

    /**
     * @dev Return value 
     * @return value of 'number'
     */
    function retrieve() public view returns (uint256){
        return number;
    }
}