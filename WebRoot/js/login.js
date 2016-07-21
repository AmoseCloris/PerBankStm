
function check()
{
	var username = $("#username").val();
	var userpwd=$("#userpwd").val();
	if (username == null || username == "" || username == undefined) {
		$("#usernameid").html("  <font color='red'>不为空</font>");
		
	}else if(userpwd == null || userpwd == "" || userpwd == undefined){
		$("#userpwd").html("  <font color='red'>不为空</font>");
		
	}else
		{
		$("#form").submit();
		}
	
}
