Solidity

## day1 / ep1: var

- variable => type, assignment

- function => setter & getter

## dat2 / ep2: visibility and mutability

- Visibility

  - public
  - private
  - internal
  - external

- Mutability

  - view -> มีการจัดการค่าในฟักชัน / get ค่าออกมา แต่ไม่มีการเปลี่ยนแปลงแก้ไขค่าในฟังก์ชัน
  - pure -> ฟังก์ชันนั้นไม่มีการยุ่งกับ state var
  - notting -> ใช้ตอนมีแก้ไขค่า

- Date location

  - storage -> จะเก็บข้อมูลลง block (เป็นตัวแปรแบบ call by ref) -> มองตัวมันเป็น pointer -> การ assign เป็นการชี้

  - memory -> อยู่ในหน่วยความจำ (ไม่โดนเขียนลง block) -> เป็น call by value -> การ assign เป็นการ copy ค่า

  - calldata ???

  - stack ???

---

memory จะต่างกับ stack ที่ stackมีขนาดจำกัด
stack จะใช้กับ premetive type - uint, bool, address

!!!การประกาศ memory กับ storage ต้องคำนึงถึงเรื่อง gas!!!
