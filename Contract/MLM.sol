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
    
    uint256 users_count;
    
    mapping(address => uint256) public users;
    mapping(address => address[]) public downlines;
    mapping(address => Slot[]) public slots;

    constructor() public {
        owner = msg.sender ;
        users_count ++; 
        users[msg.sender] = users_count ;
    }

    /**
     * Store value in variable
     * num value to store
     */
    function buySlot(uint256 amount, address payable upline_addr) public payable{
        
        downlines[upline_addr].push(msg.sender); // set downline
        
        initSlot(amount, msg.sender); // check slot status
        
        // update existing slot of the upline
        Slot storage upline_slot = slots[upline_addr][slots[upline_addr].length - 1 ] ;
        upline_slot.members ++ ;
        if (upline_slot.members == 5 ) {
            // reset slot ;
            initSlot(amount, upline_addr) ;
        }
        upline_addr.transfer(amount);
    }
    
    function initSlot(uint256 amount, address myAddress) internal{
        Slot memory slot ; 
        slot.amount = amount ;
        
        // my_slot = initSlot(amount); // check slot status
        Slot[] storage my_existing_slots = slots[msg.sender]  ;
        my_existing_slots.push(slot) ;
        slots[myAddress] = my_existing_slots;
    }
    
    receive()  external payable   {}
     fallback()  external payable   {
         log3(bytes32(msg.value),
            bytes32(0),
            bytes32(uint256(msg.sender)),
            bytes32("_id"));
     }


}
