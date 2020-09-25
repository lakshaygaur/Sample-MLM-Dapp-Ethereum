pragma solidity >=0.4.22 <0.7.0;

/**
 * @title MLM
 * Grow your network, earn ether
 */
contract MLM {
    
    /**
     * Slot type to buy, and downline addresses
     */
    struct Slot {
        uint256 amount; // slot amount to be 800, 1600 or 3200
        uint32 members;
        // address first ; // +50% to the user
        // address second ; // +50% to the user
        // address third ; // +50% to the user
        // address fourth ; // +100% to upline
        // address fifth ; // +100% to admin
    }
    

    address public owner;
    
    mapping(address => uint256) public users;
    mapping(address => address[]) public downlines;
    mapping(address => Slot) public slots;

    /**
     * Store value in variable
     * num value to store
     */
    function buySlot(uint256 amount, address upline_addr) public {
        
        downlines[upline_addr].push(msg.sender); // set downline
        
        initSlot(amount); // check slot status

        // update existing slot of the upline
        Slot storage upline_slot = slots[upline_addr] ;
        upline_slot.members ++ ;
        if (upline_slot.members == 5 ) {
            // reset slot ;
        }
    }
    
    function initSlot(uint256 amount) internal{
        Slot memory slot ; 
        slot.amount = amount ;
    }


}