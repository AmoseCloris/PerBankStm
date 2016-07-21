<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册</title>
<link href="css/register.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="jquery/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/register.js" charset="utf-8"></script>
</head>

<body>
<div id="container">
	<iframe id="header" src="head.jsp" width="980" height="136" frameborder="0" scrolling="no" marginwidth="0px;"></iframe>
    <div id="content">
    <img src="images/pic1.png">
    <div class="anno">带*号为必填项!</div>
    <form id="form" method="post" action="servlet" name="form" value="form" >
    <table class="reg" cellspacing="0px" cellpadding="0px">
      <tbody>
     
      <tr>
        <td class="a_r" style="width: 229px";><label for="name" >姓名：<font color="red" size="3">*</font></label></td>
        <td><input name="name" id="name" type="text" onblur="checkname()"/><span id="nameid"></span></td>
      </tr>
      
         <tr>
        <td class="a_r"><label for="username">用户名：<font color="red" size="3">*</font></label></td>
       <td><input name="username" id="username" type="text" onblur="checkUserName()" /><span id="usernameid"></span></td>
      </tr>
      <tr>
      	<div class="int">
        	<td class="a_r"><label for="pass">输入密码：<font color="red" size="3">*</font></label></td>
        <td><input name="pass" id="pass" type="text" class="required" onblur="checkPassword()"/><span id="password"></span></td>
        </div>
      </tr>
      
      <tr>
      	<div class="int">
        	<td class="a_r"><label for="cardId">证件号：<font color="red" size="3">*</font></label></td>
         <td><input name="cardId" id="cardId" type="text" class="required" onblur="checkCardId()" /><span id="card"></span></td>
       	</div>
      </tr>
    
      <tr>
      	<div class="int">
        	<td class="a_r"><label for="phone">联系方式：<font color="red" size="3">*</font></label></td>
        	<td><input name="phone" id="phone" type="text" class="required" onblur="checkPhone()" /><span id="phoneid"></span></td>
       	</div>
      </tr>
     
     <tr>
      	<div class="int">
        	<td class="a_r"><label for="mail">邮箱：</label></td>
        	 <td><input name="mail" id="mail" type="text" class="required" onblur="checkMail()"><span id="mailid"></span></td>
       	</div>
      </tr>
      
      <tr>
      	<div class="int">
        	<td class="a_r"><label for="addr">联系地址：</label></td>
        	 <td><input name="addr" id="addr" type="text" class="required"/></td>
       	</div>
      </tr>

        <input type="text" name="method" value="register" style="display: none;" />
      </tr>
      </body>
    </table>	
    </form>	
          <td colspan="2" class="pl150"><input type="image" name="submit" src="images/submit.gif" id="sub" onclick="sub()" />	</td>
    
     </div>
    <iframe id="footer" src="foot.jsp" width="980" height="136" frameborder="0" scrolling="no marginwidth="0px;"></iframe>
</div>
</body>
</html>
