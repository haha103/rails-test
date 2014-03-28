// I don't like coffee scripts because they are UGLY!
// Use decent JS instead
$(document).ready(function() {
	
	switch (location.pathname) {
	case "/users/new":
		recaptcha_preview();
		users_new_form_validate();
		input_tooltip();
		break;
	default:
		break;
	}
});

function input_tooltip() {
  $('input').tooltip({ 
    delay: 200
  });
}

function users_new_form_validate() {
	$.validator.addMethod("uniqueInDB", function(value, element) {
    return this.optional(element) || !ajaxValidate("users", "exists", $(element).attr("name") + "=" + value);
  });

	$('form#haha-form-signup').validate({
		debug: true,
    rules: {
      "user[user_name]": { required: true, uniqueInDB: true }
    },
    messages: {
			"user[user_name]": { required: "您必须取一个用户名", uniqueInDB: "您来晚啦，别人已经把这个名字占用啦" }
    },
    highlight: function(element) {
      fg = $(element).closest('.form-group');
      fg.removeClass('has-success');
      fg.addClass('has-error');
    },
    unhighlight: function(element) {
      fg = $(element).closest('.form-group');
      fg.removeClass('has-error');
      $(element).closest('.validate-message').remove();
    },
    success: function(element) {
      fg = $(element).closest('.form-group');
			fg.removeClass('has-error');
			fg.addClass('has-success');
      $(element).closest('.validate-message').remove();
		},
		errorElement: 'span',
		errorClass: 'haha-validate-error validate-message',
		errorPlacement: function(error, element) {
			if ($(element).parent().attr("class") == "input-group") {
				error.insertAfter($(element).closest(".input-group"));
			} else {
				error.insertAfter($(element));
			}
		},
    submitHandler: function(form) {
      form.submit();
    }
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

function ajaxValidate(controller, action, key_val_pair) {
	var result = false;
  $.ajax({
    url: '/' + controller + '/' + action,
    type: 'get',
    async: false,
    data: key_val_pair,
    success: function(data) {
      //console.log(data);
      result = data.result;
    },
    error: function(e) {
      console.log(e.message);
    }
  });
  console.log(result);
  return result;
}

