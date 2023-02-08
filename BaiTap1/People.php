<?php

class People {
    public $fullName;
    public $birdDay;
    public $addDress;

    public function __construct($fullName, $birdDay, $addDress) 
    {
        $this->fullName = $fullName;
        $this->birdDay = $birdDay;
        $this->addDress = $addDress;
    }

    public function getInfo() {
        echo "Họ tên: {$this->fullName}, quên quán: {$this->addDress}";
    } 
}


