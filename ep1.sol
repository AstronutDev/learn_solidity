// SPDX-License-Identifier: GPL-3.0

//version
pragma solidity ^0.8.0;

//contract
contract Hellocontract {
    //state var
    string str = "helloworld";
    int a = 10;
    uint b = 20;
    uint8 c = 30;
    bool t = true;
    bytes myByte = 'B';
    address myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    struct Guitar {
        uint id;
        uint price;
        string name;
    }
    uint [] numlists = [1,2,3,4,5];

    Guitar g = Guitar(2,2,"Ibanez");

    function getStr() public view returns (string memory) {
        return str;
    }

    function setStr(string memory _str) public {
        str = _str;
    }

    function addnumber(uint _a, uint _b) public returns (uint) {
        return _a + _b;
    }

    function prtList() public view returns (uint) {
   
        for (uint i=0; i<numlists.length; i++) {
            // uint8 sum = 0;
            // sum += numlists[i];
            return numlists[2];
        }
    }


}