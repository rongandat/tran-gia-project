<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

// get contents of a file into a string
$path = realpath(dirname(__FILE__));
$filename = $path . "/css/style.css";
$handle = fopen($filename, "r");
$contents = fread($handle, filesize($filename));
fclose($handle);


preg_match_all("/url\((.*?)\)/si", $contents, $out);
foreach ($out[1] as $link) {
    $link = str_replace(array('"','\''), array('',''), $link);
    $img_name = end(explode('/', $link));
    $link = 'http://amthuctrangia.vn/templates/greysimple-tg/images/' . $img_name;
    echo $link;
    @copy($link, $path . '/css/' . $img_name);
}
?>
