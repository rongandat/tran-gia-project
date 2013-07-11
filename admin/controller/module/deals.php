<?php

class ControllerModuleDeals extends Controller {

    private $error = array();

    public function index() {
        $this->language->load('module/deals');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');
        $this->load->model('catalog/product');
        $this->load->model('module/deals');

        $this->load->model('tool/image');
        $this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        $this->load->model('sale/customer_group');
        $this->data['customer_groups'] = $this->model_sale_customer_group->getCustomerGroups();
        $deals = $this->model_module_deals->getAllProductSpecial();
        $this->data['deals'] = array();
        foreach ($deals as $deal) {
            $data = $deal;
            $data['thumb'] = $this->model_tool_image->resize($deal['image'], 100, 100);
            $this->data['deals'][] = $data;
        }


        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            
            $posts = $this->request->post;
//            var_dump($posts);die;
            $data['deals_module'] = $posts['deals_module'];
            $this->model_setting_setting->editSetting('deals', $data);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['text_enabled'] = $this->language->get('text_enabled');
        $this->data['text_disabled'] = $this->language->get('text_disabled');
        $this->data['text_content_top'] = $this->language->get('text_content_top');
        $this->data['text_content_bottom'] = $this->language->get('text_content_bottom');
        $this->data['text_column_left'] = $this->language->get('text_column_left');
        $this->data['text_column_right'] = $this->language->get('text_column_right');
        $this->data['text_browse'] = $this->language->get('text_browse');
        $this->data['text_clear'] = $this->language->get('text_clear');

        $this->data['entry_product'] = $this->language->get('entry_product');
        $this->data['entry_limit'] = $this->language->get('entry_limit');
        $this->data['entry_image'] = $this->language->get('entry_image');
        $this->data['entry_layout'] = $this->language->get('entry_layout');
        $this->data['entry_position'] = $this->language->get('entry_position');
        $this->data['entry_status'] = $this->language->get('entry_status');
        $this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
        $this->data['entry_group'] = $this->language->get('entry_group');
        $this->data['entry_quantity'] = $this->language->get('entry_quantity');
        $this->data['entry_price'] = $this->language->get('entry_price');
        $this->data['entry_special'] = $this->language->get('entry_special');
        $this->data['entry_start'] = $this->language->get('entry_start');
        $this->data['entry_end'] = $this->language->get('entry_end');
        $this->data['entry_top'] = $this->language->get('entry_top');

        $this->data['button_save'] = $this->language->get('button_save');
        $this->data['button_cancel'] = $this->language->get('button_cancel');
        $this->data['button_add_module'] = $this->language->get('button_add_module');
        $this->data['button_remove'] = $this->language->get('button_remove');
        $this->data['button_add_special'] = $this->language->get('button_add_special');

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        if (isset($this->error['image'])) {
            $this->data['error_image'] = $this->error['image'];
        } else {
            $this->data['error_image'] = array();
        }

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('module/deals', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['action'] = $this->url->link('module/deals', 'token=' . $this->session->data['token'], 'SSL');

        $this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

        $this->data['token'] = $this->session->data['token'];

        if (isset($this->request->post['deals_product'])) {
            $this->data['deals_product'] = $this->request->post['deals_product'];
        } else {
            $this->data['deals_product'] = $this->config->get('deals_product');
        }

        $this->load->model('catalog/product');

        if (isset($this->request->post['deals_product'])) {
            $products = explode(',', $this->request->post['deals_product']);
        } else {
            $products = explode(',', $this->config->get('deals_product'));
        }

        $this->data['products'] = array();

        foreach ($products as $product_id) {
            $product_info = $this->model_catalog_product->getProduct($product_id);

            if ($product_info) {
                $this->data['products'][] = array(
                    'product_id' => $product_info['product_id'],
                    'name' => $product_info['name']
                );
            }
        }

        $this->data['modules'] = array();

        if (isset($this->request->post['deals_module'])) {
            $this->data['modules'] = $this->request->post['deals_module'];
        } elseif ($this->config->get('deals_module')) {
            $this->data['modules'] = $this->config->get('deals_module');
        }

        $this->load->model('design/layout');

        $this->data['layouts'] = $this->model_design_layout->getLayouts();

        $this->template = 'module/deals.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    public function autocomplete() {
        $json = array();

        if (isset($this->request->get['product_id'])) {
            $id = $this->request->get['product_id'];
            $this->load->model('catalog/product');
            $product = $this->model_catalog_product->getProduct($id);
            $this->load->model('tool/image');

            if (!empty($product) && $product['image'] && file_exists(DIR_IMAGE . $product['image'])) {
                $product['thumb'] = $this->model_tool_image->resize($product['image'], 100, 100);
            } else {
                $product['thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
            }
            $json = $product;
        }
        echo json_encode($json);
    }

    protected function validate() {
        if (!$this->user->hasPermission('modify', 'module/deals')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

}

?>