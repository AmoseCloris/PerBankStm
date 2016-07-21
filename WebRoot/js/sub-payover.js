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


function queryOverpay(){
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
				$.ajax({
					type : "POST",
					url : "/PerBankStm/transServlet",
					data : "method=queryOverpay&flag=query&queryAccount=" + account,
					dataType: "json", 
					success : function(data) {
					//	var array = eval("(" + msg + ")");
						var opner=window.opener;
					    //下面获取的ID属性指的是主窗口中的ID属性
					    opner.jQuery("#account1").val(data.payacc);
					    opner.jQuery("#name").val(data.payname);
					    opner.jQuery("#swift").val(data.swiftcode);
					    opner.jQuery("#staAccoName").val(data.accname);
					    opner.jQuery("#staAccoAddr").val(data.accadd);
					    opner.jQuery("#addr").val(data.payadd);
					  
						window.close();   
					}
				});

			}
		}
	} else if (n > 1) {
		alert("请选择一条信息");

	}
}

function findOverpay(){
	location.href="<%=path%>/overPayServlet?method=overpaylist";
}
