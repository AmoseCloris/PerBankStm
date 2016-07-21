var flag=0;
function checkname() {
	var reg = /^[\u4E00-\u9FA5]{2,4}$/;
	var name = $("#name").val();
	if (name == null || name == "" || name == undefined) {
		
		$("#nameid").html("<font color='red'>姓名不能为空</font>");
		return 0;
	} else if (!reg.test(name)) {
		$("#nameid").html("  <font color='red'>请输入2-4个汉字</font>");
		return 0;
	} else {
		$("#nameid").html("  <font color='green'>√</font>");
		return 1;
	}

}
function checkUserName() {
	var username = $("#username").val();
	if (username == null || username == "" || username == undefined) {
		$("#usernameid").html("  <font color='red'>用户名不能为空</font>");
		flag=0;
	} else {
		$.ajax({
			type : "POST",
			url : "servlet",
			data : "method=checkUsername&username=" + username,
			success : function(msg) {
				if (msg == 'yes') {
					$("#usernameid").html("<font color='red'>用户名已被注册</font>");

					flag=0;
				} else if (msg == 'no') {
					$("#usernameid").html("<font color='green'>该用户名可以正常注册</font>");
					flag=1;
				}
			}
		});

	}

}
function checkPassword() {
	var pass = $("#pass").val();
	if (pass == null || pass == "" || pass == undefined) {
		$("#password").html("  <font color='red'>密码不能为空</font>");
return 0;
	} else {

		$("#password").html("  <font color='green'>√</font>");
		return 1;
	}

}

function checkCardId() {
	var reg = /^\d{18}/;
	var phone = $("#cardId").val();
	if (phone == null || phone == "" || phone == undefined) {
		$("#card").html(" <font color='red'>证件号不能为空</font>");

	} else if (!reg.test(phone)) {
		$("#card").html(" <font color='red'>请输入18位身份号</font>");

	} else {
		$("#card").html(" <font color='green'>√</font>");
		return 1;
	}

}

function checkPhone() {
	var reg = /^\d{11}$/;
	var phone = $("#phone").val();
	if (phone == null || phone == "" || phone == undefined) {
		$("#phoneid").html(" <font color='red'>联系方式不能为空</font>");

	} else if (!reg.test(phone)) {
		$("#phoneid").html(" <font color='red'>请输入11位手机号</font>");

	} else {
		$("#phoneid").html(" <font color='green'>√</font>");
		return 1;
	}

}

function checkMail() {
	var reg = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
	var mail = $("#mail").val();
    if (!reg.test(mail)) {
		$("#mailid").html(" <font color='red'>请输入正确的邮件</font>");
return 0;
	} else {
		$("#mailid").html(" <font color='green'>√</font>");
		return 1;
	}

}



function sub() {
	//alert(" "+checkname()+" "+checkPassword()+" "+checkPhone()+" "+checkCardId()+flag );
	if (checkMail()==1 &&checkname() == 1  && checkPassword() == 1 && checkPhone() == 1 && checkCardId()==1 && flag == 1)
	{
		$("#form").submit();
	}else
		{
		return false;
		}
}

