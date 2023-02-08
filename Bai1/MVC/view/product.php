<?php include_once "header.php";?>

<article>
    <a href="?act=addProduct">Thêm sản phẩm</a>
    <table border="1">
        <tr>
            <th>STT</th>
            <th>Tên sản phẩm</th>
            <th>Hình ảnh</th>
            <th>Giá</th>
            <th>Action</th>
        </tr>

        <?php foreach($products as $key => $product) :?>
        <tr>
            <td><?= $key + 1 ?></td>
            <td><?= $product["name"] ?></td>
            <td>
                <img src="<?= $product["image"] ?>" alt="">    
            </td>
            <td><?= $product["price"] ?></td>
            <td>Sửa / Xóa</td>
        </tr>
        <?php endforeach; ?>
    </table>
</article>

<?php include_once "footer.php";?>