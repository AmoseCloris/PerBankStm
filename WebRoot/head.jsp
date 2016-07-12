<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%String path = request.getContextPath(); %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link type="text/css" rel="stylesheet" href="css/head.css">
<script type="text/jscript">

</script>
</head>
<body>
<div id="head">
<div class="logo"><img src="images/logo.png"></div>
<div class="rightcontent">
	<ul>
    <li><a>English</a></li>
    <li><a>新闻中心</a></li>
    <li><a>人才招聘</a></li>
    <li><a>分行频道</a></li>
    <li><a>站点网络</a></li>
    </ul>
    <img  id="phonepic" src="images/phonenum.png"/>
</div>
<div class="navigation">
	<ul>
    	<li><a href="index.jsp" target="_parent">导&nbsp;&nbsp;&nbsp;航</a></li>
        <li><a href="<%=path %>/payover/payOverList.jsp" target="_parent">境外收款人</a></li>
        <li><a href="maintain.jsp" target="_parent">账户维护</a></li>
        <li><a href="transfer_accounts.jsp" target="_parent">境外转账</a></li>
        <li><a href="query.jsp" target="_parent">交易查询</a></li>
        <li><a href="loan_administration.jsp" target="_parent">贷款管理</a></li>
        <li><a href="splashID.jsp" target="_parent">密码管理</a></li>
        <li><a href="contact_us.jsp" target="_parent">联系我们</a></li>
        <div id="position">
        <a href="login.jsp" target="_parent"><img src="images/login.png"></a>
        <a href="login.jsp" target="_parent"><img src="images/login1.png"></a>
        </div>
    </ul>
</div>
</div>
</body>
</html>
