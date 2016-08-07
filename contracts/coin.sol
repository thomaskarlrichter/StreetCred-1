contract StreetCred {
    struct benefit {
        bool can_receive;
        uint balance;
    }
    
    mapping (address => uint) public balances;
    mapping (address => mapping (uint => benefit)) public benefits;
    
    modifier only_with_at_least(uint amount) {
        if (balances[msg.sender] < amount) throw;
        _
    }
    
    modifier only_with_at_least_benefits(uint benefit_id, uint amount) {
        if (benefits[msg.sender][benefit_id].balance < amount) throw;
        _
    }
    
    modifier only_if_can_benefit(address receiver, uint benefit_id) {
        if (!benefits[receiver][benefit_id].can_receive) throw;
        _
    }
    
    function send(address receiver, uint amount) {
        only_with_at_least(amount) {
            balances[msg.sender] -= amount;
            balances[receiver] += amount;
        }
    }
    
    function donate(address receiver, uint benefit_id, uint amount) {
        only_if_can_benefit(receiver, benefit_id) {
            send(receiver, amount);
            benefits[receiver][benefit_id].balance += amount;
        }
    }
}