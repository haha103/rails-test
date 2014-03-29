function formValidate(selector, rules, messages) {
	$(selector).validate({
		debug: true,
    rules: rules,
    messages: messages,
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
																									 
/***
 * Common AJAX helper for form field validations which requires communication with BE
 * Parameters:
 * - url: the url where we are requesting BE validation, e.g. "/users/exists"
 * - params: key value pairs, seperated by "&", that we are sending to BE, e.g. "user[user_name]=haha103"
 * Expected data from BE:
 * - json object with one "result" key with value either "false" or "true"
 * - e.g. { "result": true }
 * Return:
 * - return the value of the "result" key
 */
function ajaxValidate(url, params) {
	var result = false;
  $.ajax({
    url: url,
    type: 'get',
    async: false,
    data: params,
    success: function(data) { result = data.result; },
    error: function(e) { console.log(e.message); }
  });
  //console.log(result);
  return result;
}
