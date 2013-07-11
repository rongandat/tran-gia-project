<?php if ($position == 'content_top' or $position == 'content_bottom') { ?>
    <div class="box-news-left">
        <div class="box-heading"><?php echo $heading_title; ?></div>
        <div class="box-content">
            <div class="box-product-left">
                <?php foreach ($newss as $news) { ?>
                    <div>
                        <?php if ($news['thumb']) { ?>
                            <div class="image"><a href="<?php echo $news['href']; ?>"><img src="<?php echo $news['thumb']; ?>" alt="<?php echo $news['name']; ?>" <?php echo $news['width']; ?> <?php echo $news['height']; ?> /></a></div>
                        <?php } ?>
                        <div class="name"><a href="<?php echo $news['href']; ?>"><?php echo $news['name']; ?></a></div>

                        <?php echo $news['short_description']; ?>

                    </div>
                <?php } ?>
            </div>
        </div>
    </div>

<?php } else { ?>                            
    <div class="box">
    <div class="box-heading"><h1><?php echo $heading_title; ?></h1></div>
    <div class="box-content">
        <div class="box-product-page">
            <?php foreach ($newss as $news) { ?>
                <div>
                    <?php if ($news['thumb']) { ?>
                        <div class="image"><a href="<?php echo $news['href']; ?>"><img src="<?php echo $news['thumb']; ?>" alt="<?php echo $news['name']; ?>" <?php echo $news['width']; ?> <?php echo $news['height']; ?> /></a></div>
                    <?php } ?>
                    <div class="name"><a href="<?php echo $news['href']; ?>"><?php echo $news['name']; ?></a></div>

                    <?php echo $news['short_description']; ?>
                </div>
            <?php } ?>
        </div>
    </div>
</div>                  

<?php } ?>
