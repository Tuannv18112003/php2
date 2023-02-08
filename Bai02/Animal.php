<?php

class Animal {
    protected $name;
    public $weight;

    public function __construct($name, $weight) 
    {
        $this->name = $name;
        $this->weight = $weight;
    }

    public function getInfo() 
    {
        echo "Con {$this->name} nặng {$this->weight} kg <br />";
    }

    // Getter
    public function getName() {
        return $this->name;
    }

    public function setName($name) {
        return $this->name = $name;
    }

}

$animal = new Animal("Nhật chó", 100);
var_dump($animal->getName());
// $animal2 = new Animal("Dương lợn", 1000);
// $animal3 = new Animal("Chi khỉ", 69);

// $animal->getInfo();
// $animal2->getInfo();
// $animal3->getInfo();
// var_dump($animal);


// Kế thừa
class Dog extends Animal {
    public $color;
    public function __construct($name, $weight, $color) 
    {
        parent::__construct($name, $weight);
        $this->color = $color;
    }

    public function say() {
        echo "{$this->name} đang sủa Éc éc... <br/>";
    }
}

$dog = new Dog('Cậu vàng', 14, 'vàng');
$dog->say();
// var_dump($dog);


