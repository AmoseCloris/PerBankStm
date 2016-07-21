<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%String path = request.getContextPath(); %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link type="text/css" rel="stylesheet" href="css/head.css">

<script type="text/jscript"></script>
<script type="text/javascript" src="<%=path %>/js/head.js"></script>

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

<c:if test="${name!=null && name!='' }">
<div>欢迎<span style="color:red">${name}</span>先生/女士来到个人网银系统</div>
<span><a href="<%=path%>/servlet?method=logout" > 注销</a></span>
</c:if>

<div class="navigation">
	<ul>
    	<li><a href="<%=path %>/index.jsp" target="_parent">导&nbsp;&nbsp;&nbsp;航</a></li>
        <li><a href="<%=path %>/payover/payOverList.jsp" target="_parent">境外收款人</a></li>
        <li><a href="<%=path %>/account/accountList.jsp" target="_parent">账户维护</a></li>
        <li ><a href="<%=path%>/trans/transfer_accounts.jsp" target="_parent" >境外转账</a></li>
        <li><a href="<%=path%>/query/query.jsp" target="_parent">交易查询</a></li>
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
