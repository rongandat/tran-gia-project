<?php foreach ($banners as $key => $banner) { ?>
    <?php if ($key == 0) { ?>
        <div style="z-index: 9999; position: fixed; top: 20px; left: 5px;">
            <?php if ($banner['link']) { ?>
                <div><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a></div>
            <?php } else { ?>
                <div><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></div>
            <?php } ?>
        </div>
    <?php } ?>

    <?php if ($key == 1) { ?>
        <div style="z-index: 9999; position: fixed; top: 20px; right: 5px;">
            <?php if ($banner['link']) { ?>
                <div>
                    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a>
                </div>
            <?php } else { ?>
                <div>
                    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" />
                </div>
            <?php } ?>
        </div>
    <?php } ?>

<?php } ?>
