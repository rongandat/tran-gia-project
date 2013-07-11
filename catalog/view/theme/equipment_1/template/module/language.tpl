

<?php if (count($languages) > 1) { ?>
    <form id="flanguage" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="switcher">
            <div class="selected"><a><img alt="<?php echo $language['name']; ?>" src="image/flags/<?php echo $language['image']; ?>">&nbsp;&nbsp;<?php echo $language['name']; ?></a></div>
            <div class="option">
                <?php foreach ($languages as $language) { ?>
                    <a onclick="$('input[name=\'language_code\']').attr('value', '<?php echo $language['code']; ?>'); $(this).parents('form#flanguage').submit();"><img alt="<?php echo $language['name']; ?>" src="image/flags/<?php echo $language['image']; ?>">&nbsp;&nbsp;<?php echo $language['name']; ?></a>
                <?php } ?>
            </div>
        </div>
        <div>
            <input type="hidden" value="" name="language_code">
            <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
        </div>
    </form>
<?php } ?>

<script type="text/javascript">
    $('.switcher').bind('click', function() {
        $(this).find('.option').slideToggle('fast');
    });
    $('.switcher').bind('mouseleave', function() {
        $(this).find('.option').slideUp('fast');
    }); 
</script>