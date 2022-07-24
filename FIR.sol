// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FIR{
    address public owner;
    //address of the person deploying the smart contract

    constructor() public{
        owner=msg.sender;
    }
    
    string[] public DataCriminal = ["Sai","Nilay","Zayan","Karthik","Samir"];
    
    struct DataPerson{
        string name;
        string address_person;
        string dob;
        string date;
        string time;
        string crime;
    }

    mapping(uint => DataPerson) public AllFIR;
    mapping(address => mapping(uint => DataPerson)) public MyFIR;

    function addDataPerson(uint256 _entryno, string memory _name, string memory _address_person, string memory _dob, string memory _date,
    string memory _time, string memory _crime) public
    {
        AllFIR[_entryno] = DataPerson(_name,_address_person,_dob,_date,_time,_crime);
    }

    function addMyDataPerson(uint _entryno, string memory _name, string memory _address_person, string memory _dob, string memory _date,
    string memory _time, string memory _crime) public
    {
       MyFIR[msg.sender][_entryno] = DataPerson(_name, _address_person, _dob, _date, _time, _crime);
    }

    function checkDataPerson(uint _entryno) public view returns(bool){
        for(uint i=0; i<DataCriminal.length; i++)
        {
           return keccak256(abi.encodePacked(DataCriminal[i]))==keccak256(abi.encodePacked(AllFIR[_entryno].name));      
      }
    }

    function addDataCriminal(string memory _CriminalName) public {
        DataCriminal.push(_CriminalName);
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function printDataCriminal() public view returns(string[] memory){
        return (DataCriminal);
    }
}