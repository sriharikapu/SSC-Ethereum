pragma solidity ^0.4.0;

contract School {

    struct ClassStruct {
        bytes32 title;
        bytes32 teacher;
        mapping(address => ClassStudentStruct) classStudentStructs;
        address[] studentList;
        bool isClass;
    }

    mapping(bytes32 => ClassStruct) public classStructs; // access by Id
    bytes32[] public classList; // enumerate the keys to the mapping

    struct StudentStruct {
        bytes32 name;
        bytes32[] bookList; // student has books
        mapping(bytes32 => bool) isStudentBook;
        bool isStudent;
    }

    mapping(address => StudentStruct) public studentStructs;
    address[] public studentList;

    struct BookStruct {
        bytes32 title;
        bytes32 author;
        bool isBook;
    }

    mapping(bytes32 => BookStruct) public bookStructs;
    bytes32[] public bookList;

    // many-to-many

    struct ClassStudentStruct {
        address student;
        bool tookTest;
        bool isClassStudent;
    }

    function getClassCount()   public constant returns(uint count) { return classList.length; }
    function getStudentCount() public constant returns(uint count) { return studentList.length; }
    function getBookCount()    public constant returns(uint count) { return bookList.length; }

    function newClass(bytes32 classId, bytes32 title, bytes32 teacher) returns(bool success) {
        if(classStructs[classId].isClass) throw; // duplicate key
        classStructs[classId].title = title;
        classStructs[classId].teacher = teacher;
        classStructs[classId].isClass = true;
        classList.push(classId);
        return true;
    }

    function newStudent(address studentAddress, bytes32 name) returns(bool success) {
        if(studentStructs[studentAddress].isStudent) throw;
        studentStructs[studentAddress].name = name;
        studentList.push(studentAddress);
        studentStructs[studentAddress].isStudent = true;
        studentList.push(studentAddress);
        return true;
    }

    function newBook(bytes32 bookId, bytes32 title, bytes32 author) returns(bool success) {
        if(bookStructs[bookId].isBook) throw;
        bookStructs[bookId].title = title;
        bookStructs[bookId].author = author;
        bookStructs[bookId].isBook = true;
        bookList.push(bookId);
        return true;
    }

    function addClassStuduent(bytes32 classId, address studentAddress) returns(bool success) {
        if(!studentStructs[studentAddress].isStudent) throw; // not a student
        if(!classStructs[classId].isClass) throw; // not a class
        if(classStructs[classId].classStudentStructs[studentAddress].isClassStudent) throw; // student already enrolled in this class

        ClassStudentStruct memory newStudent;
        newStudent.student = studentAddress;
        newStudent.isClassStudent = true;
        classStructs[classId].studentList.push(studentAddress);
        return true;
    }

    function addStudentBook(bytes32 bookId, address studentAddress) returns(bool success) {
        if(!bookStructs[bookId].isBook) throw;
        if(!studentStructs[studentAddress].isStudent) throw;
        if(studentStructs[studentAddress].isStudentBook[bookId]) throw;

        studentStructs[studentAddress].isStudentBook[bookId] = true;
        studentStructs[studentAddress].bookList.push(bookId);
        return true;
    }


    // logical deletes need a more intricate pattern - Last one here:
    // https://ethereum.stackexchange.com/questions/13167/are-there-well-solved-and-simple-storage-patterns-for-solidity 

    function delStudentBook(bytes32 bookId, address studentAddress) returns(bool success) {}
    function delClassStudent(bytes32 classId, address studentAddress) returns(bool success) {}

}
