pragma solidity ^0.8.0;

contract testStruct {
    struct Person {
        address account;
        bool gender;
        uint8 age;
    }

    Person public chairman;

    function setChairman(address _acc, bool _g, uint8 _age) public {
        chairman = Person(_acc, _g, _age);
        // Person memory person =  Person({account: _acc, gender: _g, age: _age}) ;
    }

    function getChairman() public view returns  (address, bool, uint8 ) {
        return (chairman.account, chairman.gender, chairman.age);
    }

    struct Student {
        string name;
        mapping(string=>uint) score;
        int age;
    }

    struct Funder {
        address addr;
        uint amount;
    }

    mapping (uint => Funder) funders;

    function contribute(uint id) public payable {
        funders[id] = Funder({addr: msg.sender, amount: msg.value});
        // funders[id] = Funder(msg.sender, msg.value);

    }

    // function getFund(uint id) public view returns  (address, uint ) {
    //     return (funders[id].addr, funders[id].amount);
    // }

}