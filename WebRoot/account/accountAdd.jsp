<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<title>添加主账户</title>
<link type="text/css" href="<%=path %>/css/overseasmman.css" rel="stylesheet">
<script type="text/javascript" src="<%=path %>/jquery/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=path %>/js/account.js" charset="utf-8"></script>

</head>

<body>

<div id="container">
	<iframe id="header" src="<%=path %>/head.jsp" width="980" height="136" frameborder="0" scrolling="no" marginwidth="0px;"></iframe>
    <div id="content">
    <img src="<%=path %>/images/pic1.png">
    <div class="anno">带*号为必填项!</div>
    
    <div id="select">
    	<ul>
        	<li class="selected"  >添加主账户</li>
        </ul>
    </div>
    <div id="box">
    	<div>
     <form id="form" method="post" action="<%=path %>/AccountServlet?method=accountAdd" name="form" >
    <table id="tab">
     		<tr>
            	<td class="right" colspan="3" style="width: 238 px">账号:<font color="red" size="3">*</font></td>
                <td class="left" colspan="3"  style="width: 383px">
                <input type="text" name="account" size="50"  id="account" onblur="checkAcc()"/>
                <span id="accountid"></span>
                </td>
            </tr>
            <tr>
            	<td class="right" colspan="3" style="width: 238 px">金额:<font color="red" size="3">*</font></td>
                <td class="left" colspan="3"  style="width: 383px">
                <input type="text" name="amount" id="amount" size="50" />
                 <span id="amountid"></span>
                 </td>
            </tr>
              				
		<%
			accountDao accountdao = new accountImpl();

			ArrayList<Account> ac = accountdao.accountSearchAll();

				//out.print("<tr><td><input id='payids' name='payids'  type='checkbox' value='"+ac.get(i).getAccount()+"' onclick='oneSelected()'></td>");
				out.print("<tr><td class='right' colspan='3' style='width: 238 px'>姓名:</td>");
				out.print("<td class='left' colspan='3'  style='width: 383px'>"); 
				out.print(" <input type='text' readonly value="+ac.get(0).getUsername()+" size='50'/></td></tr>");
				
				out.print("<tr><td class='right' colspan='3' "+"style='width: 238 px'>证件号:</td>" );
				out.print("<td class='left' colspan='3'  style='width: 383px'>");  
				out.print(" <input type='text' readonly value="+ac.get(0).getCardid()+" size='50'/></td></tr>");
			
		%>
						
    </table>
        </form>
        
              <tr>
            	<td colspan="3" class="right"> 
            	<input type="submit" value="添加"  onclick="sub()"/></td>
                <td colspan="3" class="left">
                <input type="reset" value="返回" onclick="ret()"/></td>
            </tr>
        </div>
         	
        </div>
    </div>
    <iframe id="footer" src="<%=path %>/foot.jsp" width="980" height="136" frameborder="0" scrolling="no marginwidth="0px;"></iframe>
</div>

</body>
</html>
