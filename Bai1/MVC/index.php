<?php 
    require_once "model/database.php";
    require_once "controller/productController.php";
    $act = $_GET['act'] ?? '';

    switch($act) {
        case '':
        case 'home':
            include_once "view/home.php";
            break;
        case 'about':
            include_once "view/about.php";
            break;
        case 'contact':
            include_once "view/contact.php";
            break;
        case 'product':
            indexProduct();
            break;
        case 'addProduct':
            addProduct();
            break;
        default:
            include_once "view/404.php";
            break;
    }