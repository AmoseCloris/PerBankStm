<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="Dao.* "%>
<%@ page import="implement.*"%>
<%@ page import="model.*"%>
<%@ page import="util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" href="<%=path %>/css/overseasmman.css" rel="stylesheet">
<script type="text/javascript" src="<%=path %>/jquery/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=path %>/js/sub-payover.js"></script>

<title>境外收款人</title>
</head>
<body>
<div id="container">
    <div id="content">
    <img src="<%=path %>/images/pic1.png">

    <div id="box">
    	<div>
     <table id="tab">

		<tr>
			<td width="90"><input type="checkbox" name="payid"
				id="payid" onclick="allSelected()"></td>
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
             <td colspan="6"><a href="/PerBankStm/trans/sub-payOverList.jsp"><input value="查询" type="button"/>
               &nbsp;&nbsp;&nbsp;<input type="submit" value="确认" onclick="queryOverpay()"/>
                &nbsp;&nbsp;&nbsp;
                <input type="submit" value="关闭" onclick="window.close()"/></td>
            </tr>
        </table>
        </div>
        </div>
    <iframe id="footer" src="<%=path %>/foot.jsp" width="980" height="136" frameborder="0" scrolling="no marginwidth="0px;"></iframe>
</div>
</body>
</html>
