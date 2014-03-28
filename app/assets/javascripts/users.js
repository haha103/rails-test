// I don't like coffee scripts because they are UGLY!
// Use decent JS instead
$(document).ready(function(){
	switch (location.pathname) {
	case "/users/new":
		recaptcha_preview();
		users_new_form_validate();
		break;
	default:
		break;
	}
});

function users_new_form_validate() {
	$('form#haha-form-signup').validate({
	});
}

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
