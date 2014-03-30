// I don't like coffee scripts because they are UGLY!
// Use decent JS instead
$(document).ready(function() {
	
	switch (location.pathname) {
	case "/users/new":
		recaptcha_preview();
		users_new_form_validate();
		input_tooltip();
		break;
	case "/users/edit":
		recaptcha_preview();
		users_new_form_validate();
		input_tooltip();
		break;	
	default:
		break;
	}
});

function users_new_form_validate() {
	$.validator.addMethod("uniqueInDB", function(value, element) {
    return this.optional(element) || !ajaxValidate("/users/exists", $(element).attr("name") + "=" + value);
  });

	$.validator.addMethod("validIDNum", function(value, element) {
    return this.optional(element) || (new VALIDATION.IDNum(value).valid());
  });
	
	var rules = {
    "user[user_name]": { required: true, uniqueInDB: true },
		"user[name]": { required: true },
		"user[id_num]": { required: true, uniqueInDB: true, validIDNum: true },
		"user[emails_attributes][0][addr]": { required: true, uniqueInDB: true },
		"user[phones_attributes][0][number]": { required: true, uniqueInDB: true },
		"user[login_pass]": { minlength: 6, required: true },
		"user[login_pass_confirmation]": { equalTo: "#user_login_pass" }
  };
	var messages = {
		"user[user_name]": { required: "您必须取一个用户名", uniqueInDB: "您来晚啦，别人已经把这个名字占用啦" },
		"user[name]": { required: "您必须输入你的真实姓名" },
		"user[id_num]": { required: "您必须输入你的身份证号码", uniqueInDB: "该身份证已经被使用，您确定这是你的身份证号码？", validIDNum: "无效身份证号码" },
		"user[emails_attributes][0][addr]": { required: "您必须输入一个邮箱地址", uniqueInDB: "该邮箱已被占用" },
		"user[phones_attributes][0][number]": { required: "您必须输入一个联系电话", uniqueInDB: "该电话号码已被占用" },
		"user[login_pass]": { minlength: "您的密码长度必须大于6", required: "您必须输入密码" },
		"user[login_pass_confirmation]": { equalTo: "两次输入的密码不同" }
  };
	
	formValidate("form#haha-form-signup", rules, messages);
}
