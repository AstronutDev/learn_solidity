//

//Topic => comparison calculate gas_price between memory and storage
// memory, storage, calldata
// enum

pragma solidity ^0.8.6;

contract Day3 {
    string[] text;
    uint256[] numlist = [1, 2, 3];

    // แทน series ของ integer
    enum DAYS {
        SUN,
        MON,
        TUE,
        WED
    }

    constructor() {
        text.push("hello world");
    }

    function showEnum() public pure returns (DAYS) {
        return DAYS.WED;
    }

    function prtlist() public returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 0; i < numlist.length; i++) {
            sum += numlist[i];
        }
        return sum;
    }

    function setTextMemory() public view returns (string memory) {
        //26157
        string memory str1;
        str1 = text[0];
        for (uint256 i = 0; i < 10; i++) {
            str1 = "foo"; //29153
        }
        return str1; //26720
    }

    function setTextStorage() public returns (string memory) {
        //23379
        string storage str2;
        str2 = text[0];
        for (uint256 i = 0; i < 10; i++) {
            text[0] = "foo"; //43631
        }
        return str2; //26878
    }

    //ถ้ามีการปรับปรุง/จัดการกับข้อมูลใน func ให้ใช้ memory จะดีกว่า , แต่ถ้ามีชี้  storage จะดีกว่า
    // แต่ตัวแปร arrument ที่รับเข้ามา หรือ บอกตรง return จะต้องเป็น memory / calldata

    function foo() public {
        passMemory(text[0]);
        passStorage(text[0]);
    }

    function passMemory(string memory s1) public pure returns (string memory) {
        // s1 = "world";
        return s1; //23003
    }

    function passStorage(string storage s2)
        internal
        pure
        returns (string memory)
    {
        return s2;
    }

    function passCalldata(string calldata s1)
        public
        pure
        returns (string memory)
    {
        // s1 = "world";
        return s1; //22787
    }
    // calldata จะเป็นข้อมูลที่มาจากข้างนอก contact
    //s1_calldata จะชี้ข้อมูลที่อยู่นอก contact ซึ่งสามารถอ่านได้เท่านั้น ไม่สามารถแก้ไขได้
    //พูดง่ายๆคือ คนที่เรียกใช้ func นี้ คือผู้เดียวที่สามารถแก้ไขข้อมูลก่อนส่งมาได้ และเมื่อส่งเข้ามาแล้วจะไม่สามารถแก้ไขข้อมูลได้อีกต่อไป
    //memory ใช้ gas มากกว่า calldata เพราะ memory ต้อง copy ต่างจาก calldata ที่ไปชี้ตัวนอกเลย
}
