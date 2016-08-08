contract StreetCred {
    mapping (address => uint) balances;
    
    function StreetCred() {
        
    }
    
    modifier only_with_at_least(uint amount) {
        if (balances[msg.sender] < amount) throw;
        _
    }
    
    function send(address receiver, uint amount) {
        only_with_at_least(amount) {
            balances[msg.sender] -= amount;
            balances[receiver] += amount;
        }
    }
}

contract User {
    function setCred(address streetCredAddress);
}

contract Angel is User {
    StreetCred cred;
    //TODO: Each Angel needs a list of acceptors
    
    function Angel {
        
    }
    
    function setCred(address streetCredAddress) {
        cred = StreetCred(streetCredAddress);
    }
}

contract Acceptor is User {
    struct benefit {
        bool can_accept;
        uint balance;
    }
    
    StreetCred cred;
    mapping (uint => benefit) benefits;
    
    function Acceptor() {
        
    }
    
    modifier only_if_can_accept(benefit_id) { // TODO: Make sure this acceptor is part of the beneficiary's angel's acceptors
        if (!benefits[benefit_id].can_accept) throw;
        _
    }
    
    function setCred(address streetCredAddress) {
        cred = StreetCred(streetCredAddress);
    }
    
    // however we want to let acceptors get cash
    function exchange() {
        
    }
}

contract Beneficiary is User {
    struct benefit {
        bool can_receive;
        uint balance;
    }
    
    StreetCred cred;
    Angel angel;
    mapping (uint => benefit) benefits;
    
    function Beneficiary() {
        
    }
    
    modifier only_if_can_benefit(uint benefit_id) {
        if (!benefits[benefit_id].can_receive) throw;
        _
    }
    
    modifier only_with_at_least_benefits(uint benefit_id, uint amount) {
        if (benefits[benefit_id].balance < amount) throw;
        _
    }
    
    function setCred(address streetCredAddress) {
        cred = StreetCred(streetCredAddress);
    }
    
    function setAngel(address angelAddress) {
        angel = Angel(angelAddress);
    }
    
    function spend_benefit(address receiver, uint benefit_id, uint amount) {
        Acceptor acceptor = Acceptor(receiver);
        only_with_at_least_benefits(benefit_id, amount) {
            acceptor.only_if_can_accept(benefit_id) {
                cred.send(acceptor, amount);
                benefits[benefit_id].balance -= amount;
                acceptor.benefits[benefit_id].balance += amount;
            }
        }
    }
}

contract Donor is User {
    StreetCred cred;
    
    function Donor() {
        
    }
    
    function setCred(address streetCredAddress) {
        cred = StreetCred(streetCredAddress);
    }
    
    function donate(address receiver, uint benefit_id, uint amount) {
        Beneficiary beneficiary = Beneficiary(receiver);
        beneficiary.only_if_can_benefit(benefit_id) {
            cred.send(receiver, amount);
            beneficiary.benefits[benefit_id].balance += amount;
        }
    }
    
    // however we want to implement this
    function topup() {
        
    }
}