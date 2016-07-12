
function check()
{
	var username = $("#username").val();
	var userpwd=$("#userpwd").val();
	if (username == null || username == "" || username == undefined||userpwd == null || userpwd == "" || userpwd == undefined) {
		$("#usernameid").html("  <font color='red'>不为空</font>");
		
	}else{
		
		$("#form").submit();
	}
	
}
