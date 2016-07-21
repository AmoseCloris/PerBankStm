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
<title>账户维护页面</title>
<link type="text/css" href="<%=path %>/css/overseasmman.css"
	rel="stylesheet">
<script type="text/javascript" src="<%=path %>/jquery/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=path %>/js/account.js"></script>
</head>

<body>

	<div id="container">
		<iframe id="header" src="<%=path %>/head.jsp" width="980" height="136"
			frameborder="0" scrolling="no" marginwidth="0px;"></iframe>
		<div id="content">
			<img src="<%=path %>/images/pic1.png">
			<div id="select">
				<ul>
					<li class="selected">账户维护页面</li>
				</ul>
			</div>
			<div id="box">
				<div>
				 <form id="form" method="post"  name="form" >
				
					<table id="tab">

					<tr>
					<td width="80"><input type="checkbox" name="payid" id="payid"onclick="allSelected()"></td>
						<td width="80">姓名</td>
						<td width="200">证件号</td>
						<td width="200">主账户</td>
						<td width="150">余额</td>
						<td width="80">账户类别</td>
						<td width="80">账户状态</td>
					</tr>
							<tr>
						
		<%
			accountDao accountdao = new accountImpl();

			ArrayList<Account> ac = accountdao.accountSearchAll();

			for (int i = 0; i < ac.size(); i++) {

				out.print("<tr><td><input id='payids' name='payids'  type='checkbox' value='"+ac.get(i).getAccount()+"' onclick='oneSelected()'></td>");
				out.print("<td>" + ac.get(i).getUsername() + "</td>");
				out.print("<td>" + ac.get(i).getCardid() + "</td>");
				out.print("<td>" + ac.get(i).getAccount() + "</td>");
				out.print("<td>" + ac.get(i).getAmount() + "</td>");
				
				String a=ac.get(i).getAccountType();
				if(a.equals("0"))
				{
				out.print("<td>普通卡</td>");
				}else if(a.equals("1"))
				{
				out.print("<td>金卡</td>");
				}else if(a.equals("2"))
				{
				out.print("<td>白金卡</td>");
				}

				String b=ac.get(i).getAccountState();
				if(b.equals("0"))
				{
				out.print("<td name='1' id='1' value='0'>正常</td>");
				}
				 
				if(b.equals("1"))
				{
				out.print("<td>挂失</td>");
				}
				if(b.equals("3"))
				{
				out.print("<td>冻结</td>");
				}

				out.print("</tr>");
			}
			
		%>
						
		<tr>
			<td colspan="7" class="center">
			<a href="/PerBankStm/account/accountList.jsp"><input value="查询" type="button"></input></a>
			 <a href="/PerBankStm/account/accountAdd.jsp"><input value="添加" type="button" ></input></a>
			 <input value="正常" type="button"  onclick="normal()">
			 <input value="挂失" type="button"  onclick="loss()">
			 <input value="冻结" type="button"  onclick="frize()">
			 <input value="添加子账户" type="button"  onclick="addSub()">
		</tr>
					</table>
					</form>
				</div>

			</div>
		</div>
		<iframe id="footer" src="<%=path %>/foot.jsp" width="980" height="136"
			frameborder="0" scrolling="no marginwidth=0px;"></iframe>
	</div>

</body>
</html>
