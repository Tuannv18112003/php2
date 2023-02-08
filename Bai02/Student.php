<?php

class Student {
    public $name="Tuấn";
    public $noId="PH24354";

    public function getInfo() {
        echo "Sinh viên tên: {$this->name} có mã số {$this->noId} <br/>";
    }
}

$student = new Student();

$student->name = "Chi béo";
$student->getInfo();

// var_dump($student);