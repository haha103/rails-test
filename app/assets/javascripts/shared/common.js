function recaptcha_preview() {
  $('div#recaptcha_image').popover({
    html: true,
    trigger: 'hover',
    placement: 'top',
    content: function () {
      return '<img src="' + $($(this).children('img')[0]).attr('src') + '" />';
    }
  });
}

function input_tooltip() {
  $('input').tooltip({
		delay: 200
	});
}
