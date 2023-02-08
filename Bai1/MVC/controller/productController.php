<?php

    function indexProduct() {
        $products = getData('SELECT * FROM products');
        include_once 'view/product.php';
    }

    function addProduct()
    {
        include_once 'view/addProduct.php';
    }