$(function() {
	var $div_li = $("div#select ul li");
	$div_li.click(function() {
		$(this).addClass("selected").siblings().removeClass("selected");
		var index = $div_li.index(this);
		$("div#box>div").eq(index).show().siblings().hide();
	})
})

function checkPassword() {
	
	var oldpwd = $("#oldpwd").val();
	if (oldpwd == null || oldpwd == "" || oldpwd == undefined) {
		$("#oldpwdid").html("  <font color='red'>密码不能为空</font>");

	} else {

		$.ajax({
			type : "POST",
			url : "servlet",
			data : "method=checkPassWord&oldpwd=" + oldpwd,
			success : function(msg) {
				if (msg == 'yes') {
					$("#oldpwdid").html("<font color='green'>√</font>");

				} else if (msg == 'no') {
					
					$("#oldpwdid").html("<font color='red'>密码错误</font>");

				}
			}
		});

	}

}

function checkpwdAgain()
{
	var newpwd1=$("#newpwd1").val();
	var newpwd2=$("#newpwd2").val();
	
	if(newpwd1 == null || newpwd1 == "" || newpwd1 == undefined||newpwd2 == null || newpwd2 == "" || newpwd2 == undefined)
		{
		$("#newpwd2id").html("<font color='red'>密码不能为空</font>");
		return 0;
		}else if(newpwd1!=newpwd2)
		{
		$("#newpwd2id").html("<font color='red'>两次密码不一致，请重新输入</font>");
		return 0;
		}else if(newpwd1==newpwd2)
			{
			$("#newpwd2id").html("<font color='green'>√</font>");
			return 1;
			}
}

function sub()
{
	if(checkpwdAgain()==1)
		{
		alert("您已修改成功，请重新登陆");
		$("#form").submit();	
		}

}