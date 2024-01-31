pragma solidity ^0.8.0;

contract SchoolMapping {
  
  mapping(address => bool) students;
  
  constructor()  {
  }
  
  function addStudent(address student ) public {
    require(!isStudent(student));
    students[student] = true;
  }
  
  
  function removeStudent(address student) public {
    require(isStudent(student));
    students[student] = false;
  }

  function isStudent(address student) public view returns (bool) {
      return students[student];
  }
  
  function getStudents(uint256 k) public view returns(address[] memory) {
  }
  
  
} 