<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
define('DB_PREFIX', '');
define('SUPPLIER_PATH', realpath(dirname(dirname(__FILE__)) . '/image/supplier/'));
require_once 'database.php';
require_once 'convert_title.php';
require_once 'curl.php';
require_once '../configServer.php';
set_time_limit(9999999999);
error_reporting(E_ERROR);

class cronjob {

    private $language = array(1, 2);

    public function loadXpath($url) {
        $dom = new DOMDocument('1.0', 'utf-8');
        $dom->loadHTMLFile(trim($url));
        $xpath = new DOMXPath($dom);
        return $xpath;
    }

    public function addProduct($data) {
        $database = new dataBase();
        $database->connect();
        //check model
        $product = $database->fetchRow("select * from " . DB_PREFIX . "product where model = '" . $data['sku'] . "'");
        if (!$product) {
            $sqlInsertProduct = "INSERT INTO " . DB_PREFIX . "product SET 
                model = '" . $data['sku'] . "', 
                sku = '" . $data['sku'] . "', 
                upc = '', 
                supplier_id = '" . $data['supplier_id'] . "',
                image_link = '" . $data['images'][0] . "', 
                location = '', 
                quantity = '100', 
                minimum = '', 
                subtract = '', 
                stock_status_id = 7, 
                date_available = '', 
                manufacturer_id = '', 
                shipping = '', 
                price = '" . (float) $data['price'] . "', 
                points = '', 
                weight = '', 
                weight_class_id = '', 
                length = '', 
                width = '', 
                height = '', 
                length_class_id = '', 
                status = 1, 
                tax_class_id = '', 
                sort_order = '" . (int) $key . "', 
                date_added = NOW()";
            $database->query($sqlInsertProduct);
            $productId = $database->lastInsertId();
            foreach ($this->language as $language_id) {


                $database->query("INSERT INTO " . DB_PREFIX . "product_description SET
                product_id = '" . (int) $productId . "', 
                language_id = '" . (int) $language_id . "', 
                name = '" . ($data['name']) . "', 
                meta_keyword = '', 
                meta_description = '" . ($data['description']) . "', 
                description = '" . ($data['description']) . "'");
            }
            $database->query("INSERT INTO " . DB_PREFIX . "product_to_store SET 
            product_id = '" . (int) $productId . "', 
            store_id = '0'");
            foreach ($data['images'] as $key => $product_image) {
                if ($key > 0) {
                    $database->query("INSERT INTO " . DB_PREFIX . "product_image SET 
                            product_id = '" . (int) $productId . "', 
                            image = '',
                            image_link = '" . (html_entity_decode($product_image, ENT_QUOTES, 'UTF-8')) . "', 
                            sort_order = '" . (int) $key . "'");
                }
            }

            $data['keyword'] = 'p' . $productId . '-' . convertTitle($data['name']);

            if ($data['keyword']) {
                $database->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'product_id=" . (int) $productId . "', keyword = '" . ($data['keyword']) . "'");
            }

            $database->query("INSERT INTO " . DB_PREFIX . "product_to_category SET 
                    product_id = '" . (int) $productId . "', 
                    category_id = '" . (int) $data['main_category'] . "'");

            $database->query("INSERT INTO " . DB_PREFIX . "product_to_category_supplier SET 
            product_id = '" . (int) $productId . "', 
            category_id = '" . (int) $data['category_supplier_id'] . "'");
            return $productId;
        } else {
            return $product;
        }
    }

    public function install() {
        $dom = new DOMDocument('1.0', 'utf-8');
        $dom->load('product.xml');
        $dom->formatOutput = true;
        $xmlXpath = new DOMXPath($dom);
        $suppliers = $xmlXpath->query('.//supplier');
        $i = 0;
        $database = new dataBase();
        $database->connect();
        foreach ($suppliers as $supplier) {
            $categories = $xmlXpath->query('.//category', $supplier);
            $data['main_category'] = $xmlXpath->query('.//main_category', $supplier)->item(0)->nodeValue;
            $data['supplier_id'] = $xmlXpath->query('.//supplier_id', $supplier)->item(0)->nodeValue;
            $function = $xmlXpath->query('.//function', $supplier)->item(0)->nodeValue;

            $supplier = $database->fetchRow("select username from " . DB_PREFIX . "supplier where supplier_id=" . (int) $data['supplier_id']);
            $data['supplier_name'] = $supplier->username;
            foreach ($categories as $key => $category) {
                $data['category_supplier_id'] = $xmlXpath->query('.//category_id', $category)->item(0)->nodeValue;
                $products = $xmlXpath->query('.//product', $category);

                foreach ($products as $product) {
                    $status = $xmlXpath->query('.//@status', $product)->item(0);
                    $product_link = $product->nodeValue;
                    if ($status->nodeValue == 0) {
                        $i++;
                        $this->$function($product_link, $data);
                        $status->nodeValue = 1;
                        if ($i > 100) {
                            break;
                        }
                    }
                }
            }
        }
        $dom->save('product.xml');
    }
    
    public function init(){
        $dom = new DOMDocument('1.0', 'utf-8');
        $dom->load('product.xml');
        $dom->formatOutput = true;
        $xmlXpath = new DOMXPath($dom);
        $suppliers = $xmlXpath->query('.//supplier');
        $i = 0;
        $database = new dataBase();
        $database->connect();
        foreach ($suppliers as $supplier) {
            $categories = $xmlXpath->query('.//category', $supplier);
            $data['main_category'] = $xmlXpath->query('.//main_category', $supplier)->item(0)->nodeValue;
            $data['supplier_id'] = $xmlXpath->query('.//supplier_id', $supplier)->item(0)->nodeValue;
            $function = $xmlXpath->query('.//function', $supplier)->item(0)->nodeValue;

            $supplier = $database->fetchRow("select username from " . DB_PREFIX . "supplier where supplier_id=" . (int) $data['supplier_id']);
            $data['supplier_name'] = $supplier->username;
        }
    }

    /*
     * 
     * get data samsung.com/
     */

    function getDataSamsung() {
        $url = 'http://www.samsung.com/vn/consumer/mobile-devices/mobile-phones/productlist';
        $curl = new Curl();

        $data['filterIaCode'] = '';
        $data['filterSearchFlag'] = 'N';
        $data['modelCodes'] = '';
        $data['page'] = '1';
        $data['rows'] = '50';
        $data['sortingTypeCode'] = 'PPL';
        $content = '<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />' . $curl->curlPost($url, $data);

        $dom = new DOMDocument('1.0', 'utf-8');
        $dom->loadHTML($content);
        $xpath = new DOMXPath($dom);
        $links = $xpath->query('.//a[@class="linkArea"]/@href');
        foreach ($links as $key => $link) {
            $pUrl = 'http://www.samsung.com' . $link->nodeValue;

            $this->GetPdata($pUrl);
        }
//        echo $dom->saveHTML();
    }

    function GetPdata($url) {
        $dom = new DOMDocument('1.0', 'utf-8');
        $dom->loadHTMLFile(trim($url));
        $xpath = new DOMXPath($dom);
        $images = $xpath->query('.//div[@class="dataBinding"]/ul/li/a/@href');
        $data['images'] = array();
        foreach ($images as $image) {

            $image = $image->nodeValue;
            
            $server_info = getServerActive();
            $data_image['filename'] = end(explode('/', $image));
            $data_image['password'] = $server_info['server_password'];
            $data_image['name'] = $data['supplier_name'];
            $data_image['source'] = $image;
            $curl = new Curl();
            $result = $curl->curlPost($server_info['server_script'], $data_image);

            $result = json_decode($result);
            $logo = '';
            if ($result->success == 1) {
                $data['images'][] = $result->image;
            }
        }
        
        $data['name'] = $xpath->query('.h1')->item(0)->nodeValue;
        $data['sku'] = $xpath->query('.//strong[@class="prdName"]')->item(0)->nodeValue;
        $data['price'] = $xpath->query('.//span[@class="price"]')->item(0)->nodeValue;
        
        $descriptions = $xpath->query('./div[@class="account"]');
        $data['description'] = '';
        foreach ($descriptions as $description){
            $data['description'] .= $dom->saveHTML($description);
        }
        
        $product = $this->addProduct($data);
    }

    function getG9mart($product_link, $data) {

        $product_link = str_replace('{and}', '&', $product_link);
        $xpath = $this->loadXpath($product_link);
        $images = $xpath->query('.//table[@class="picture_thumbnail"]/tr/td/a/@href');

        foreach ($images as $image) {
            $data['images'] = array();
            $img_link = $image->nodeValue;
            if (current(explode('/', $img_link)) == 'http:') {
                $image = $img_link;
            } else {
                $image = 'http://vatgia.com/' . $image->nodeValue;
            }

            $server_info = getServerActive();
            $data_image['filename'] = end(explode('/', $image));
            $data_image['password'] = $server_info['server_password'];
            $data_image['name'] = $data['supplier_name'];
            $data_image['source'] = $image;
            $curl = new Curl();
            $result = $curl->curlPost($server_info['server_script'], $data_image);
            $result = json_decode($result);
            $logo = '';
            if ($result->success == 1) {
                $data['images'][] = $result->image;
            }
        }
        $data['name'] = $xpath->query('.//div[@class="product_detail product_detail_v2 product_detail_v2_exclusive"]/div/h1')->item(0)->nodeValue;
        if ($data['name'] == null) {
            $data['name'] = $xpath->query('.//div[@class="product_detail product_detail_v2"]/div/h1')->item(0)->nodeValue;
        }
        $data['sku'] = end(explode(' ', trim($data['name'])));
        $data['price'] = $xpath->query('.//b[@class="price"]')->item(0)->nodeValue;
        $data['price'] = str_replace('.', '', $data['price']);
        $dom = new DOMDocument('1.0', 'utf-8');

        $description = $xpath->query('.//div[@id="technical_product"]');
        $data['description'] = $description->item(0)->nodeValue;
        $product = $this->addProduct($data);
    }

}

$cron = new cronjob();
$cron->init();
echo 1;
die('131312');
?>
