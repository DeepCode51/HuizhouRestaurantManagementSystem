$(function() {
		var $list = $('ul li');
		$list.filter(':first').addClass('animated flipInX');
		setInterval(function() {
			if( $list.filter('.flipInX').index() !== $list.length) {
				$list.filter('.flipInX').removeClass('animated flipInX').next().addClass('animated flipInX');
			}
		}, 400);
	});