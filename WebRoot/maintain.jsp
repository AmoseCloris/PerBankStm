<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>账户维护页面</title>
</head>
<link type="text/css" href="css/maintain.css" rel="stylesheet">
 <script src="jquery/jquery-1.8.3.js"></script>
 <script type="text/javascript" src="js/maintain.js"></script>

<body>
<div id="container">
	<iframe id="header" src="head.jsp" width="980" height="136" frameborder="0" scrolling="no" marginwidth="0px;"></iframe>
   	<div id="content">
	<img src="images/pic1.png"><br>head
    <div id="check">
    	<a href="" id="checkagain"><img src="images/check.png"></a>
     <div id="tunnel">
     <img src="images/tunnel.png">
     <div id="box">
     	<table id="tab1">
        	<tr>
            	<td><img src="images/password.png"></td>
                <td colspan="2" id="cpwd">修改密码</td>
            </tr>
            <tr>
            	<td><img src="images/pwdphone.png"></td>
              <td>密保手机:187****1234</td>
                <td><a href="">修改</a></td>
            </tr>
            <tr>
            	<td><img src="images/pwdmail.png"></td>
              <td>密保邮箱:123**@qq.com</td>
                <td><a href="">修改</a></td>
            </tr>
            <tr>
            	<td><img src="images/appeal.png"></td>
                <td colspan="2">人工申诉</td>
            </tr>
            <tr>
            	<td><img src="images/help.png"></td>
                <td colspan="2">帮助中心</td>
            </tr>
        </table>
     </div>
     	<div id="changepwd">
        	<table >
            	<tr>
                	<td>请输入原密码:</td>
                    <td><input type="password" name="oldpwd" size="17" style="width: 105px"/></td>
                </tr>
                <tr>
                	<td>请输入新密码:</td>
                    <td><input type="password" name="newpwd" size="17" style="width: 105px"/></td>
                </tr>
                <tr>
                	<td>再次输入新密码:</td>
                    <td><input type="password" name="rnewpwd" size="17" style="width: 105px"/ ></td>
                </tr>
                <tr>
                	<td><input type="submit" value="确认"/></td>
                    <td><a href="maintain.html" style="text-decoration:none">取消</a></td>
                    
                </tr>
            </table>
     	</div>
     </div>
     <div id="history">
     <img src="images/history.png">
     	<table id="tab2">
        	<tr>
            	<td>时间</td>
                <td>地点</td>
                <td>IP</td>
                <td>浏览器</td>
                <td>登录方式</td>
                <td>设备</td>
            </tr>
            <tr>
            	<td colspan="6" class="color">11月3日</td>
            </tr>
            <tr>
            	<td>21:33</td>
                <td>北京</td>
                <td>123.121.**</td>
                <td>360安全浏览器</td>
                <td>账号登陆</td>
                <td>电脑WIN7</td>
            </tr>
            <tr>
            	<td colspan="6" class="color">11月1日</td>
            </tr>
            <tr>
            	<td>22:12</td>
                <td>香港</td>
                <td>222.128.**</td>
                <td>firefox33.0</td>
                <td>手机号登录</td>
                <td>客户端</td>
            </tr>
            <tr>
            	<td colspan="6" class="color">10月27日</td>
            </tr>
            <tr>
            	<td>11:18</td>
                <td>北京</td>
                <td>118.119.**</td>
                <td>firefox33.0</td>
                <td>账号登陆</td>
                <td>电脑WIN7</td>
            </tr>
            <tr>
            	<td>15:18</td>
                <td>北京</td>
                <td>118.119.**</td>
                <td>-</td>
                <td>账号登陆</td>
                <td>电脑WIN7</td>
            </tr>
            <tr>
            	<td>17:33</td>
                <td>北京</td>
                <td>118.119.**</td>
                <td>firefox33.0</td>
                <td>账号登陆</td>
                <td>电脑WIN7</td>
            </tr>
        </table>
     </div>
    </div>
     </div>
   	<iframe id="footer" src="foot.jsp" width="980" height="136" frameborder="0" scrolling="no marginwidth="0px;"></iframe>
</div>
</body>
</html>
