<?php
    namespace App;
    class ClassD implements InterfaceModel
    {
        public function show()
        {
            echo "<br> Hiển thị thông tin bài viết";
        }

        public function insert($name)
        {
            echo "<br> Bạn vừa thêm 1 bài viết có tên: $name";
        }

        public function create($color)
        {
            echo "<br> Bạn vừa tạo 1 thuộc tính màu $color làm nhãn dán cho bài viết";
        }
    }



    // class animal: nói, ăn, chạy
    // 2 lớp chó, mèo kế thừa 