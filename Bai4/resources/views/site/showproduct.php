<h1>Show Product</h1>
<?php foreach ($products as $product) : ?>
<div>
    <h3>
        <?= $product->name ?>
        <?= $product->detail ?>
    </h3>
</div>
<?php endforeach; ?>