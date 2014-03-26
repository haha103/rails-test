// I don't like coffee scripts because they are UGLY!
// Use decent JS instead
$(document).ready(function(){
	recaptcha_preview();
});

function recaptcha_preview() {
  $('div#recaptcha_image').popover({
    html: true,
    trigger: 'hover',
    placement: 'right',
    content: function () {
      return '<img src="' + $($(this).children('img')[0]).attr('src') + '" />';
    }
  });
}
