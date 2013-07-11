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
            <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
        </div>
        <div class="content">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                <table id="special" class="list">
                    <thead>
                        <tr>
                            <td class="left"><?php echo $entry_group; ?></td>
                            <td class="left"><?php echo $entry_product; ?></td>
                            <td class="left"><?php echo $entry_quantity; ?></td>
                            <td class="left"><?php echo $entry_price; ?></td>
                            <td class="left"><?php echo $entry_special; ?></td>
                            <td class="left"><?php echo $entry_start; ?></td>
                            <td class="left"><?php echo $entry_end; ?></td>
                            <td class="left"><?php echo $entry_image; ?></td>
                            <td class="right"><?php echo $entry_sort_order; ?></td>
                            <td class="right"><?php echo $entry_top; ?></td>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $special_row = 0; ?>
                        <?php foreach ($deals as $deals_product) { ?>
                            <tr>
                                <td class="left">
                                    <select name="deals_product[<?php echo $special_row; ?>][customer_group_id]">
                                        <?php foreach ($customer_groups as $customer_group) { ?>
                                            <?php if ($customer_group['customer_group_id'] == $deals_product['customer_group_id']) { ?>
                                                <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                                            <?php } else { ?>
                                                <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                                            <?php } ?>
                                        <?php } ?>
                                    </select>
                                </td>
                                <td class="left">
                                    <input type="text" class="deals_product" name="deals_product[<?php echo $special_row; ?>][product_id]" value="<?php echo $deals_product['product_id'] ?>" />
                                    <div class="product_name"><?php echo $deals_product['name'] ?></div>
                                </td>
                                <td class="left"><input type="text" class="quantity" name="deals_product[<?php echo $special_row; ?>][quantity]" value="<?php echo $deals_product['quantity'] ?>" /></td>
                                <td class="left"><input type="text" class="price" name="deals_product[<?php echo $special_row; ?>][pr_price]" value="<?php echo $deals_product['pr_price']; ?>" /></td>
                                <td class="left"><input type="text" class="price_special" name="deals_product[<?php echo $special_row; ?>][price]" value="<?php echo $deals_product['price']; ?>" /></td>
                                <td class="left"><input type="text" name="deals_product[<?php echo $special_row; ?>][date_start]" value="<?php echo $deals_product['date_start']; ?>" class="date" /></td>
                                <td class="left"><input type="text" name="deals_product[<?php echo $special_row; ?>][date_end]" value="<?php echo $deals_product['date_end']; ?>" class="date" /></td>

                                <td class="left">
                                    <div class="image">
                                        <img class="thumb" src="<?php echo $deals_product['thumb']; ?>" alt="" id="thumb<?php echo $special_row; ?>" />
                                        <input class="image" type="hidden" name="deals_product[<?php echo $special_row; ?>][image]" value="<?php echo $deals_product['image']; ?>" id="image<?php echo $special_row; ?>" />
                                        <br />
                                        <a onclick="image_upload('image<?php echo $special_row; ?>', 'thumb<?php echo $special_row; ?>');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb<?php echo $special_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image<?php echo $special_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a>
                                    </div>
                                </td>
                                <td class="left"><input type="text" name="deals_product[<?php echo $special_row; ?>][sort]" value="" size="2"/></td>
                                <td class="left"><input type="checkbox" name="deals_product[<?php echo $special_row; ?>][top]" value="1" width="1"/></td>
                                <td class="left"><a onclick="$('#special-row<?php echo $special_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
                            </tr>
                            <?php $special_row++; ?>
                        <?php } ?>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="10"></td>
                            <td class="left"><a class="button" onclick="addDeals();"><?php echo $button_add_special; ?></a></td>
                        </tr>
                    </tfoot>
                </table>


                <table id="module" class="list">
                    <thead>
                        <tr>
                            <td class="left"><?php echo $entry_limit; ?></td>
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
                                <td class="left"><input type="text" name="deals_module[<?php echo $module_row; ?>][limit]" value="<?php echo $module['limit']; ?>" size="1" /></td>
                                    <?php if (isset($error_image[$module_row])) { ?>
                                        <span class="error"><?php echo $error_image[$module_row]; ?></span>
                                    <?php } ?></td>
                                <td class="left"><select name="deals_module[<?php echo $module_row; ?>][layout_id]">
                                        <?php foreach ($layouts as $layout) { ?>
                                            <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                                                <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                                            <?php } else { ?>
                                                <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                                            <?php } ?>
                                        <?php } ?>
                                    </select></td>
                                <td class="left"><select name="deals_module[<?php echo $module_row; ?>][position]">
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
                                <td class="left"><select name="deals_module[<?php echo $module_row; ?>][status]">
                                        <?php if ($module['status']) { ?>
                                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                            <option value="0"><?php echo $text_disabled; ?></option>
                                        <?php } else { ?>
                                            <option value="1"><?php echo $text_enabled; ?></option>
                                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                        <?php } ?>
                                    </select></td>
                                <td class="right"><input type="text" name="deals_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
                                <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
                            </tr>
                        </tbody>
                        <?php $module_row++; ?>
                    <?php } ?>
                    <tfoot>
                        <tr>
                            <td colspan="5"></td>
                            <td class="left"><a onclick="addModule();" class="button"><?php echo $button_add_module; ?></a></td>
                        </tr>
                    </tfoot>
                </table>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
    $('.date').datepicker({dateFormat: 'yy-mm-dd'});
    $('.datetime').datetimepicker({
        dateFormat: 'yy-mm-dd',
        timeFormat: 'h:m'
    });
    $('.time').timepicker({timeFormat: 'h:m'});
    
    var special_row = <?php echo $special_row; ?>;
    function addDeals() {
        html  = '<tbody id="special-row' + special_row + '">';
        html += '  <tr>'; 
        html += '    <td class="left"><select name="deals_product[' + special_row + '][customer_group_id]">';
<?php foreach ($customer_groups as $customer_group) { ?>
            html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>';
<?php } ?>
        html += '    </select></td>';		
        html += '    <td class="left"><input type="text" class="deals_product" name="deals_product[' + special_row + '][product_id]" value="" /><div class="product_name"></div></td>';
        html += '    <td class="left"><input type="text" class="quantity" name="deals_product[' + special_row + '][quantity]" value="" /></td>';
        html += '    <td class="left"><input type="text" class="price" name="deals_product[' + special_row + '][price]" value="" /></td>';
        html += '    <td class="left"><input type="text" class="price_special" name="deals_product[' + special_row + '][price_special]" value="" /></td>';
        html += '    <td class="left"><input type="text" name="deals_product[' + special_row + '][date_start]" value="" class="date" /></td>';
        html += '    <td class="left"><input type="text" name="deals_product[' + special_row + '][date_end]" value="" class="date" /></td>';
        html += '    <td class="left"><div class="image"> <img class="thumb" src="<?php echo $no_image; ?>" alt="" id="thumb' + special_row + '" /><input class="image" type="hidden" name="deals_product[' + special_row + '][image]" value="" id="image' + special_row + '" /><br /><a onclick="image_upload(\'image' + special_row + '\', \'thumb' + special_row + '\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb' + special_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image' + special_row + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a></div></td>';
        html += '    <td class="left"><input type="text" name="deals_product[' + special_row + '][sort]" value="" size=2/></td>';
        html += '    <td class="left"><input type="checkbox" name="deals_product[][top]" value="1" width="1"/></td>';
        html += '    <td class="left"><a onclick="$(\'#special-row' + special_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
        html += '  </tr>';
        html += '</tbody>';
	
        $('#special tfoot').before(html);
 
        $('#special-row' + special_row + ' .date').datepicker({dateFormat: 'yy-mm-dd'});
	
        special_row++;
    }
    
    //--></script> 
