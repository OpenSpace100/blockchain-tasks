pragma solidity ^0.8.0;

contract testStruct {


struct Person {
    address account;
    bool gender;
    uint8 age;
}

Person public  person;
Person child;


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

        // Person memory person = Person(address(0x0), false, 18,  ) ;
        // Person memory person =  Person({account: address(0x0), gender: false, age: 18}) ;


    }

    // function getFund(uint id) public view returns  (address, uint ) {
    //     return (funders[id].addr, funders[id].amount);
    // }

}
