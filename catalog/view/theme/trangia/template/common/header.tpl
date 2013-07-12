<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
    <head>
        <meta charset="UTF-8" />
        <title><?php echo $title; ?></title>
        <base href="<?php echo $base; ?>" />
        <?php if ($description) { ?>
            <meta name="description" content="<?php echo $description; ?>" />
        <?php } ?>
        <?php if ($keywords) { ?>
            <meta name="keywords" content="<?php echo $keywords; ?>" />
        <?php } ?>
        <?php if ($icon) { ?>
            <link href="<?php echo $icon; ?>" rel="icon" />
        <?php } ?>
        <?php foreach ($links as $link) { ?>
            <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
        <?php } ?>
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/trangia/stylesheet/stylesheet.css" />
        <?php foreach ($styles as $style) { ?>
            <link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
        <?php } ?>
        <script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
        <link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
        <script type="text/javascript" src="catalog/view/javascript/common.js"></script>
        <?php foreach ($scripts as $script) { ?>
            <script type="text/javascript" src="<?php echo $script; ?>"></script>
        <?php } ?>
        <!--[if IE 7]> 
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/trangia/stylesheet/ie7.css" />
        <![endif]-->
        <!--[if lt IE 7]>
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/trangia/stylesheet/ie6.css" />
        <script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
        <script type="text/javascript">
        DD_belatedPNG.fix('#logo img');
        </script>
        <![endif]-->
        <?php if ($stores) { ?>
            <script type="text/javascript"><!--
                $(document).ready(function() {
    <?php foreach ($stores as $store) { ?>
                $('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
            <?php } ?>
                    });
                    //--></script>
        <?php } ?>
        <?php echo $google_analytics; ?>
    </head>
    <body>
        <div id="header">
            <div class="bnflash">
                <embed src="<?php echo HTTP_SERVER; ?>image/banner.swf" alt="Banh da nem, banh da nem lang cheu" quality="high" type="application/x-shockwave-flash" wmode="transparent" width="1024" height="180" pluginspage="http://www.macromedia.com/go/getflashplayer" allowscriptaccess="always" __idm_id__="-1942421503">		
            </div>
            <div id="topmenu">
                <div id="links">
                    <div class="moduletable_menu">
                        <ul class="menu">
                            <li  id="current" class="active item1"><a href="<?php echo $home; ?>"><span><?php echo $text_home; ?></span></a></li>
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
            <div id="search" style="display: none;">
                <div class="button-search"></div>
                <input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
            </div>
            <div class="mquery">
                <marquee width="100%" scrollamount="2" scrolldelay="50" onmouseout="this.start()" onmouseover="this.stop()" behavior="scroll" direction="left"><?php echo $text_maquery; ?></marquee>
            </div>
            <?php echo $cart; ?>
        </div>

        <div id="container">
            <div id="notification"></div>