<script type="text/javascript"><!--
    function image_upload(field, thumb) {
        $('#dialog').remove();
	
        $('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
        $('#dialog').dialog({
            title: '<?php echo $text_image_manager; ?>',
            close: function (event, ui) {
                if ($('#' + field).attr('value')) {
                    $.ajax({
                        url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
                        dataType: 'text',
                        success: function(text) {
                            $('#' + thumb).replaceWith('<img src="' + text + '" alt="" id="' + thumb + '" />');
                        }
                    });
                }
            },	
            bgiframe: false,
            width: 800,
            height: 400,
            resizable: false,
            modal: false
        });
    };
    //--></script> 
<script type="text/javascript"><!--
    $(".deals_product").live("focus", function (event) {
        $(this).autocomplete({
            delay: 500,
            source: function(request, response) {
                var e = $(this);
                $.ajax({
                    url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
                    dataType: 'json',
                    success: function(json) {		
                        response($.map(json, function(item) {
                            return {
                                label: item.name,
                                value: item.product_id
                            }
                        }));
                    }
                });
            }, 
            select: function(event, ui) {
                var e = $(this);
                $.ajax({
                    url: 'index.php?route=module/deals/autocomplete&token=<?php echo $token; ?>&product_id=' +  encodeURIComponent(ui.item.value),
                    dataType: 'json',
                    success: function(json) {		
                        e.parents('tr').find('.quantity').val(json.quantity)
                        e.parents('tr').find('.price').val(json.price)
                        e.parents('tr').find('.thumb').attr('src', json.thumb)
                        e.parents('tr').find('.image').val(json.image)
                        e.next('.product_name').html(json.name);
                    }
                });
                $(this).val(ui.item.value);
					
                return false;
            },
            focus: function(event, ui) {
                return false;
            }
        });
    });
    

    $('#deals-product div img').live('click', function() {
        $(this).parent().remove();
	
        $('#deals-product div:odd').attr('class', 'odd');
        $('#deals-product div:even').attr('class', 'even');

        data = $.map($('#deals-product input'), function(element){
            return $(element).attr('value');
        });
					
        $('input[name=\'deals_product\']').attr('value', data.join());	
    });
    //--></script> 
<script type="text/javascript"><!--
    var module_row = <?php echo $module_row; ?>;

    function addModule() {	
        html  = '<tbody id="module-row' + module_row + '">';
        html += '  <tr>';
        html += '    <td class="left"><input type="text" name="deals_module[' + module_row + '][limit]" value="5" size="1" /></td>';
        html += '    <td class="left"><select name="deals_module[' + module_row + '][layout_id]">';
<?php foreach ($layouts as $layout) { ?>
            html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
<?php } ?>
        html += '    </select></td>';
        html += '    <td class="left"><select name="deals_module[' + module_row + '][position]">';
        html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
        html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
        html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
        html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
        html += '    </select></td>';
        html += '    <td class="left"><select name="deals_module[' + module_row + '][status]">';
        html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
        html += '      <option value="0"><?php echo $text_disabled; ?></option>';
        html += '    </select></td>';
        html += '    <td class="right"><input type="text" name="deals_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
        html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
        html += '  </tr>';
        html += '</tbody>';
	
        $('#module tfoot').before(html);
	
        module_row++;
    }
    //--></script> 
<?php echo $footer; ?>