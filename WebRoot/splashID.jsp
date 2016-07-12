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
    <div id="select">
    	<ul>
        	<li class="selected">查询密码修改</li>
            <li>查询密码重置</li>
            <li>取款密码修改</li>
            <li>支付密码重置</li>
        </ul>
    </div>
    <div id="box">
    	<div>
    	<table id="tab1">
        	<tr>
            	<td class="center" colspan="2">查询密码修改</td>
            </tr>
        	<tr>
            	<td class="row1">当前一卡通卡号:</td>
                <td><input type="text" name="id" value="622588012680691"/></td>
            </tr>
        	<tr>
            	<td class="row1">原查询密码:</td>
                <td><input type="password" name="oldquerypwd"/></td>
            </tr>
        	<tr>
            	<td class="row1">新查询密码:</td>
                <td><input type="password" name="newquerypwd1"/></td>
            </tr>
        	<tr>
            	<td class="row1">请再次输入新查询密码:</td>
                <td><input type="password" name="newquerypwd2"/></td>
            </tr>
            <tr>
            	<td class="right"> <input type="submit" value="提交"/></td>
                <td class="left"><input type="reset" value="重置"/></td>
            </tr>
        </table>
    </div>
    <div class="hide">
    	<table id="tab1">
        	<tr>
            	<td class="center" colspan="2">查询密码重置</td>
            </tr>
        	<tr>
            	<td class="row1">当前一卡通卡号:</td>
                <td><input type="text" name="id" value="622588012680691"/></td>
            </tr>
        	<tr>
            	<td class="row1">原查询密码:</td>
                <td><input type="password" name="oldquerypwd"/></td>
            </tr>
        	<tr>
            	<td class="row1">新重置密码:</td>
                <td><input type="password" name="newquerypwd1"/></td>
            </tr>
        	<tr>
            	<td class="row1">请再次输入新重置密码:</td>
                <td><input type="password" name="newquerypwd2"/></td>
            </tr>
            <tr>
            	<td class="right"> <input type="submit" value="提交"/></td>
                <td class="left"><input type="reset" value="重置"/></td>
            </tr>
        </table>
    </div>
    <div class="hide">
    	<table id="tab1">
        	<tr>
            	<td class="center" colspan="2">取款密码修改</td>
            </tr>
        	<tr>
            	<td class="row1">当前一卡通卡号:</td>
                <td><input type="text" name="id" value="622588012680691"/></td>
            </tr>
        	<tr>
            	<td class="row1">原取款密码:</td>
                <td><input type="password" name="oldquerypwd"/></td>
            </tr>
        	<tr>
            	<td class="row1">新取款密码:</td>
                <td><input type="password" name="newquerypwd1"/></td>
            </tr>
        	<tr>
            	<td class="row1">请再次输入新取款密码:</td>
                <td><input type="password" name="newquerypwd2"/></td>
            </tr>
            <tr>
            	<td class="right"> <input type="submit" value="提交"/></td>
                <td class="left"><input type="reset" value="重置"/></td>
            </tr>
        </table>
    </div>
    <div class="hide">
    	<table id="tab1">
        	<tr>
            	<td class="center" colspan="2">支付密码重置</td>
            </tr>
        	<tr>
            	<td class="row1">当前一卡通卡号:</td>
                <td><input type="text" name="id" value="622588012680691"/></td>
            </tr>
        	<tr>
            	<td class="row1">原支付密码:</td>
                <td><input type="password" name="oldquerypwd"/></td>
            </tr>
        	<tr>
            	<td class="row1">新支付密码:</td>
                <td><input type="password" name="newquerypwd1"/></td>
            </tr>
        	<tr>
            	<td class="row1">请再次输入新支付密码:</td>
                <td><input type="password" name="newquerypwd2"/></td>
            </tr>
            <tr>
            	<td class="right"> <input type="submit" value="提交"/></td>
                <td class="left"><input type="reset" value="重置"/></td>
            </tr>
        </table>
    </div>
    </div>
    <iframe id="footer" src="foot.jsp" width="980" height="136" frameborder="0" scrolling="no marginwidth="0px;"></iframe>
</div>
</body>
</html>
