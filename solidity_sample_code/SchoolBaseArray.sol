pragma solidity ^0.8.0;

contract SchoolBaseArray {
  
  address[] students;
  
  constructor()  {
  }
  
  function addStudent(address student ) public {
      require(!isStudent(student));
      students.push(student);
  }
  
  
  function removeStudent(address student) public {
    (bool found, uint256 index) =  _getStudentIndex(student);
    require(found);

    for (uint256 i = index; i<students.length; ++i ) {
      students[i-1] = students[i];
    }
    students.pop();
  }

  function isStudent(address student) public view returns (bool) {
    (bool found, ) =  _getStudentIndex(student);
    return found;
  }
  
  function getStudents() public view returns(address[] memory) {
    return students;
  }

  function _getStudentIndex(address student) internal view returns (bool, uint256) {
    for (uint256 i = 0; i< students.length; ++i) {
      if (student == students[i]) {
        return (true, i);
      }
    }
    return (false, 0);
  }
  
  
} 