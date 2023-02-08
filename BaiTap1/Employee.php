<?php

require_once "People.php";

class Employee extends People {
    public $id;
    public $workingDays;
    public $totalLeaveTaken;
    public $dailyWage;

    public function __construct($fullName, $birdDay, $addDress, $id, $workingDays, $totalLeaveTaken, $dailyWage) {
        parent::__construct($fullName, $birdDay, $addDress);
        $this->id = $id;
        $this->workingDays = $workingDays;
        $this->totalLeaveTaken = $totalLeaveTaken;
        $this->dailyWage = $dailyWage;
    }

    public function getSalaryAmount() {
        if($this->totalLeaveTaken > $this->workingDays) {
            return 0;
        }
        return ($this->workingDays - $this->totalLeaveTaken) * $this->dailyWage;
    }

    public function showInfo() {
        echo "{$this->getInfo()}, lương: {$this->getSalaryAmount()} $$";
    }
}


$employee = new Employee("Tuấn", "18-11-2003", "HN", "PH001", 20, 0, 1000);

$employee->showInfo();