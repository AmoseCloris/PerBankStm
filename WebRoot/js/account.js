var flag=0;

function ret()
{	
		location.href="http://localhost:8080/PerBankStm/account/accountList.jsp";
}

function allSelected() {
	//获取属性框id
	var payid = document.getElementById("payid");
	//获取具体属性放入复选框name
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

function normal()
{
	var payids = document.getElementsByName("payids");
	var n = 0;
	for (var i = 0; i < payids.length; i++) {
		if (payids[i].checked) {
			n++;
		}
	}
	if (n == 0) {
		alert("请选择信息");
		
	} else if(n == 1) {
		
		for (var i = 0; i < payids.length; i++) {
			if (payids[i].checked) {
				var accountString=payids[i].value;
				location.href="/PerBankStm/AccountServlet?method=normalState&accountString="+accountString;
				}
		
		}

	}else if(n>1)
	{
		alert("请选择一条信息");
	}
	
}

function loss()
{
	var payids = document.getElementsByName("payids");
	var n = 0;
	for (var i = 0; i < payids.length; i++) {
		if (payids[i].checked) {
			n++;
		}
	}
	if (n == 0) {
		alert("请选择信息");
	} else if(n == 1) {
		for (var i = 0; i < payids.length; i++) {
			if (payids[i].checked) {
				var accountString=payids[i].value;
				location.href="/PerBankStm/AccountServlet?method=lostState&accountString="+accountString;
			}
		}

	}else if(n>1)
	{
		alert("请选择一条信息");
	
	}

}	

function frize()
{
	var payids = document.getElementsByName("payids");
	var n = 0;
	for (var i = 0; i < payids.length; i++) {
		if (payids[i].checked) {
			n++;
		}
	}
	
	if (n == 0) {
		alert("请选择信息");

	} else if(n == 1) {

		for (var i = 0; i < payids.length; i++) {
			if (payids[i].checked) {
				var accountString=payids[i].value;
				location.href="/PerBankStm/AccountServlet?method=frizeState&accountString="+accountString;
			}
		}
	}else if(n>1)
	{
		alert("请选择一条信息");
	}
}

function checkAcc()
{
	var reg = /^\d{19}/;
	var account = $("#account").val();
	var str=account.substr(0,4);
	
	if (account == null || account == "" || account == undefined||(!reg.test(account))||account.length!=19) {

		$("#accountid").html("<font color='red'>请输入19位数字</font>");
		flag=0;
	} else if((!(str=="6215"))&&(!(str=="6216"))&&(!(str=="6217")))
		{
		$("#accountid").html("<font color='red'>请输入正确的账户格式以6215，6216，6217开头</font>");
		flag=0;
		}else 
	{
			
		$.ajax({
			type : "POST",
			url : "/PerBankStm/AccountServlet",
			data : "method=checkacc&account1=" + account,
			success : function(msg) {
				if (msg == 'yes') {
					$("#accountid").html("<font color='red'>账号已被注册</font>");

					flag=0;
				} else if (msg == 'no') {
					if(str=="6215")
 						{
						$("#accountid").html("<font color='green'>普通卡</font>");
						flag = 1;
					}
					if(str=="6216")
					{
					$("#accountid").html("<font color='green'>金卡</font>");
					flag=1;
					}
					if(str=="6217")
					{
					$("#accountid").html("<font color='green'>白金卡</font>");
					flag=1;
					}
					
				}
			}
		});
		
	}
}

function sub() {
	if (flag == 1) {
		alert("添加成功");
		$("#form").submit();
	}

}

function addSub()
{	

	var payids = document.getElementsByName("payids");
	var n = 0;
	for (var i = 0; i < payids.length; i++) {
		if (payids[i].checked) {
			n++;
		}
	}
	if (n == 0 ) {
		alert("请选择信息");
		return;
	} else if(n == 1) {
		for (var i = 0; i < payids.length; i++) {
			if (payids[i].checked) {
				var accountString=payids[i].value;
				location.href="/PerBankStm/AccountServlet?method=subAccoAdd1&accountString1="+accountString;
			
			}
		}
	}else if(n>1)
	{
		alert("请选择一条信息");
	
	}
}

function subAccoSubmit()
{
	if(checkmoney()==1)
		{
		$("#form").submit();
		}

		
}

function checkmoney() {
	var reg = /^\d/;
	var account1 = $("#subAmount").val();
	var account2 = $("#yA").val();

	if (account1 == null || account1 == "" || account1 == undefined||(!reg.test(account1))) {

		$("#subAmountid").html("<font color='red'>请输入金额</font>");
		return 0;
	} else if(account2-account1<0)
			{
			$("#subAmountid").html("<font color='red'>账户余额不足</font>");
			return 0;
			}
		$("#subAmountid").html("<font color='green'>√</font>");
		return 1;
	
}
