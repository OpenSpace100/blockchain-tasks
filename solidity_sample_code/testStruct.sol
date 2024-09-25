pragma solidity ^0.8.0;

contract testStruct {
    struct Person {
        address account;
        bool gender;
        uint8 age;
    }

    Person public chairman;

    function setChairman(address _acc, bool _g, uint8 _age) public {
        // chairman = Person(_acc, _g, _age);
        chairman = Person({
         account: _acc,
         age: _age,
         gender: _g
         }) ;
    }

    function getChairman() public view returns  (address, bool, uint8 ) {
        return (chairman.account, chairman.gender, chairman.age);
    }

    struct Student {
        string name;
        mapping(address=>uint) score;
        int age;
    }

    struct Funder {
        address addr;
        uint amount;
    }

    mapping (uint => Funder) public funders;
    mapping (uint => Student) public students;


    function updateStudent(uint id) public {
        Student storage student = students[id];
        student.name = "abc";
        student.age = 19;
       // student = Student({ name: "abc", age : 19 });
    }

    function updateStudentKey(uint id, address key, uint value) public {
        Student storage student = students[id];
        student.score[key] = value;
    }

    function getStudentScore(uint id, address key) public view returns (uint) {
        Student storage student = students[id];
        return student.score[key];
    }

    function contribute(uint id) public payable {
        funders[id] = Funder({addr: msg.sender, amount: msg.value});
        // funders[id] = Funder(msg.sender, msg.value);

        Funder storage funder = funders[id];
        funder.addr = msg.sender;
        funder.amount = msg.value;
    }

    function getFund(uint id) public view returns  (address, uint ) {
        return (funders[id].addr, funders[id].amount);
    }

}