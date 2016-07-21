
function anotherWindow()
{
	window.open("http://localhost:8080/PerBankStm/trans/sub-payOverList.jsp","新窗口",'left=280,top=100,width=1150,height=450');
}

function anotherwindow1()
{
	window.open("http://localhost:8080/PerBankStm/account/accountList.jsp","新窗口",'left=280,top=100,width=1150,height=450');
}

function trans_account()
{
	var trans_account=$("#trans_acc").val();
	$.ajax({
		type : "POST",
		url : "/PerBankStm/transServlet",
		data : "method=remit&transAccount=" + trans_account,
		success : function(msg) {
			var array = eval("(" + msg + ")");
			for(var k=0;k<array.length;k++){
				$("#trans_sub").append("<option value='"+array[k].accountchdno+"'>"+array[k].accountchdno+"</option>");
			}
			console.log(array);
		}
	});
	
	
	
	//location.href="/PerBankStm/transServlet?method=remit&transAccount="+trans_account;
}

function radio() {
	var val_payPlatform = $('input[name="code"]:checked').val();

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

function checkaccount() {
	var reg = /^\d{8}/;
	var account1 = $("#account1").val();
	if (account1 == null || account1 == "" || account1 == undefined||(!reg.test(account1))) {

		$("#accountid").html("<font color='red'>请至少输入8位数字</font>");
	
	} else {
		$.ajax({
			type : "POST",
			url : "/PerBankStm/transServlet",
			data : "method=checkacc&account1=" + account1,
			success : function(msg) {
				if (msg == 'yes') {
					$("#accountid").html("<font color='red'>账户已被注册</font>");

				} else if (msg == 'no') {
					$("#accountid").html("<font color='green'>√</font>");
				
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

function checkAddr() {
	var reg = /^[a-zA-Z]+$/;
	var addr = $("#addr").val();
	if (!reg.test(addr)) {
		$("#addrid").html(" <font color='red'>请输入英文</font>");

	} else if (checkSwift() == 0) {
		$("#addrid").html(" <font color='green'>√</font>");

	}

}


function checkSwift() {
	var reg = /[0-9a-zA-Z]{11,11}/;
	var swift = $("#swift").val();
	if ((!reg.test(swift)) || swift.length != 11) {
		$("#swiftid").html(" <font color='red'>请输入数字英文11位</font>");

	} else  {
		$("#swiftid").html(" <font color='green'>√</font>");

	}

}

function checkStaAccoAddr() {
	var reg = /^[a-zA-Z]+$/;
	var staAccoAddr = $("#staAccoAddr").val();
	if (!reg.test(staAccoAddr)) {
		$("#staAccoAddrid").html(" <font color='red'>请输入英文</font>");

	} else {
		$("#staAccoAddrid").html(" <font color='green'>√</font>");

	}

}

function checkStaAccoName() {
	var reg = /^[a-zA-Z]+$/;
	var staAccoName = $("#staAccoName").val();
	if (!reg.test(staAccoName)) {
		$("#staAccoNameid").html(" <font color='red'>请输入英文</font>");

	} else if (checkSwift() == 0) {
		$("#staAccoNameid").html(" <font color='green'>√</font>");

	}

}

function checkMoney() {
	var reg = /^\d/;
	var account1 = $("#money").val();
	var account2 = $("#amount").val();

	if (account1 == null || account1 == "" || account1 == undefined||(!reg.test(account1))) {

		$("#moneyid").html("<font color='red'>请输入金额</font>");
		return 0;
	} else if(account2-account1<0)
			{
			$("#moneyid").html("<font color='red'>账户余额不足</font>");
			return 0;
			}
		$("#moneyid").html("<font color='green'>√</font>");
		return 1;
	
}

function hihi()
{
	var s=$("#trans_sub").val();

	$.ajax({
		type : "POST",
		url : "/PerBankStm/transServlet",
		data : "method=remitchild&transAccountChild=" + s,
		success : function(msg) {
			var array = eval("(" + msg + ")");
			document.getElementById("currency").value = array.acco.currency;
			document.getElementById("username").value = array.acco.username;
			document.getElementById("cardid").value = array.acco.cardid;
			document.getElementById("amount").value = array.acco.amount;
			//console.log(array.acco.currency);			
		}
	});
	
	if(s!="请选择子账户")
		{
		return 1;
		}

}

function checkPros()
 {
	var reg = /[0-9a-zA-Z]{0,100}/;
	var swift = $("#postcript").val();

	if (reg.test(swift)) {
		$("#postcriptid").html(" <font color='green'>√</font>");
	} else {
		$("#postcriptid").html(" <font color='black'>请重新输入</font>");
	}
}

function sub() {

	if (checkName() == 1 &&checkMoney()==1&&hihi()==1) {
		$("#form").submit();	
	} else {
		return;
	}
}
  
function nextSub()
{
	location.href="/PerBankStm/transServlet?method=addLog";
//	$("#form1").submit();	
}
