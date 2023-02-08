<?php include_once "header.php";?>

<article>
    <form action="?act=add-product" method="POST" ></form>
    <input type="text" name="name_product" placeholder="Tên hàng hóa">
    <br/>
    <input type="number" name="price" placeholder="Giá hàng hóa">
    <br/>
    <input type="file" name="image" placeholder="Hình ảnh">
    <br/>
    <button type="submit" name="add_product">Add</button>
    <br/>
</article>

<?php include_once "footer.php";?>