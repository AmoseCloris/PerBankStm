var flag = 0;

$(function() {
	var $div_li = $("div#select ul li");
	$div_li.click(function() {
		$(this).addClass("selected").siblings().removeClass("selected");
		var index = $div_li.index(this);
		$("div#box>div").eq(index).show().siblings().hide();
	})
})


function re()
{	
		location.href="http://localhost:8080/PerBankStm/payover/payOverList.jsp";
}

function checkaccount() {
	var reg = /^\d{8}/;
	var account1 = $("#account1").val();
	if (account1 == null || account1 == "" || account1 == undefined
			|| (!reg.test(account1))) {

		$("#accountid").html("<font color='red'>请至少输入8位数字</font>");
		flag = 0;
	} else {

		$.ajax({
			type : "POST",
			url : "/PerBankStm/payOverServlet",
			data : "method=checkacc&account1=" + account1,
			success : function(msg) {
				if (msg == 'yes') {
					$("#accountid").html("<font color='red'>账户已被注册</font>");

					flag = 0;
				} else if (msg == 'no') {
					$("#accountid").html("<font color='green'>√</font>");
					flag = 1;
				}
			}
		});

	}

}
function checkName() {
	var reg = /^[a-zA-Z]+$/;
	var name = $("#name").val();
	if (name == null || name == "" || name == undefined) {
		$("#nameid").html(" <font color='red'>姓名不能为空</font>");
		return 0;
	} else if (!reg.test(name)) {
		$("#nameid").html(" <font color='red'>请输入英文名</font>");
		return 0;
	} else {
		$("#nameid").html(" <font color='green'>√</font>");
		return 1;
	}
}
function checkSwift() {
	var reg = /[0-9a-zA-Z]{11,11}/;
	var swift = $("#swift").val();
	if ((!reg.test(swift)) || swift.length != 11) {
		$("#swiftid").html(" <font color='red'>请输入数字英文11位</font>");
		return 0;
	} else if ((checkStaAccoAddr() == 0 && checkStaAccoName() == 0)) {
		$("#swiftid").html(" <font color='green'>√</font>");
		return 1;
	}

}

function checkAddr() {
	var reg = /^[a-zA-Z]+$/;
	var addr = $("#addr").val();
	if (!reg.test(addr)) {
		$("#addrid").html(" <font color='red'>请输入英文</font>");

	} else if (checkSwift() == 0) {
		$("#addrid").html(" <font color='green'>√</font>");

	}

}

function checkStaAccoName() {
	var reg = /^[a-zA-Z]+$/;
	var staAccoName = $("#staAccoName").val();
	if (!reg.test(staAccoName)) {
		$("#staAccoNameid").html(" <font color='red'>请输入英文</font>");
		return 0;
	} else if (checkSwift() == 0) {
		$("#staAccoNameid").html(" <font color='green'>√</font>");
		return 1;
	}

}

function checkStaAccoAddr() {
	var reg = /^[a-zA-Z]+$/;
	var staAccoAddr = $("#staAccoAddr").val();
	if (!reg.test(staAccoAddr)) {
		$("#staAccoAddrid").html(" <font color='red'>请输入英文</font>");
		return 0;
	} else {
		$("#staAccoAddrid").html(" <font color='green'>√</font>");
		return 1;
	}

}

function radio() {
	var val_payPlatform = $('input[name="bank"]:checked').val();

	if (val_payPlatform == 1) {
		$("#swift_dis").show();
		$("#swift_dis1").show();
		$("#name_dis").hide();
		$("#name_dis1").hide();
		$("#addr_dis").hide();
		$("#addr_dis1").hide();

	}

	if (val_payPlatform == 0) {
		$("#swift_dis").hide();
		$("#swift_dis1").hide();
		$("#name_dis").show();
		$("#name_dis1").show();
		$("#addr_dis").show();
		$("#addr_dis1").show();

	}
}

function sub() {

	if (checkName() == 1
			&& flag == 1
			&& (checkSwift() == 1 || (checkStaAccoAddr() == 1 && checkStaAccoName() == 1))) {
		alert("添加成功");
		$("#form").submit();
		// window.location.href = "payOverList.jsp";
	} else {
		return false;
	}
}

function allSelected() {
	// 获取属性框id
	var payid = document.getElementById("payid");
	// 获取具体属性放入复选框name
	var payids = document.getElementsByName("payids");
	if (payid.checked) {
		for (var i = 0; i < payids.length; i++) {
			payids[i].checked = true;
		}
	} else {
		for (var i = 0; i < payids.length; i++) {
			payids[i].checked = false;
		}
	}

}

function oneSelected() {

	var payids = document.getElementsByName("payids");
	var n = 0;
	for (var i = 0; i < payids.length; i++) {
		if (payids[i].checked) {
			n++;
		}

	}
	if (n == payids.length) {
		payid.checked = true;
	} else {
		payid.checked = false;
	}

}

function updatePayOver() {
	var payids = document.getElementsByName("payids");
	var n = 0;
	for (var i = 0; i < payids.length; i++) {
		if (payids[i].checked) {
			n++;
		}

	}
	if (n == 0) {
		alert("请选择信息");
		return;
	} else if (n == 1) {
		for (var i = 0; i < payids.length; i++) {
			if (payids[i].checked) {
				var account = payids[i].value;
				location.href = "/PerBankStm/payOverServlet?method=update1&account="
						+ account;

			}
		}
	} else if (n > 1) {
		alert("请选择一条信息");

	}

}

function delPayOver() {
	var payids = document.getElementsByName("payids");
	var n = 0;
	var arrayObj = new Array();
	for (var i = 0; i < payids.length; i++) {
		if (payids[i].checked) {
			arrayObj[i] = payids[i].value;
			n++;
		}

	}
	if (n == 0) {
		alert("请选择信息");
		return;
	} else if (n >= 1) {
		location.href = "/PerBankStm/payOverServlet?method=delete&arrayObj="
				+ arrayObj;
	}

}

function updateChange() {

	if (checkName() == 1
			&& (checkSwift() == 1 || (checkStaAccoAddr() == 1 && checkStaAccoName() == 1))) {
		// location.href="/PerBankStm/payOverServlet?method=update";
		$("#form").submit();
	} else {
		return false;
	}

}
