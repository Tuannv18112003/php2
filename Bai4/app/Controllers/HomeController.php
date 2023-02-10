<?php

namespace App\Controllers;

use App\Models\CategoryModel;
use App\Models\ProductModel;

class HomeController extends Controller
{
    public function index()
    {

        $cate = new CategoryModel();
        $product = $cate->all();
        $this->view('home', ['product' => $product]);
    }


    public function contact()
    {
        $this->view('contact');
    }

    public function show()
    {
        $product = ProductModel::all();
        $this->view('site/showproduct', ['products' => $product]);
    }
}
