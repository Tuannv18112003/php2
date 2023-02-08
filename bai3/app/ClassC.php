<?php
    namespace App;

    class ClassC implements InterfaceModel {
        public function show()
        {
            echo "<br> Hiển thị thông tin sản phẩm";
        }

        public function insert($name)
        {
            echo "<br> Bạn vừa thêm 1 sản phẩm $name vào";
        }

        public function create($color)
        {
            echo "<br> Bạn vừa tạo 1 thuộc tính màu $color";
        }
    }