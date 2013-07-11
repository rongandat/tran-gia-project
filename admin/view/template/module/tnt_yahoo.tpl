<?php echo $header; ?>
<div id="content">
<div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
</div>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="heading">
    <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      <table class="form">
        <tr>
          <td><span class="required">*</span> <?php echo $entry_code; ?> 1</td>
          <td><?php echo $entry_yahooid; ?>1: <input type="text"  name="tnt_yahoo_yahooid1" value="<?php echo $tnt_yahoo_yahooid1; ?>" size="20"></td>
          <td><?php echo $entry_mobile; ?>1: <input type="text"  name="tnt_yahoo_mobile1" value="<?php echo $tnt_yahoo_mobile1; ?>" size="20"></td>
          <td><?php echo $entry_image; ?>1: <input type="text"  name="tnt_yahoo_image1" value="<?php echo $tnt_yahoo_image1; ?>" size="20"></td>
        </tr>
       <tr>
          <td><span class="required">*</span> <?php echo $entry_code; ?> 2</td>
          <td><?php echo $entry_yahooid; ?>2: <input type="text"  name="tnt_yahoo_yahooid2" value="<?php echo $tnt_yahoo_yahooid2; ?>" size="20"></td>
          <td><?php echo $entry_mobile; ?>2: <input type="text"  name="tnt_yahoo_mobile2" value="<?php echo $tnt_yahoo_mobile2; ?>" size="20"></td>
          <td><?php echo $entry_image; ?>2: <input type="text"  name="tnt_yahoo_image2" value="<?php echo $tnt_yahoo_image2; ?>" size="20"></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_code; ?> 3</td>
          <td><?php echo $entry_yahooid; ?>3: <input type="text"  name="tnt_yahoo_yahooid3" value="<?php echo $tnt_yahoo_yahooid3; ?>" size="20"></td>
          <td><?php echo $entry_mobile; ?>3: <input type="text"  name="tnt_yahoo_mobile3" value="<?php echo $tnt_yahoo_mobile3; ?>" size="20"></td>
          <td><?php echo $entry_image; ?>3: <input type="text"  name="tnt_yahoo_image3" value="<?php echo $tnt_yahoo_image3; ?>" size="20"></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_code; ?> 4</td>
          <td><?php echo $entry_yahooid; ?>4: <input type="text"  name="tnt_yahoo_yahooid4" value="<?php echo $tnt_yahoo_yahooid4; ?>" size="20"></td>
          <td><?php echo $entry_mobile; ?>4: <input type="text"  name="tnt_yahoo_mobile4" value="<?php echo $tnt_yahoo_mobile4; ?>" size="20"></td>
          <td><?php echo $entry_image; ?>4: <input type="text"  name="tnt_yahoo_image4" value="<?php echo $tnt_yahoo_image4; ?>" size="20"></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_code; ?> 5</td>
          <td><?php echo $entry_yahooid; ?>5: <input type="text"  name="tnt_yahoo_yahooid5" value="<?php echo $tnt_yahoo_yahooid5; ?>" size="20"></td>
          <td><?php echo $entry_mobile; ?>5: <input type="text"  name="tnt_yahoo_mobile5" value="<?php echo $tnt_yahoo_mobile5; ?>" size="20"></td>
          <td><?php echo $entry_image; ?>5: <input type="text"  name="tnt_yahoo_image5" value="<?php echo $tnt_yahoo_image5; ?>" size="20"></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_code; ?> 6</td>
          <td><?php echo $entry_skypeid; ?>1: <input type="text"  name="tnt_skype_skypeid1" value="<?php echo $tnt_skype_skypeid1; ?>" size="20"></td>
          <td><?php echo $entry_mobile; ?>1: <input type="text"  name="tnt_skype_mobile1" value="<?php echo $tnt_skype_mobile1; ?>" size="20"></td>
          <td><?php echo $entry_image; ?>1: <input type="text"  name="tnt_skype_image1" value="<?php echo $tnt_skype_image1; ?>" size="20"></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_code; ?> 7</td>
          <td><?php echo $entry_skypeid; ?>2: <input type="text"  name="tnt_skype_skypeid2" value="<?php echo $tnt_skype_skypeid2; ?>" size="20"></td>
          <td><?php echo $entry_mobile; ?>2: <input type="text"  name="tnt_skype_mobile2" value="<?php echo $tnt_skype_mobile2; ?>" size="20"></td>
          <td><?php echo $entry_image; ?>2: <input type="text"  name="tnt_skype_image2" value="<?php echo $tnt_skype_image2; ?>" size="20"></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_code; ?> 8</td>
          <td><?php echo $entry_skypeid; ?>3: <input type="text"  name="tnt_skype_skypeid3" value="<?php echo $tnt_skype_skypeid3; ?>" size="20"></td>
          <td><?php echo $entry_mobile; ?>3: <input type="text"  name="tnt_skype_mobile3" value="<?php echo $tnt_skype_mobile3; ?>" size="20"></td>
          <td><?php echo $entry_image; ?>3: <input type="text"  name="tnt_skype_image3" value="<?php echo $tnt_skype_image3; ?>" size="20"></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_code; ?> 9</td>
          <td><?php echo $entry_skypeid; ?>4: <input type="text"  name="tnt_skype_skypeid4" value="<?php echo $tnt_skype_skypeid4; ?>" size="20"></td>
          <td><?php echo $entry_mobile; ?>4: <input type="text"  name="tnt_skype_mobile4" value="<?php echo $tnt_skype_mobile4; ?>" size="20"></td>
          <td><?php echo $entry_image; ?>4: <input type="text"  name="tnt_skype_image4" value="<?php echo $tnt_skype_image4; ?>" size="20"></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_code; ?> 10</td>
          <td><?php echo $entry_skypeid; ?>5: <input type="text"  name="tnt_skype_skypeid5" value="<?php echo $tnt_skype_skypeid5; ?>" size="20"></td>
          <td><?php echo $entry_mobile; ?>5: <input type="text"  name="tnt_skype_mobile5" value="<?php echo $tnt_skype_mobile5; ?>" size="20"></td>
          <td><?php echo $entry_image; ?>5: <input type="text"  name="tnt_skype_image5" value="<?php echo $tnt_skype_image5; ?>" size="20"></td>
        </tr>
      </table>
        <table><tr><td><b><?php echo $entry_help; ?></b></td></tr> </table>
      <table id="module" class="list">
        <thead>
          <tr>
            <td class="left"><?php echo $entry_layout; ?></td>
            <td class="left"><?php echo $entry_position; ?></td>
            <td class="left"><?php echo $entry_status; ?></td>
            <td class="right"><?php echo $entry_sort_order; ?></td>
            <td></td>
          </tr>
        </thead>
        <?php $module_row = 0; ?>
        <?php foreach ($modules as $module) { ?>
        <tbody id="module-row<?php echo $module_row; ?>">
          <tr>
            <td class="left"><select name="tnt_yahoo_module[<?php echo $module_row; ?>][layout_id]">
                <?php foreach ($layouts as $layout) { ?>
                <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
            <td class="left"><select name="tnt_yahoo_module[<?php echo $module_row; ?>][position]">
                <?php if ($module['position'] == 'content_top') { ?>
                <option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
                <?php } else { ?>
                <option value="content_top"><?php echo $text_content_top; ?></option>
                <?php } ?>
                <?php if ($module['position'] == 'content_bottom') { ?>
                <option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
                <?php } else { ?>
                <option value="content_bottom"><?php echo $text_content_bottom; ?></option>
                <?php } ?>
                <?php if ($module['position'] == 'column_left') { ?>
                <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
                <?php } else { ?>
                <option value="column_left"><?php echo $text_column_left; ?></option>
                <?php } ?>
                <?php if ($module['position'] == 'column_right') { ?>
                <option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
                <?php } else { ?>
                <option value="column_right"><?php echo $text_column_right; ?></option>
                <?php } ?>
              </select></td>
            <td class="left"><select name="tnt_yahoo_module[<?php echo $module_row; ?>][status]">
                <?php if ($module['status']) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
            <td class="right"><input type="text" name="tnt_yahoo_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
            <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
          </tr>
        </tbody>
        <?php $module_row++; ?>
        <?php } ?>
        <tfoot>
          <tr>
            <td colspan="4"></td>
            <td class="left"><a onclick="addModule();" class="button"><?php echo $button_add_module; ?></a></td>
          </tr>
        </tfoot>
      </table>
    </form>
  </div>
</div>
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {
	html  = '<tbody id="module-row' + module_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><select name="tnt_yahoo_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><select name="tnt_yahoo_module[' + module_row + '][position]">';
	html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
	html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
	html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><select name="tnt_yahoo_module[' + module_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
	html += '    <td class="right"><input type="text" name="tnt_yahoo_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';

	$('#module tfoot').before(html);

	module_row++;
}
//--></script>
<?php echo $footer; ?>