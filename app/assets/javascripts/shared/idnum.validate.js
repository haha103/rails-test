var VALIDATION = VALIDATION || {};

VALIDATION.IDNum = function(id_num) {

	var _province_codes = {
		11: "北京", 12: "天津", 13: "河北"  , 14: "山西", 15: "内蒙古",
		21: "辽宁", 22: "吉林", 23: "黑龙江", 31: "上海", 32: "江苏"  ,
		33: "浙江", 34: "安徽", 35: "福建"  , 36: "江西", 37: "山东"  ,
		41: "河南", 42: "湖北", 43: "湖南"  , 44: "广东", 45: "广西"  ,
		46: "海南", 50: "重庆", 51: "四川"  , 52: "贵州", 53: "云南"  ,
		54: "西藏", 61: "陕西", 62: "甘肃"  , 63: "青海", 64: "宁夏"  ,
		65: "新疆", 71: "台湾", 81: "香港"  , 82: "澳门", 91: "国外"
	};
	
	//检查号码是否符合规范，包括长度，类型
	function _basic(s) {
		//身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X
		return /(^\d{15}$)|(^\d{17}(\d|X|x)$)/.test(s);
	};

	//取身份证前两位,校验省份
	function _province(s) {
		return _province_codes.hasOwnProperty(s.substr(0,2));
	};

	//检查生日是否正确
	function _birthday(s) {
		var date = null;
		switch(s.length) {
		case 15:
			var matches = s.match(/^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/);
			date = "19" + matches[2] + "/" + matches[3] + "/" + matches[4];
			break;
		case 18:
			var matches = s.match(/^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X|x)$/);
			date = matches[2] + "/" + matches[3] + "/" + matches[4];
			break;
		default:
			break;
		}
		//console.log(date);
		return !isNaN(Date.parse(date));
	};

	//校验位的检测
	function _parity(s) {
		if (s.length != 18)
			return true; // 15 位身份证不需要验证校验码
		return (_get_parity_char(s) == s.substr(17, 1));
	};

	function _get_parity_char(s) {
		var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2); 
		var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'); 
		var cardTemp = 0;
		
		for(var i = 0; i < 17; i++)
			cardTemp += s.substr(i, 1) * arrInt[i];
		
		return arrCh[cardTemp % 11];
	}
	
	this.id_num = id_num;
	this.valid = function() {
		return _basic(id_num) && _province(id_num) && _birthday(id_num) && _parity(id_num);
	}
};

/*
var tests = [
	{ id_num: "510105198406132534", result: true },
	{ id_num: "510105840613253", result: true },
	{ id_num: "510105198406132227", result: true },
	{ id_num: "510105198406282532", result: true },
	{ id_num: "510105198413132534", result: false },
	{ id_num: "160105198406132534", result: false },
	{ id_num: "51010519840613253x", result: false },
	{ id_num: "510105198406132222", result: false },
	{ id_num: "510105198406282534", result: false },
];

tests.map(function(t) {
	console.log(JSON.stringify(t) + ": " + (new VALIDATION.IDNum(t.id_num).valid() == t.result ? "pass" : "fail"));
});
*/
