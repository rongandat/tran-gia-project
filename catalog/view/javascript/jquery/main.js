$(document).ready(function(){
$('.btn-drop select').live('mousedown', function(){
$(this).parents('.btn-drop').addClass('btn-drop-active');
});
$('.btn-drop select').live('focus', function(){
$(this).parents('.btn-drop').addClass('btn-drop-focus');
});
$('.btn-drop select').live('mouseenter', function(){
$(this).parents('.btn-drop').addClass('btn-drop-hover');
});
$('.btn-drop select').live('mouseleave', function(){
$(this).parents('.btn-drop').removeClass('btn-drop-hover');
});
$('.btn-drop select').live('change', function(){
$(this).parents('.btn-drop').removeClass('btn-drop-active');
$(this).parents('.btn-drop').find('dd').html($(this).find(":selected").html());
});
$('.btn-drop select').live('blur', function(){
$(this).parents('.btn-drop').removeClass('btn-drop-active btn-drop-focus');
});
$('#cart > .heading').live('mouseenter', function() {
if($('#cart').hasClass('active')) return;
$('#cart').addClass('active');
$('#cart').load('index.php?route=module/cart #cart > *');
$('#cart').live('mouseleave', function() {
$(this).removeClass('active');
});
});
$('.struct').live('mouseenter', function(){
$(this).find('.struct-left, .struct-right').stop().animate({
'height': '50%',
'width': '50%',
'opacity': 1
}, 500);
});
$('.struct').live('mouseleave', function(){
$(this).find('.struct-left, .struct-right').stop().animate({
'height': '0px',
'width': '0px',
'opacity': 0
}, 500);
});

$('.struct .image img, .struct .image .no-image').live('mouseenter', function(){
$(this).stop().animate({'opacity': '0.6'}, 400);
});
$('.struct .image img, .struct .image .no-image').live('mouseleave', function(){
$(this).stop().animate({'opacity': '1'}, 400);
});
$('.product-grid .image img, .product-grid .image .no-image').live('mouseenter', function(){
$(this).stop().animate({'opacity': '0.6'}, 400);
});
$('.product-grid .image img, .product-grid .image .no-image').live('mouseleave', function(){
$(this).stop().animate({'opacity': '1'}, 400);
});
$('.product-list .image img, .product-list .image .no-image').live('mouseenter', function(){
$(this).stop().animate({'opacity': '0.6'}, 400);
});
$('.product-list .image img, .product-list .image .no-image').live('mouseleave', function(){
$(this).stop().animate({'opacity': '1'}, 400);
});
$('.box-product-test .image img, .product-list .image .no-image').live('mouseenter', function(){
$(this).stop().animate({'opacity': '0.6'}, 400);
});
$('.box-product-test .image img, .product-list .image .no-image').live('mouseleave', function(){
$(this).stop().animate({'opacity': '1'}, 400);
});

/* Mega Menu */
$('#nav dl > dd > a + .subnav').each(function(index, element) {
// IE6 & IE7 Fixes
if ($.browser.msie && ($.browser.version == 7 || $.browser.version == 6)) {
var category = $(element).find('a');
var columns = $(element).find('ul').length;
$(element).css('width', (columns * 143) + 'px');
$(element).find('ul').css('float', 'left');
}
var menu = $('#nav').offset();
var dropdown = $(this).parent().offset();
i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#nav').outerWidth());
if (i > 0) {
$(this).css('margin-left', '-' + (i + 5) + 'px');
}
});
$('.jcarousel-skin-opencart .jcarousel-prev-horizontal, .jcarousel-skin-opencart .jcarousel-next-horizontal').live('mouseenter', function(){
$(this).switchClass("jcarousel-arrow-standart", "jcarousel-arrow-hover", 200);
});
$('.jcarousel-skin-opencart .jcarousel-prev-horizontal, .jcarousel-skin-opencart .jcarousel-next-horizontal').live('mouseleave', function(){
$(this).switchClass("jcarousel-arrow-hover", "jcarousel-arrow-standart", 500);
});
});