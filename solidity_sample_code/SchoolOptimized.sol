pragma solidity ^0.8.0;

contract SchoolOptimized {
  
  mapping(address => uint256) public scores;
  mapping(address => address) _nextStudents;
  uint256 public listSize;
  address constant GUARD = address(1);
  
  constructor() {
    _nextStudents[GUARD] = GUARD;
  }
  
  function addStudent(address student, uint256 score, address candidateStudent) public {
    require(_nextStudents[student] == address(0));
    require(_nextStudents[candidateStudent] != address(0));
    require(_verifyIndex(candidateStudent, score, _nextStudents[candidateStudent]));
    scores[student] = score;
    _nextStudents[student] = _nextStudents[candidateStudent];
    _nextStudents[candidateStudent] = student;
    listSize++;
  }
  
  function increaseScore(
    address student, 
    uint256 score, 
    address oldCandidateStudent, 
    address newCandidateStudent
  ) public {
    updateScore(student, scores[student] + score, oldCandidateStudent, newCandidateStudent);
  }
  
  function reduceScore(
    address student, 
    uint256 score, 
    address oldCandidateStudent, 
    address newCandidateStudent
  ) public {
    updateScore(student, scores[student] - score, oldCandidateStudent, newCandidateStudent);
  }
  
  function updateScore(
    address student, 
    uint256 newScore, 
    address oldCandidateStudent, 
    address newCandidateStudent
  ) public {
    require(_nextStudents[student] != address(0));
    require(_nextStudents[oldCandidateStudent] != address(0));
    require(_nextStudents[newCandidateStudent] != address(0));
    if(oldCandidateStudent == newCandidateStudent)
    {
      require(_isPrevStudent(student, oldCandidateStudent));
      require(_verifyIndex(newCandidateStudent, newScore, _nextStudents[student]));
      scores[student] = newScore;
    } else {
      removeStudent(student, oldCandidateStudent);
      addStudent(student, newScore, newCandidateStudent);
    }
  }
  
  function removeStudent(address student, address candidateStudent) public {
    require(_nextStudents[student] != address(0));
    require(_isPrevStudent(student, candidateStudent));
    _nextStudents[candidateStudent] = _nextStudents[student];
    _nextStudents[student] = address(0);
    scores[student] = 0;
    listSize--;
  }
  
  function getTop(uint256 k) public view returns(address[] memory) {
    require(k <= listSize);
    address[] memory studentLists = new address[](k);
    address currentAddress = _nextStudents[GUARD];
    for(uint256 i = 0; i < k; ++i) {
      studentLists[i] = currentAddress;
      currentAddress = _nextStudents[currentAddress];
    }
    return studentLists;
  }
  
  
  function _verifyIndex(address prevStudent, uint256 newValue, address nextStudent)
    internal
    view
    returns(bool)
  {
    return (prevStudent == GUARD || scores[prevStudent] >= newValue) && 
          (nextStudent == GUARD || newValue > scores[nextStudent]);
  }
  
  function _isPrevStudent(address student, address prevStudent) internal view returns(bool) {
    return _nextStudents[prevStudent] == student;
  }
} 