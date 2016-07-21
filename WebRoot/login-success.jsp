<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登陆成功</title>
<link type="text/css" href="css/login-success.css" rel="stylesheet">
 <script src="jquery/jquery-1.8.3.js"></script>
 <script>
 $(document).ready(function(){
	$("#change").css("background-color","red")
	})
 </script>
</head>

<body onload="setInterval()">
<h4 id="change"><span id="totalSecond">2</span>秒后自动跳转到首页！</h4>
 	<script language="javascript">
		var second = document.getElementById('totalSecond').textContent; 
		if (navigator.appName.indexOf("Explorer") > -1)  { 
			second = document.getElementById('totalSecond').innerText; 
			} else { 
				second = document.getElementById('totalSecond').textContent; 
					} 
			setInterval("redirect()", 1000);
			function redirect() { 
			if (second < 0) { 
			location.href = 'index.jsp'; 
			} else { 
				if (navigator.appName.indexOf("Explorer") > -1) { 
				document.getElementById('totalSecond').innerText = second--; 
				} else { 
				document.getElementById('totalSecond').textContent = second--; 
		} 
	} 
}
 </script>
<div id="container">
		<%
			if (session.getAttribute("username") == null) {
		%>
<!-- 	<iframe id="header" src="head.jsp" width="980" height="136" frameborder="0" scrolling="no" marginwidth="0px;"></iframe> -->
<!--    	<img src="images/pic1.png"> -->
<!--     <div id="content"> -->
<!--     <table> -->
<!--     	<tr><td class="text1">祝贺！！</td></tr> -->
<!--     	<tr><td class="text1">你已成功登录！</td></tr> -->
<!--     	<tr><td class="text1">欢迎来到博创银行</td></tr> -->
<!--     </table> -->
    <%
}else{
     
 %>
 
 <tr>
 <td>
 ${name}<%=new java.util.Date() %>登陆成功！ }
 </td>
 </tr>
 <%} %>
    </div>
    
 
   	<iframe id="footer" src="foot.jsp" width="980" height="136" frameborder="0" scrolling="no marginwidth="0px;"></iframe>
</div>
</body>
</html>
