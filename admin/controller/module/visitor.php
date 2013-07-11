<?php
/*
Visitor Module code by T2vn
07 04 2012
http://www.opencart.vn
*/
class ControllerModuleVisitor extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->language->load('module/visitor');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('visitor', $this->request->post);		
					
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
		
		$this->data['entry_expire'] = $this->language->get('entry_expire');
		$this->data['entry_theme'] = $this->language->get('entry_theme');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
 		if (isset($this->error['expire'])) {
			$this->data['error_expire'] = $this->error['expire'];
		} else {
			$this->data['error_expire'] = '';
		}
		
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/visitor', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/visitor', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['visitor_expire'])) {
			$this->data['visitor_expire'] = $this->request->post['visitor_expire'];
		} else {
			$this->data['visitor_expire'] = $this->config->get('visitor_expire');
		}	
		
		if (isset($this->request->post['visitor_theme'])) {
			$this->data['visitor_theme'] = $this->request->post['visitor_theme'];
		} else {
			$this->data['visitor_theme'] = $this->config->get('visitor_theme');
		}	
		
		$this->data['themes']	= array(
			array( 'val' => 'Shopping',	'text'	=> $this->language->get('entry_th_shopping')),
			array( 'val' => 'Users',	'text'	=> $this->language->get('entry_th_users'))
		);
		$this->data['modules'] = array();
		
		if (isset($this->request->post['visitor_module'])) {
			$this->data['modules'] = $this->request->post['visitor_module'];
		} elseif ($this->config->get('visitor_module')) { 
			$this->data['modules'] = $this->config->get('visitor_module');
		}			
				
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'module/visitor.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/visitor')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->request->post['visitor_expire']) {
			$this->error['expire'] = $this->language->get('error_expire');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>