<?php

class ControllerModuletntyahoo extends Controller {

    protected function index() {
        $this->load->language('module/tnt_yahoo');

        $this->data['heading_title'] = $this->language->get('heading_title');
        $this->data['lable_mobile'] = $this->language->get('lable_mobile');
        $this->data['lable_yahooid'] = $this->language->get('lable_yahooid');
        $this->data['lable_skypeid'] = $this->language->get('lable_skypeid');


        $content = '';
        for ($i = 1; $i <= 5; $i++) {
            $yahooid = $this->config->get('tnt_yahoo_yahooid' . $i);
            $mobile = $this->config->get('tnt_yahoo_mobile' . $i);
            $image = $this->config->get('tnt_yahoo_image' . $i);
            if ($yahooid != '' && $mobile != '') {
                $content .='<b>' . $yahooid . '</b><br>			
				<a href="ymsgr:sendim?' . $yahooid . '">
				<img src="http://opi.yahoo.com/online?u=' . $yahooid . '&t=' . $image . '"></a><br>
				' . $this->data['lable_yahooid'] . ': ' . $yahooid . '<br>
				' . $this->data['lable_mobile'] . ': ' . $mobile . '
				<br><br>';
            }
        }
        $skype_array = Array(1 => 'balloon', 2 => 'bigclassic', 3 => 'smallclassic', 4 => 'smallicon', 5 => 'mediumicon');


        for ($i = 1; $i <= 5; $i++) {

            $sid = $this->config->get('tnt_skype_skypeid' . $i);
            $mobile = $this->config->get('tnt_skype_mobile' . $i);
            $image = $this->config->get('tnt_skype_image' . $i);

            if ($sid != '' && $mobile != '') {
                $image = !empty($image) ? $image : 1;
                $skype_img = $skype_array[$image];
                $content .='<b>' . $sid . '</b><br>
                                <a href="skype:' . $sid . '?chat">
				<img src="http://mystatus.skype.com/' . $skype_img . '/' . $sid . '"></a><br>
				' . $this->data['lable_skypeid'] . ': ' . $sid . '<br>
				' . $this->data['lable_mobile'] . ': ' . $mobile . '
				<br><br>';
            }
        }

        $this->data['code'] = $content;

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/tnt_yahoo.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/module/tnt_yahoo.tpl';
        } else {
            $this->template = 'default/template/module/tnt_yahoo.tpl';
        }

        $this->render();
    }

}

?>