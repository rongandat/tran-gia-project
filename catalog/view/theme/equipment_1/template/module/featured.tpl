<div class="box">
    <div class="box-heading"><h1><?php echo $heading_title; ?></h1></div>
    <div class="box-content">
        <div class="box-product">
            <?php foreach ($products as $product) { ?>
                <div class="struct">

                    <div class="struct-right" style="height: 0px; width: 0px; opacity: 0;"></div>
                    <div class="struct-left" style="height: 0px; width: 0px; opacity: 0;"></div>

                    <div class="struct-center">
                        <?php if ($product['thumb']) { ?>
                            <a class="image-link" href="<?php echo $product['href']; ?>">
                                <div class="image"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></div>
                            </a>
                        <?php } ?>

                        <div class="saleblock">
                            <?php if ($product['price'] && $product['special']) { ?>
                                <span class="saleicon sale">Sale</span>
                            <?php } ?>
                        </div>		
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
                        <div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div>
                    </div> <!-- struct-center -->

                </div>
            <?php } ?>
        </div>
    </div>
</div>


