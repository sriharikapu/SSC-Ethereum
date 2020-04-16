/**
 *Submitted for verification at Etherscan.io on 2020-04-16
*/

pragma solidity >=0.4.22 <0.7.0;

/**
 * @title Storage
 * @dev Store & retreive value in a variable
 */
contract Storage {

    string question;

    /**
     * @dev Store value in variable
     * @param q value to store
     */
    function store(string q) public {
        question = q;
    }

    /**
     * @dev Return value 
     * @return value of 'question'
     */
    function retreive() public view returns (string){
        return question;
    }
}
