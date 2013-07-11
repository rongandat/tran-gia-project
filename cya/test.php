<?php

define('DIR_IMAGE', realpath(dirname(__FILE__) . '/image/data'));


function cUrl($url, $fields) {
//url-ify the data for the POST
    $fields_string = '';
    foreach ($fields as $key => $value) {
        $fields_string .= $key . '=' . $value . '&';
    }
    rtrim($fields_string, '&');

//open connection
    $ch = curl_init();

//set the url, number of POST vars, POST data
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, count($fields));
    curl_setopt($ch, CURLOPT_POSTFIELDS, $fields_string);

//execute post
    $result = curl_exec($ch);

//close connection
    curl_close($ch);
}

function resize($filename, $width, $height) {
    if (!file_exists(DIR_IMAGE . $filename) || !is_file(DIR_IMAGE . $filename)) {
        return;
    }

    $info = pathinfo($filename);
    $extension = $info['extension'];

    $old_image = $filename;
    $new_image = 'cache/' . utf8_substr($filename, 0, strrpos($filename, '.')) . '-' . $width . 'x' . $height . '.' . $extension;

    if (!file_exists(DIR_IMAGE . $new_image) || (filemtime(DIR_IMAGE . $old_image) > filemtime(DIR_IMAGE . $new_image))) {
        $path = '';

        $directories = explode('/', dirname(str_replace('../', '', $new_image)));

        foreach ($directories as $directory) {
            $path = $path . '/' . $directory;

            if (!file_exists(DIR_IMAGE . $path)) {
                @mkdir(DIR_IMAGE . $path, 0777);
            }
        }

        $image = new Image(DIR_IMAGE . $old_image);
        $image->resize($width, $height);
        $image->save(DIR_IMAGE . $new_image);
    }

    if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
        return HTTPS_IMAGE . $new_image;
    } else {
        return HTTP_IMAGE . $new_image;
    }
}

if (!empty($_FILES['uploadedfile'])) {
    $url = 'http://sanbox.lc:81/script.php';
    $file = $_FILES['uploadedfile'];
    $result = cUrl($url, $file);

    
}
?>
<form enctype="multipart/form-data" action="" method="POST">
    Choose a file to upload: <input name="uploadedfile" type="file" /><br />
    <input type="submit" value="Upload File" />
</form>    