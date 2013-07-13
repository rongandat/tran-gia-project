<div class="clear"></div>
<div id="wapper-footer">
    <div id="footermenu">
        <div id="links">
            <div class="moduletable_menu">
                <ul class="menu">
                    <li><a href="<?php echo $home; ?>"><span><?php echo $text_home; ?></span></a></li>
                    <?php if ($informations) { ?>
                        <?php foreach ($informations as $information) { ?>
                            <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                        <?php } ?>
                    <?php } ?>
                    <li><a href="<?php echo $contact; ?>"><span><?php echo $text_contact; ?></span></a></li>
                </ul>
            </div>
        </div>
    </div>
    <div id="footer" class="clearfix">
            <?php echo $config_info_footer ?>
    </div>
</div>
</div>
</body></html>