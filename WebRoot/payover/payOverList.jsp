<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="Dao.* "%>
<%@ page import="implement.*"%>
<%@ page import="model.*"%>
<%@ page import="util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>境外收款人</title>
<link type="text/css" href="<%=path %>/css/overseasmman.css"
	rel="stylesheet">
<script type="text/javascript" src="<%=path %>/jquery/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=path %>/js/payover.js" charset="utf-8"></script>
</head>

<body>

	<div id="container">
		<iframe id="header" src="<%=path %>/head.jsp" width="980" height="136"
			frameborder="0" scrolling="no" marginwidth="0px;"></iframe>
		<div id="content">
			<img src="<%=path %>/images/pic1.png">
			<div id="select">
				<ul>
					<li class="selected">查询境外收款人</li>
				</ul>
			</div>
			<div id="box">
				<div>
				 <form id="form" method="post"  name="form" action="">
				
					<table id="tab">
						<tr>
							<td class="right" colspan="3">请输入要查询的账户:</td>
							<td class="left" colspan="3"><input type="text"
								name="account" id="account" size="50" /></td>
						</tr>
						<tr>
							<td width="90"><input type="checkbox" name="payid" id="payid" onclick="allSelected()"></td>
							<td width="118">收款人账号</td>
							<td width="144">收款人姓名</td>
							<td width="150">收款人地址</td>
							<td width="255">开户行SWIFT代码</td>
							<td width="200">开户行名称</td>
							<td width="200">开户行地址</td>
						</tr>
						<tr>
						
		<%
			payOverDao paydao = new payOverImpl();

			ArrayList<PayOver> gs = paydao.payOverSeaAll();
			for (int i = 0; i < gs.size(); i++) {
				out.print("<tr><td><input id='payids' name='payids' value='"+gs.get(i).getAccount()+"' type='checkbox' onclick='oneSelected()'></td>");
				out.print("<td>" + gs.get(i).getAccount() + "</td>");
				out.print("<td>" + gs.get(i).getName() + "</td>");
				out.print("<td>" + gs.get(i).getAddr() + "</td>");
				out.print("<td>" + gs.get(i).getSwift() + "</td>");
				out.print("<td>" + gs.get(i).getStaAccoName() + "</td>");
				out.print("<td>" + gs.get(i).getStaAccoAddr() + "</td>");
				
				out.print("</tr>");
			}
			
		%>
						
		<tr>
			<td colspan="7" class="center">
			<a href="/PerBankStm/payover/payOverList.jsp"><input value="查询" type="button"></input></a>
			 <a href="/PerBankStm/payover/payOverAdd.jsp"><input value="添加" type="button" ></input></a>
			  <input type="button" value="修改"  onclick="updatePayOver()"/>
			  <input type="button" value="删除" onclick="delPayOver()"/></td>

		</tr>
					</table>
					</form>
				</div>

			</div>
		</div>
		<iframe id="footer" src="<%=path %>/foot.jsp" width="980" height="136"
			frameborder="0" scrolling="no marginwidth="0px;"></iframe>
	</div>

</body>
</html>
