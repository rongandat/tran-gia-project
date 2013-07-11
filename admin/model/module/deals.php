<?php

class ModelModuleDeals extends Model {

    public function getAllProductSpecial() {
        $query = $this->db->query("SELECT p.quantity, p.image, p.price as pr_price,ps.*,pd.name FROM " . DB_PREFIX . "product p join " . DB_PREFIX . "product_special ps on p.product_id = ps.product_id LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) where pd.language_id = '" . (int) $this->config->get('config_language_id') . "'");
        return $query->rows;
    }

    public function updateDeals($data) {
        $this->db->query("UPDATE " . DB_PREFIX . "product SET quantity = '" . (int) $data['quantity'] . "', price = '" . (float) $data['pr_price'] . "' WHERE product_id = '" . (int) $product_id . "'");

        $this->db->query("DELETE FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int) $product_id . "'");
        $this->db->query("INSERT INTO " . DB_PREFIX . "product_special SET product_id = '" . (int) $product_id . "', customer_group_id = '" . (int) $data['customer_group_id'] . "', priority = '" . (int) 0 . "', price = '" . (float) $data['price'] . "', date_start = '" . $this->db->escape($data['date_start']) . "', date_end = '" . $this->db->escape($data['date_end']) . "'");
    }

}

?>