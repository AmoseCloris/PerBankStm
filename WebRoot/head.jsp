<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%String path = request.getContextPath(); %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>�ޱ����ĵ�</title>
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
    <li><a>��������</a></li>
    <li><a>�˲���Ƹ</a></li>
    <li><a>����Ƶ��</a></li>
    <li><a>վ������</a></li>
    </ul>
    <img  id="phonepic" src="images/phonenum.png"/>
</div>
<div class="navigation">
	<ul>
    	<li><a href="index.jsp" target="_parent">��&nbsp;&nbsp;&nbsp;��</a></li>
        <li><a href="<%=path %>/payover/payOverList.jsp" target="_parent">�����տ���</a></li>
        <li><a href="maintain.jsp" target="_parent">�˻�ά��</a></li>
        <li><a href="transfer_accounts.jsp" target="_parent">����ת��</a></li>
        <li><a href="query.jsp" target="_parent">���ײ�ѯ</a></li>
        <li><a href="loan_administration.jsp" target="_parent">�������</a></li>
        <li><a href="splashID.jsp" target="_parent">�������</a></li>
        <li><a href="contact_us.jsp" target="_parent">��ϵ����</a></li>
        <div id="position">
        <a href="login.jsp" target="_parent"><img src="images/login.png"></a>
        <a href="login.jsp" target="_parent"><img src="images/login1.png"></a>
        </div>
    </ul>
</div>
</div>
</body>
</html>
