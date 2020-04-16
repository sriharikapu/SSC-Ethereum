/**
 *Submitted for verification at Etherscan.io on 2020-04-16
*/

pragma solidity >=0.4.22 <0.7.0;

/**
 * @title Storage
 * @dev Store & retreive value in a variable
 */
contract Storage {

    string FirstName;
    string LastName;
    uint256 AGE;
    string DOB;
    uint256 PhoneNumber;
    string EmailId;

    /**
     * @dev Store value in variable
     * 
     */
    function store(string q1,string q2,uint256 q3,string q4, uint256 q5, string q6) public {
        FirstName = q1;
        LastName = q2;
        AGE = q3;
        DOB = q4;
        PhoneNumber = q5;
        EmailId = q6;
    }
    

    /**
     * @dev Return value 
     * @return value of 'question'
     */
    function question1() public view returns (string){
        return FirstName;
    
    }
        /**
     * @dev Return value 
     * @return value of 'question'
     */
    function question2() public view returns (string){
        return LastName;
    
    }
        /**
     * @dev Return value 
     * @return value of 'question'
     */
    function question3() public view returns (uint256){
        return AGE;
    
    }
        /**
     * @dev Return value 
     * @return value of 'question'
     */
    function question4() public view returns (string){
        return DOB;
    
    }
            /**
     * @dev Return value 
     * @return value of 'question'
     */
    function question5() public view returns (uint256){
        return PhoneNumber;
    
    }
          /**
     * @dev Return value 
     * @return value of 'question'
     */
    function question6() public view returns (string){
        return EmailId;
    
    }
}
