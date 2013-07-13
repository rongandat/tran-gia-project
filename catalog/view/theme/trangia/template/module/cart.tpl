<div id="cart">
    <div class="heading">
        <a>
            <div class="cart_heading_title"><?php echo $heading_title; ?></div>
            <strong><?php echo $text_items; ?></strong>
        </a>
    </div>
    <div class="content">
        <div class="arrow-up"></div>
        <div class="chat-bubble-arrow-border"></div>
        <?php if ($products || $vouchers) { ?>
        <div class="mini-cart-info">
            <table>
                <?php foreach ($products as $product) { ?>
                <tr>
                    <td class="image"><?php if ($product['thumb']) { ?>
                        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" width="<?php echo $this->config->get('config_image_cart_width'); ?>" height="<?php echo $this->config->get('config_image_cart_height'); ?>" /></a>
                        <?php } ?></td>
                    <td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                        <div>
                            <?php foreach ($product['option'] as $option) { ?>
                            - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small><br />
                            <?php } ?>
                        </div></td>
                    <td class="quantity">x&nbsp;<?php echo $product['quantity']; ?></td>
                    <td class="total"><?php echo $product['total']; ?></td>
                    <td class="remove"><img src="catalog/view/theme/trangia/image/delete.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" onclick="$('#cart').load('index.php?route=module/cart&remove=<?php echo $product['key']; ?> #cart > *');" /></td>
                </tr>
                <?php } ?>
                <?php foreach ($vouchers as $voucher) { ?>
                <tr>
                    <td class="image"></td>
                    <td class="name"><?php echo $voucher['description']; ?></td>
                    <td class="quantity">x&nbsp;1</td>
                    <td class="total"><?php echo $voucher['amount']; ?></td>
                    <td class="remove"><img src="catalog/view/theme/trangia/image/delete.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" onclick="$('#cart').load('index.php?route=module/cart&remove=<?php echo $voucher['key']; ?> #cart > *');" /></td>
                </tr>
                <?php } ?>
            </table>
        </div>
        <div class="mini-cart-total">
            <table>
                <?php foreach ($totals as $total) { ?>
                <tr>
                    <td align="right"><b><?php echo $total['title']; ?></b></td>
                    <td align="right"><span><?php echo $total['text']; ?></span></td>
                </tr>
                <?php } ?>
            </table>
        </div>
        <div class="checkout">
            <a href="<?php echo $cart; ?>" class="cya_button marginL10 "><span><?php echo $text_cart; ?></span></a>
            <a href="<?php echo $checkout; ?>" class="cya_button cya_button_red"><span><?php echo $text_checkout; ?></span></a></div>
        <?php } else { ?>
        <div class="empty"><?php echo $text_empty; ?></div>
        <?php } ?>
        <div class="cart-botton"></div>
    </div>
</div>
