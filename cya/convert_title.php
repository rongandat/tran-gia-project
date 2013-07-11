<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function convertTitle($text) {

        $text = trim(strip_tags($text));
        $text = htmlspecialchars($text);

        $CLEAN_URL_REGEX = '*([\s$+,/:=\?@"\'<>%{}|\\^~[\]`\r\n\t\x00-\x1f\x7f]|(?(?<!&)#|#(?![0-9]+;))|&(?!#[0-9]+;)|(?<!&#\d|&#\d{2}|&#\d{3}|&#\d{4}|&#\d{5});)*s';
        $text = preg_replace($CLEAN_URL_REGEX, '-', strip_tags($text));
        $text = trim(preg_replace('#-+#', '-', $text), '-');

        $code_entities_match = array('\\', '&quot;', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '+', '{', '}', '|', ':', '"', '<', '>', '?', '[', ']', '', ';', "'", ',', '.', '_', '/', '*', '+', '~', '`', '=', ' ', '---', '--', '--');
        $code_entities_replace = array('', '', '-', '-', '', '', '', '-', '-', '', '', '', '', '', '', '', '-', '', '', '', '', '', '', '', '', '', '-', '', '-', '-', '', '', '', '', '', '-', '-', '-', '-');
        $text = str_replace($code_entities_match, $code_entities_replace, $text);

        $chars = array("a", "A", "e", "E", "o", "O", "u", "U", "i", "I", "d", "D", "y", "Y");
        $uni [0] = array("á", "à", "ạ", "ả", "ã", "â", "ấ", "ầ", "ậ", "ẩ", "ẫ", "ă", "ắ", "ằ", "ặ", "ẳ", "� �", "ả", "á");
        $uni [1] = array("Á", "À", "Ạ", "Ả", "Ã", "Â", "Ấ", "Ầ", "Ậ", "Ẩ", "Ẫ", "Ă", "Ắ", "Ằ", "Ặ", "Ẳ", "� �");
        $uni [2] = array("é", "è", "ẹ", "ẻ", "ẽ", "ê", "ế", "ề", "ệ", "ể", "ễ", "ệ");
        $uni [3] = array("É", "È", "Ẹ", "Ẻ", "Ẽ", "Ê", "Ế", "Ề", "Ệ", "Ể", "Ễ");
        $uni [4] = array("ó", "ò", "ọ", "ỏ", "õ", "ô", "ố", "ồ", "ộ", "ổ", "ỗ", "ơ", "ớ", "ờ", "ợ", "ở", "� �");
        $uni [5] = array("Ó", "Ò", "Ọ", "Ỏ", "Õ", "Ô", "Ố", "Ồ", "Ộ", "Ổ", "Ỗ", "Ơ", "Ớ", "Ờ", "Ợ", "Ở", "� �");
        $uni [6] = array("ú", "ù", "ụ", "ủ", "ũ", "ư", "ứ", "ừ", "ự", "ử", "ữ", "ù");
        $uni [7] = array("Ú", "Ù", "Ụ", "Ủ", "Ũ", "Ư", "Ứ", "Ừ", "Ự", "Ử", "Ữ");
        $uni [8] = array("í", "ì", "ị", "ỉ", "ĩ");
        $uni [9] = array("Í", "Ì", "Ị", "Ỉ", "Ĩ");
        $uni [10] = array("đ");
        $uni [11] = array("Đ");
        $uni [12] = array("ý", "ỳ", "ỵ", "ỷ", "ỹ");
        $uni [13] = array("Ý", "Ỳ", "Ỵ", "Ỷ", "Ỹ");

        for ($i = 0; $i <= 13; $i++) {
            $text = str_replace($uni[$i], $chars[$i], $text);
        }

        $characters = '0123456789abcdefghijklmnopqrstuvwxyz-';
        $textReturn = '';
        for ($i = 0; $i <= strlen($text); $i++) {
            if ($text[$i]) {
                $text[$i] = strtolower($text[$i]);
                if (preg_match("/{$text[$i]}/i", $characters)) {
                    $textReturn .= $text[$i];
                }
            }
        }

        $text = strtolower($textReturn);

        return $text;
    }
?>
