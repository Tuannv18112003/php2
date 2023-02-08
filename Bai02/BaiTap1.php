<?php

// Tạo một lớp sinh viên có các thuộc tính : ms , tên, điểm: >=0 and <= 100; 
// Tạo method kiểm tra điểm if điểm >= 45 -> hiển thị tên + điểm pass môn else hiển thị tên + điểm fell


class SinhVien {
    public $maSV;
    public $hoTen; 
    public $diem;


    public function __construct($maSV, $hoTen, $diem) 
    {   
        $this->maSV = $maSV;
        $this->hoTen = $hoTen;
        if($diem < 0 || $diem > 100) {
            $this->diem = 0;
        }else {
            $this->diem = $diem;
        }
    }

    public function diem() {
        if($this->diem <= 45) {
            echo "Sinh viên {$this->hoTen}: {$this->diem} trượt môn";
        }else {
            echo "Sinh viên {$this->hoTen}: {$this->diem} qua môn";
        }
    }
}

$sinhVien = new SinhVien("PH24354", "Tuấn", 100);
$sinhVien->diem();

