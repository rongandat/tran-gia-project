<div class="box">
    <div class="box-heading"><?php echo $heading_title; ?></div>
    <div class="box-content ngocfix">
        <div class="box-product">
            <?php foreach ($products as $key => $product) { ?>
                <?php
                if ($key + 1 == 1 || $key + 1 == 4 || $key + 1 == 7 || $key + 1 == 10 || $key + 1 == 13 || $key + 1 == 16 || $key + 1 == 19 || $key + 1 == 22 || $key + 1 == 25) {
                    $class = "first";
                } elseif ($key + 1 == 3 || $key + 1 == 6 || $key + 1 == 9 || $key + 1 == 12 || $key + 1 == 15 || $key + 1 == 18 || $key + 1 == 21 || $key + 1 == 24 || $key + 1 == 27) {
                    $class = "last";
                } else {
                    $class = "";
                }
                ?>
                <div class="<?php echo $class; ?>">
                    <?php if ($product['thumb']) { ?>
                        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
                    <?php } ?>
                    <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                    <?php if ($product['price']) { ?>
                        <div class="price">
                            <?php if (!$product['special']) { ?>
                                <?php echo $product['price']; ?>
                            <?php } else { ?>
                                <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
                            <?php } ?>
                        </div>
                    <?php } ?>
                    <?php if ($product['rating']) { ?>
                        <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
                    <?php } ?>
                    <div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div>
                </div>
            <?php } ?>
        </div>
    </div>
</div>
