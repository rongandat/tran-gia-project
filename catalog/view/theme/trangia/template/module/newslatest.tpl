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
    <div class="boxTintuc">
        <div class="box-heading"><h1><?php echo $heading_title; ?></h1></div>
        <div class="box-content">
            <div id="ja-last">
                <ul class="ja-last clearfix">
                    <?php foreach ($newss as $news) {  ?>
                        <li>
                            <?php if ($news['thumb']) { ?>
                                <a href="<?php echo $news['href']; ?>" class="mostread-image">
                                    <img src="<?php echo $news['thumb']; ?>" alt="<?php echo $news['name']; ?>" title="<?php echo $news['name']; ?>" width="<?php echo $news['width']; ?>" height="<?php echo $news['height']; ?>">					</a>
                            <?php } ?>
                            <div class="box-right">
                                <a href="<?php echo $news['href']; ?>" class="mostread"><?php echo $news['name']; ?></a>
                                <span><?php echo $news['date_added']; ?></span>
                            </div>

                        </li>
                    <?php } ?>
                </ul>
            </div>
        </div>
    </div>                  

<?php } ?>
