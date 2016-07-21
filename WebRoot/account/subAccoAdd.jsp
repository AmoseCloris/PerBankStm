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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加子账户</title>
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
        	<li class="selected"  >添加子账户</li>
        </ul>
    </div>
    <div id="box">
    	<div>
     <form id="form" method="post" action="<%=path %>/AccountServlet?method=subAccoAdd" name="form" >
    <table id="tab">
     		<tr>
            	<td class="right" colspan="3" style="width: 238 px">子账户金额:<font color="red" size="3">*</font></td>
                <td class="left" colspan="3"  style="width: 383px">
                <input type="text" name="subAmount" size="50"  id="subAmount" onblur="checkmoney()" />
                <span id="subAmountid"></span>
                </td>
            </tr>
            <tr>
            	<td class="right" colspan="3" style="width: 238 px">请选择币种:<font color="red" size="3">*</font></td>
                <td class="left" colspan="3"  style="width: 383px">


	<select name="currency" id="currency">  
	<!--前提是已经把stus这个list放到了request.attribute中. 在servlet或action中  request.setAttribute(stus);   -->
			<c:forEach items="${forcur}" var="forcur">  
	<!-- Stu类中必须有set和get方法   -->
			<option>${forcur.curname}</option>  
			</c:forEach>  
	</select>  
	
                 <span id="currencyid"></span>
                 </td>
            </tr>
            
          <tr><td class="right" colspan="3" style="width: 238px">主账户:</td>
		 <td class="left" colspan="3"  style="width: 383px"> 
		<input type="text" readonly id="acco" name="acco" value="${acco}" size="50"/>
	 </td></tr>
	 
	  <tr><td class="right" colspan="3" style="width: 238px">主账户金额:</td>
		 <td class="left" colspan="3"  style="width: 383px"> 
		<input type="text" readonly id="yA" name="yA" value="${y}" size="50"/>
	 </td></tr>
	     

	  
        <%
   			accountDao accountdao = new accountImpl();
			ArrayList<Account> ac = accountdao.accountSearchAll();
			String x=ac.get(1).getAccount().substring(0, 4);
			
			//String x=b.substring(0, 4);
			int C;
            C=(int)(Math.random()*100) +199;
            String a=x+"000000000000"+C;
                
			    out.print("<tr><td class='right' colspan='3' style='width: 238 px'>子账户:</td>");
				out.print("<td class='left' colspan='3'  style='width: 383px'>"); 
				out.print(" <input type='text' readonly name='subAcco'value="+a+" size='50'/></td></tr>");
			
				out.print("<tr><td class='right' colspan='3' style='width: 238 px'>姓名:</td>");
				out.print("<td class='left' colspan='3'  style='width: 383px'>"); 
				out.print(" <input type='text' readonly name='subAcconame' value="+ac.get(0).getUsername()+" size='50'/></td></tr>");
				
				out.print("<tr><td class='right' colspan='3' "+"style='width: 238 px'>证件号:</td>" );
				out.print("<td class='left' colspan='3'  style='width: 383px'>");  
				out.print(" <input type='text' readonly name='subCardid' value="+ac.get(0).getCardid()+" size='50'/></td></tr>");
			
		%>
			</table>
        </form>
             <tr>
            	<td colspan="3" class="right"> 
            	<input type="submit" value="添加"  onclick="subAccoSubmit()"/></td>
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
