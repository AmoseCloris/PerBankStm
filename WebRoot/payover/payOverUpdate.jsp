<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>境外收款人</title>
<link type="text/css" href="<%=path %>/css/overseasmman.css" rel="stylesheet">
<script type="text/javascript" src="<%=path %>/jquery/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=path %>/js/payover.js" charset="utf-8"></script>
</head>

<body>
<% String name=request.getParameter("name");
   System.out.println("name is "+name);
   String account=request.getParameter("account");
   System.out.println("account is "+account);
   
%>
<div id="container">
	<iframe id="header" src="<%=path %>/head.jsp" width="980" height="136" frameborder="0" scrolling="no" marginwidth="0px;"></iframe>
    <div id="content">
    <img src="<%=path %>/images/pic1.png">
    <div class="anno">带*号为必填项!</div>
    
    <div id="select">
    	<ul>
        	<li class="selected"  >修改境外收款人</li>
        </ul>
    </div>
    <div id="box">
    	<div>
    	  <form id="form" method="post" action="<%=path %>/payOverServlet" name="form" >
     <table id="tab">
 
     		<tr>
            	<td class="right" colspan="3" style="width: 238 px">收款人账号:<font color="red" size="3">*</font></td>
                <td class="left" colspan="3"  style="width: 383px">
                <input type="text" name="account1" size="50"  id="account1" 
                 onblur="checkaccount()" value="${payOver.account}">
                <span id="accountid"></span>
                </td>
            </tr>
            <tr>
            	<td class="right" colspan="3" style="width: 238 px">收款人姓名:<font color="red" size="3">*</font></td>
                <td class="left" colspan="3"  style="width: 383px">
                <input type="text" name="name" id="name" size="50" onblur="checkName()" 
                value="${payOver.name}">
                 <span id="nameid"></span>
                 </td>
            </tr>
            <tr>
            	<td class="right" colspan="3" style="width: 238 px">收款人地址:</td>
                <td class="left" colspan="3"  style="width: 383px">
                <input type="text" name="addr" size="50" id="addr" onblur="checkAddr()"
                 value="${payOver.addr}" >
                 <span id="addrid"></span>
                 </td>
            </tr>
            
            <tr>
            	<td class="right" colspan="3" style="width: 238 px">收款人开户行:</td>
                <td class="left" colspan="3"  style="width: 383px">
                <label><input type="radio" name="bank" checked="checked" value="1" onclick="radio()"/>swift代码</label>
    			<label><input type="radio" name="bank" value="0" onclick="radio()"/>开户行名称地址</label>

                 </td>
            </tr>
 
            <tr >
            	<td id="swift_dis" style="width: 238 px"  class="right" colspan="3">收款人开户行SWIFT代码:</td>
                <td id="swift_dis1" style=" width:383px" class="left" colspan="3" >
                <input type="text" name="swift" size="50" id="swift" onblur="checkSwift()" 
                value="${payOver.swift}">
                <span id="swiftid"></span>
                 </td> 
            </tr>
            <tr >
            	<td id="name_dis" style="display:none;width: 238 px" class="right" colspan="3">收款人开户行名称:</td>
                <td id="name_dis1" style="display:none;width:383px" class="left" colspan="3"  >
                <input type="text" name="staAccoName" size="50" id="staAccoName" 
                onblur="checkStaAccoName()"  value="${payOver.staAccoName}" />
                 <span id="staAccoNameid"></span>
                 </td>
            </tr>
            
             <tr >
            	<td id="addr_dis" style="display:none;width: 238 px" class="right" colspan="3">收款人开户行地址:</td>
                <td  id="addr_dis1" style="display:none;width:383px"  class="left" colspan="3">
                <input type="text" name="staAccoAddr" size="50" id="staAccoAddr"
                onblur="checkStaAccoAddr()"  value="${payOver.staAccoAddr}" />
                 <span id="staAccoAddrid"></span>
                 </td>
            </tr>
    <input type="text" name="method" value="update" style="display: none;" />
    </table>
        </form>
        
              <tr>
            	<td colspan="3" class="right"> 
            	<input type="button" value="修改"  onclick="updateChange()"/></td>
                <td colspan="3" class="left">
                <input type="reset" value="返回"/></td>
            </tr>
        </div>
         	
        </div>
    </div>
   <iframe id="footer" src="<%=path %>/foot.jsp" width="980" height="136" frameborder="0" scrolling="no marginwidth="0px;"></iframe>
</div>

</body>
</html>
