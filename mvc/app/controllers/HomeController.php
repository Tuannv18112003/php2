<?php
require_once './app/models/ProductModel.php';

class HomeController {
    public function index() {
        return "Trang chủ";
    }
    
    public function detail() {
        return "Trang chi tiết";
    }

    
    public function contact() {
        return "Trang liên hệ";
    }
}
