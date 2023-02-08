<?php 
namespace App\Controllers;

class HomeController {
    public function index() {
        echo static::class . "Method Index";
    }


    public function contact() {
        echo static::class . "Method Contact";
    }
}