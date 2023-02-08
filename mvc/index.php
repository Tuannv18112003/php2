<?php
    require_once './app/controllers/HomeController.php';
    require_once './app/controllers/ProductController.php';

    $url = isset($_GET['url']) ? $_GET['url'] : "/";

    switch($url) {
        case '/':
            $ctr = new HomeController();
            echo $ctr->index();
            break;

        case 'detail':
            $ctr = new HomeController();
            echo $ctr->detail();
            break;

        case 'contact':
            $ctr = new HomeController();
            echo $ctr->contact();
            break;

        case 'add-product':
            $ctr = new ProductController();
            echo $ctr->add();
            break;
            
        default:
            echo "Đường dẫn không tồn tại";
            break;
    }
