pragma solidity ^0.8.0;

contract SchoolMappingList {
  
  mapping(address => address) _nextStudents;
  uint public listSize;

  address constant GUARD = address(1);
  
  constructor()  {
    _nextStudents[GUARD] = GUARD;
  }
  
  function addStudent(address student ) public {
    require(!isStudent(student));

    _nextStudents[student] = _nextStudents[GUARD];
    _nextStudents[GUARD] = student;
    listSize ++;
  }
  
  
  function removeStudent(address student) public {
    require(isStudent(student));
    address prevStudent = _getPrevStudent(student);
    _nextStudents[prevStudent] = _nextStudents[student];

    _nextStudents[prevStudent] = address(0);
    listSize --;
  }

  function removeStudent2(address student, address prevStudent) public {
    require(isStudent(student));
    require(_nextStudents[prevStudent] == student);

    _nextStudents[prevStudent] = _nextStudents[student];
    _nextStudents[student] = address(0);
    listSize --;
  }

  function _getPrevStudent(address student) internal view returns (address) {
    address currentAddress = GUARD;
    while (_nextStudents[currentAddress] != GUARD) {
      if (_nextStudents[currentAddress] == student) {
        return currentAddress;
      }
      currentAddress = _nextStudents[currentAddress];
    }
    return address(0);
  }

  function isStudent(address student) public view returns (bool) {
      return _nextStudents[student] != address(0);
  }
  
  function getStudents() public view returns (address[] memory) {
    address[] memory students = new address[](listSize);
    address currentAddress = _nextStudents[GUARD];
    for(uint256 i =0 ; currentAddress != GUARD; ++i) {
      students[i] = currentAddress;
      currentAddress = _nextStudents[currentAddress];
    }
    return students;
  }
  
  
} 