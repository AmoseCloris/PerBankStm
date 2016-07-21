<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>密码管理</title>
<link type="text/css" href="css/splashID.css" rel="stylesheet">

<script type="text/javascript" src="jquery/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/splashID.js"></script>
</head>
<body>
<div id="container">
	<iframe id="header" src="head.jsp" width="980" height="136" frameborder="0" scrolling="no" marginwidth="0px;"></iframe>
    <div id="content">
    <img src="images/pic1.png">
  
    <div id="box">
    	<div>
    	  <form id="form" method="post" action="servlet" name="form" value="form" >
    	<table id="tab1">
        	<tr>
            	<td class="center" colspan="2">查询密码修改</td>
            </tr>
        	<tr>
            	<td class="row1">当前用户名:</td>
                <td><input readonly type="text" name="currentname"  id="currentname" value="Clris"/></td>
            </tr>
        	<tr>
            	<td class="row1">原登陆密码:</td>
                <td><input type="password" name="oldpwd" id="oldpwd" onblur="checkPassword()"/>
                <span id="oldpwdid"></span></td>
            </tr>
        	<tr>
            	<td class="row1">新登陆密码:</td>
                <td><input type="password" name="newpwd1" id="newpwd1"/>
                <span id="newpwd1id"></span></td>
            </tr>
        	<tr>
            	<td class="row1">请再次输入新登陆密码:</td>
                <td><input type="password" name="newpwd2" id="newpwd2" onblur="checkpwdAgain()"/>
               <span id="newpwd2id"></span></td>
            </tr>   
            <input type="text" name="method" value="updatepwd" style="display: none;" />
            <tr>
			<td class="right" ><input align="center" type="button" value="提交" onclick="sub();" /></td>
		</tr>
        </table>
        </form>
		
				</div>
    </div>
    <iframe id="footer" src="foot.jsp" width="980" height="136" frameborder="0" scrolling="no marginwidth="0px;"></iframe>
</div>
</body>
</html>
