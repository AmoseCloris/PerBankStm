<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="Dao.* "%>
<%@ page import="implement.*"%>
<%@ page import="model.*"%>
<%@ page import="util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>交易查询页面</title>
<link type="text/css" href="<%=path %>/css/query.css" rel="stylesheet">
<script type="text/javascript" src="<%=path %>/jquery/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=path %>/js/que.js"></script>
</head>

<body>
<div id="container">
	<iframe id="header" src="<%=path %>/head.jsp" width="980" height="136" frameborder="0" scrolling="no" marginwidth="0px;"></iframe>
    <div id="content">
       <img src="<%=path%>/images/pic1.png">
   
    <div id="box1">
    <div>
<form action="<%=path %>/queryServlet?method=query" id="form2" name="form2" method="post">
    
  <table width="980">
   <tr>
 
          	<td class="col"  style="width:160px" align="center">交易时间</td>
          	<td class="col" style="width:140px" align="center">汇款账号</td>
          	<td class="col" style="width:140px" align="center">收款账号</td>
          	<td class="col" style="width:80px" align="center">汇款金额</td>
          	<td class="col" style="width:80px" align="center">余额</td>
             <td class="col">详细</td>
            
        </tr>
    
    	<%
			queryDao querydao = new queryImpl();

			ArrayList<LogRecordPay> lr = querydao.logSerSome();

			for (int i = 0; i < lr.size(); i++) {
				out.print("	<tr>");
				out.print("<td><input id='time' name='time' style='width:180px' type='text' readonly value='"+lr.get(i).getTime()+"' /></td>");
				out.print("<td><input style='width:160px' type='text' readonly value='"+lr.get(i).getCacc()+"' /></td>");
				out.print("<td><input style='width:160px' type='text' readonly  value='"+lr.get(i).getPayacc()+"' /></td>");
				out.print("<td><input style='width:100px' type='text' readonly  value='"+lr.get(i).getPayment()+"' /></td>");
				out.print("<td><input style='width:100px' type='text' readonly  value='"+lr.get(i).getRemain()+"' /></td>");
				out.print("<td><a href='#' onclick='ha()'>详细 </a></td>");
				out.print("	</tr>");
				
			}
			
		%>

    </table>
    </div>
    </div>
 
    </div>
    <iframe id="footer" src="<%=path %>/foot.jsp" width="980" height="136" frameborder="0" scrolling="no marginwidth="0px;"></iframe>
</div>
</body>
</html>
