<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
<%
String path = request.getContextPath();
%>
<link type="text/css" href="<%=path %>/css/login.css" rel="stylesheet">
 <script src="<%=path %>/jquery/jquery-1.8.3.js"></script>
 <script src="<%=path %>/js/login.js" ></script>
 <script>

 </script>
</head>
<body>
	<div id="container">

		<iframe id="header" src="<%=path %>/head.jsp" width="980" height="136" frameborder="0" scrolling="no" marginwidth="0px;"></iframe>
    <img src="<%=path %>/images/pic1.png">
    <hr/>
 
    <div id="content">
    	<div id="box1">
        <form action="servlet" method="post" id="form">
        	<table width="0">
        		<tr>
                	<td width="50" height="40" style="width: 1px">登录名:</td>
                <td width="50"><input type="text" name="username" id="username" onblur="check()"/><span id="usernameid"></span></td>
                   
                </tr>
                <tr>
                	<td >密&nbsp;码:</td>
                    <td colspan="2"><input type="password" name="userpwd" id="userpwd"onblur="check()"/><span id="userpwdid"></span></td>
                </tr>
        	</table>
          <input type="text" name="method" value="login" style="display: none;" />
          
            </form>
            
              <div id="boxlogin">
            <input type="image" src="<%=path %>/images/login4.png" id="sub" />
         
            </div>
            <div id="boxregister">
            <a href="register.jsp">立即注册</a>
            <a href="">忘记密码？</a>
            </div>        
            </div>
    </div>
    <iframe id="footer" src="foot.jsp" width="980" height="136" frameborder="0" scrolling="no marginwidth="0px;"></iframe>
</div>

</body>
</html>
