<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String path=request.getContextPath();
%>
<meta http-equiv="Content-Type" content="<%=path %>/text/html; charset=utf-8" />
<title>转账成功</title>
<link type="text/css" href="<%=path %>/css/login-success.css" rel="stylesheet">
 <script src="<%=path %>/jquery/jquery-1.8.3.js"></script>
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
			location.href = '<%=path %>/index.jsp'; 
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

	<iframe id="header" src="<%=path %>/head.jsp" width="980" height="136" frameborder="0" scrolling="no" marginwidth="0px;"></iframe>
   	<img src="<%=path %>/images/pic1.png">
    <div id="content">
    <table>
    	<tr><td class="text1">祝贺！！</td></tr>
    	<tr><td class="text1">你已转账成功！</td></tr>
    	<tr><td class="text1">欢迎来到博创银行</td></tr>
    </table>
  
 
 <tr>
 <td>

 </td>
 </tr>
    </div>
       	<iframe id="footer" src="<%=path %>/foot.jsp" width="980" height="136" frameborder="0" scrolling="no marginwidth="0px;"></iframe>
</div>
</body>
</html>
