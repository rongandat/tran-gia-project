<?php

echo'42';
//set POST variables
$url = 'http://global.lc/index.php?page=sci_validate';


foreach($_POST as $key => $post){
    $fields[$key] = urldecode($post);
}

//url-ify the data for the POST
foreach ($fields as $key => $value) {
    $fields_string .= $key . '=' . $value . '&';
}
$validate_field = 'validate='.base64_encode($fields_string);
rtrim($fields_string, '&');

//open connection
$ch = curl_init();

//set the url, number of POST vars, POST data
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_POST, count($fields));
curl_setopt($ch, CURLOPT_POSTFIELDS, $validate_field);

//execute post
$result = curl_exec($ch);

//close connection
curl_close($ch);

var_dump($result);die;
?>
