//topic -> 1.Visibility
// - public
// - private
// - internal
// - external

// 2.mutability
// - view   : มีการจัดการค่าใน func แต่ไม่มีการเปลี่ยนแปลงค่า
// - pure  : func นั้นไม่มีการไปยุ่งกับ state var
// - notting : ใช้ตอนเขียน
// ทำไมต้องใส่ เพราะมีผลต่อเรื่อง gas ที่จะไปต่อกับ web3js

// 3. data location
//- storage : ที่เก็บข้อมูลแปป percistant => เขียนลงใน block เลย (ตัวแปรแบบ call by ref)
//VS
//- memory : อยู่ในหน่วยความจำ (ตัวแปรแบบ call by value) (การ assgin จะเป็นการ copy ค่ามาใส่)
// - type string
// - struct
//-stack : อยู่ในหน่วยความจำ
//- calldata

//memory กับ stack ต่างกันที่ stack มีขนาดจำกัด
// และ stack ใช้กับตัวแปร premetive type
// - uint
// - bool
// - address

//การประกาศแบบ memory กับ storage มีผลต่อเรื่อง gas!!

pragma solidity ^0.8.0;

contract Day2 {
    //state var
    uint256 number = 9;
    string name = "nut";

    function getNum() public view returns (uint256) {
        return number;
    }

    function setNum(uint256 _number) public {
        number = _number;
    }

    function pureFunc() public pure returns (uint256) {
        uint256 a = 4;
        a++;
        return a;
    }

    //data location
    function setText(string memory _name) public returns (string memory) {
        //การประกาศตัวแปร string ใน ฟังก์ชันจะต่างกับตัวแปร state ของ contact -> ต้องมีการระบุ mulabity ด้วย
        // string name2 = "hoho";  [Error]

        //ตัวแปร storage ไม่สามารถประกาศตัวแปรพร้อม assigment ค่าได้ เพราะ storage จะเป็นการบอกว่าชี้ไปที่ obj
        // string storage name2 = "hh"; [Error]

        //แต่ถ้าเป็นถ้าประกาสตัวแปรก่อน และค่อยกำหนดค่าทำได้
        string storage name3; // ตอนประกาศมันจะเป็นอารม pointer ที่จะรอชี้
        // name3 = [pointer]

        // name3 = "god";   //[error]
        name3 = name; // ชี้ไปยังตัวแปร name
        // name3 => [pointer] => name
        name = "stone";
        // return name3;  จะได้ output เป็น stone => เพราะเป็น call by ref

        //ตัวแปร memory สามารถปะกาศตัวแปรพร้อม assigment ค่าได้
        string memory hobby = "programming";

        return hobby;
    }

    //example

    struct Guitar {
        uint256 id;
        string name;
    }

    Guitar[] guitars;

    function setGuitar() public returns (Guitar memory) {
        Guitar memory guitar = Guitar(1, "Ibanez");
        guitars.push(Guitar(99, "Ibanez"));
        guitar = guitars[0];
        guitars[0].name = "Fender";
        return guitars[0];
    }

    function setGuitarStorage() public returns (Guitar memory) {
        Guitar storage guitar;
        guitars[0] = Guitar(1, "Ibanez");
        guitar = guitars[0];
        guitars[0].name = "Fender";
        return guitars[0];
    }
}
