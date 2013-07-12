<?php
/**
 * @version		$Id: visitor.tpl 721 2010-03-11 15:40:47Z mic $
 * @package		Visitor - Module 4 OpenCart - Template
 * @copyright	(C) 2010 mic [ http://osworx.net ]. All Rights Reserved.
 * @author		mic - http://osworx.net
 * @license		http://www.gnu.org/copyleft/gpl.html GNU/GPL
 */
?>

<div class="box">
	<div class="top">
		<img src="catalog/view/theme/default/image/counter/counter.gif" width="16" height="16" alt="" /><?php echo $heading_title; ?>
	</div>
	<div class="middle">
    	<div>
			<img src="<?php echo $imgPath; ?>today.png" width="16" height="16" alt="" />
			&nbsp;<?php echo $data['day']; ?>&nbsp;<?php echo $text_today; ?>
		</div>
		<div>
			<img src="<?php echo $imgPath; ?>week.png" width="16" height="16" alt="" />
			&nbsp;<?php echo $data['week']; ?>&nbsp;<?php echo $text_week; ?>
		</div>
		<div>
			<img src="<?php echo $imgPath; ?>month.png" width="16" height="16" alt="" />
			&nbsp;<?php echo $data['month']; ?>&nbsp;<?php echo $text_month; ?>
		</div>
		<div>
			<img src="<?php echo $imgPath; ?>year.png" width="16" height="16" alt="" />
			&nbsp;<?php echo $data['year']; ?>&nbsp;<?php echo $text_year; ?>
	 	</div>
	 	<div>
			<img src="<?php echo $imgPath; ?>all.png" width="16" height="16" alt="" />
			&nbsp;<?php echo $data['all']; ?>&nbsp;<?php echo $text_all; ?>
		</div>
		<div style="padding: 5px 22px;">
			<?php echo $data['online'] .' '. $text_online; ?>
		</div>
		<?php echo $oxfooter; ?>
	</div>
	<div class="bottom">&nbsp;</div>
</div>