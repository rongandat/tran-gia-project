

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

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

   
    /*
     * 
     * get data samsung.com/
     */

    function getData() {


        $dom = new DOMDocument('1.0', 'utf-8');
        $dom->loadHTMLFile('http://phady.com.vn/');
        $xpath = new DOMXPath($dom);
        $links = $xpath->query('.//ul[@class="menu"]/li/a');
        echo $dom->saveHTML();die;
        foreach ($links as $key => $clink) {
            $cUrl = 'http://phady.com.vn/' . $xpath->query('.//@href',$clink)->item(0)->nodeValue;
            $category['category_name'] = $clink->nodeValue;
            var_dump($category);die;
            $data['main_category'] = $this->addCategory($category);
            
            $dom = new DOMDocument('1.0', 'utf-8');
            $dom->loadHTML($cUrl);
            $xpath = new DOMXPath($dom);
            $productLinks = $xpath->query('.//div[@id="product_list"]/div/div/div/a/@href');
            foreach($productLinks as $plink){
                $pr_link = 'http://phady.com.vn/' . $plink->nodeValue;
                $this->GetPdata($pr_link,$data);
            }
            
        }
//        echo $dom->saveHTML();
    }

    function GetPdata($url,$data) {
      
        $dom = new DOMDocument('1.0', 'utf-8');
        $dom->loadHTMLFile(trim($url));
        $xpath = new DOMXPath($dom);

        $images = $xpath->query('.//div[@class="MagicToolboxContainer"]/a/img/@src');

        $data['images'] = array();
        $database = new dataBase();


        foreach ($images as $image) {

            $image = $image->nodeValue;

            $sounth = $image;
            $image_name = end(explode('/', $sounth));
            $path = realpath(dirname(dirname(__FILE__))) . '/image/data/' . $image_name;
            if (copy($sounth, $path)) {
                $data['images'][] = 'data/' . $image_name;
            }
        }

        $data['name'] = $xpath->query('.//div[@class="moduletable_hilite"]/h3')->item(0)->nodeValue;
        $data['sku'] = 'vnq23';
        $data['price'] = (int)$xpath->query('.//span[@class="productPrice"]')->item(0)->nodeValue;
        $descriptions = $xpath->query('.//*[@id="vmMainPage"]/table/tr/td/p');
        $data['description'] = '';
        foreach ($descriptions as $description) {
            $data['description'] .= '<p>'.$dom->saveHTML($description).'</p>';
        }

        $product = $this->addProduct($data);
    }

    public function getSupCategory($data) {

        $dom = new DOMDocument('1.0', 'utf-8');

        $dom->load('supplier.xml');

        $dom->formatOutput = true;

        $xmlXpath = new DOMXPath($dom);

        $data['category_name'] = $xmlXpath->query('.//supplier_category')->item(0)->nodeValue;

        return $this->addCategory($data);
    }

    public function addCategory($data) {

        $database = new dataBase();

        $database->query("INSERT INTO " . DB_PREFIX . "category SET 

                        parent_id = '" . 0 . "',

                        `column` = '" . (int) 1 . "',

                        sort_order = '" . 1 . "', status = '" . 1 . "',
                            
                        date_modified = NOW(), date_added = NOW()");

        $category_id = $database->lastInsertId();
        $data['keyword'] = 's' . $category_id . '-' . convertTitle($data['category_name']);
        if ($data['keyword']) {
            $database->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'category_id=" . (int) $category_id . "', keyword = '" . ($data['keyword']) . "'");
        }

        foreach ($this->language as $language_id) {

            $database->query("INSERT INTO " . DB_PREFIX . "category_description SET 

                category_id = '" . (int) $category_id . "', 

                language_id = '" . (int) $language_id . "', 

                name = '" . ($data['category_name']) . "', 

                meta_keyword = '', 

                meta_description = '', 

                description = ''");
        }

        return $category_id;
    }

    public function getSupplier() {

        $dom = new DOMDocument('1.0', 'utf-8');

        $dom->load('supplier.xml');

        $dom->formatOutput = true;

        $xmlXpath = new DOMXPath($dom);

        $data['name'] = $xmlXpath->query('.//supplier_name')->item(0)->nodeValue;

        $data['url'] = $xmlXpath->query('.//supplier_link')->item(0)->nodeValue;

        $data['logo'] = $xmlXpath->query('.//supplier_logo')->item(0)->nodeValue;

        $supplierStatus = $xmlXpath->query('.//supplier_status')->item(0);

        $data['status'] = $supplierStatus->nodeValue;

        $data['company'] = $xmlXpath->query('.//supplier_company')->item(0)->nodeValue;

        $data['address'] = $xmlXpath->query('.//supplier_address')->item(0)->nodeValue;

        $data['mobile'] = $xmlXpath->query('.//supplier_mobile')->item(0)->nodeValue;

        $data['fax'] = $xmlXpath->query('.//supplier_fax')->item(0)->nodeValue;

        $data['email'] = $xmlXpath->query('.//supplier_email')->item(0)->nodeValue;

        $data['phone'] = $xmlXpath->query('.//supplier_phone')->item(0)->nodeValue;

        $data['main_category'] = $xmlXpath->query('.//main_category')->item(0)->nodeValue;

        $supplierFunction = $xmlXpath->query('.//supplier_function')->item(0)->nodeValue;

        $data['function'] = $supplierFunction;


        return $this->getInfoSupplier($data);
    }

    public function getInfoSupplier($supplier) {

//        $xpath = $this->loadXpath($link);

        $database = new dataBase();


        //check username exists

        $supplier_data = $database->fetchRow('select * from ' . DB_PREFIX . 'supplier where username = "' . $supplier['name'] . '"');
        $logo = '';

        if (!$supplier_data) {

            $dirPath = SUPPLIER_PATH . '/' . $supplier['name'];

            if (!is_dir($dirPath)) {

                mkdir($dirPath, 0777, true);
            }

            $imgName = '';

            if (!empty($supplier['logo'])) {


                $server_info = getServerActive();
                $data_image['filename'] = end(explode('/', $supplier['logo']));
                $data_image['password'] = $server_info['server_password'];
                $data_image['name'] = $supplier['name'];
                $data_image['source'] = $supplier['logo'];
                $curl = new Curl();
                $result = $curl->curlPost($server_info['server_script'], $data_image);
                $result = json_decode($result);

                $logo = '';
                if ($result->success == 1) {
                    $logo = $result->image;
                }
            }

            $sql = "INSERT INTO " . DB_PREFIX . "supplier SET name = '" . ($supplier['company']) . "',

            username = '" . $supplier['name'] . "',

            email = '" . ($supplier['email']) . "',

            password = '" . (md5('123456')) . "',

            supplier_group_id = '1',

            url = '',

            address = '" . ($supplier['address']) . "',

            phone = '" . ($supplier['mobile']) . "',

            publish_phone = '" . ($supplier['phone']) . "',

            fax = '" . ($supplier['fax']) . "',

            image_link = '" . $logo . "',

            status = '1',date_added = NOW()";

            $database->query($sql);

            $supplier_id = $database->lastInsertId();
            if ($supplier['name']) {
                $database->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'supplier_id=" . (int) $supplier_id . "', keyword = '" . ($supplier['name']) . "'");
            }
            return $supplier_id;
        } else {

            return $supplier_data->supplier_id;
        }
    }

    public function encrypt_password($plain) {
        $password = '';
        for ($i = 0; $i < 10; $i++) {
            $password .= rand();
        }

        $salt = substr(md5($password), 0, 2);

        $password = md5($salt . $plain) . ':' . $salt;

        return $password;
    }

}

$cron = new cronjob();
//echo $cron->encrypt_password('123456');die;
$cron->getData();
echo 1;
die('131312');
?>
