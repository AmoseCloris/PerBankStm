<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="Dao.* "%>
<%@ page import="implement.*"%>
<%@ page import="model.*"%>
<%@ page import="util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>境外转账</title>
<link type="text/css" href="<%=path %>/css/transfer_accounts.css" rel="stylesheet">

<script type="text/javascript" src="<%=path %>/jquery/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=path %>/js/trans.js"></script>
<script type="text/javascript">

</script>
</head>

<body>
<div id="container">
	<iframe id="header" src="<%=path %>/head.jsp" width="980" height="136" frameborder="0" scrolling="no" marginwidth="0px;"></iframe>
    <div id="content">
    <img src="<%=path %>/images/pic1.png">
    <span id="flag">境外外汇汇款</span>
    <span class="changecolor">（带*号为必填项!）</span>
    <table width="980" border="0" id="tab1">
    
   <form action="<%=path %>/transServlet?method=confirmrec" id="form" name="form" method="post">
  <tr>
    <td colspan="3">境外外汇汇款流程：»<span class="changecolor">1.填写汇款账户信息</span> »2.填写收款账户信息 »3.填写汇款金额信息 »4.填写申报信息 »5.确认境外外汇汇款信息</td>
  </tr>
  <tr>
    <td colspan="3" class="color">1.填写汇款账户信息</td>
  </tr>
  <tr>
    <td width="220" class="row1"><span class="changecolor">*&nbsp;</span>汇款账户:</td>
    <td colspan="2">

<%
	transDao transDao = new transImpl();
	ArrayList<Account> ac = transDao.getAcc();
	
	out.print("<select name='trans_acc' id='trans_acc'  onblur='trans_account()'>");	
			for (int i = 0; i < ac.size(); i++) {
				out.print(" <option>"+ac.get(i).getAccount()+"</option>");
				}
%>

</select>&nbsp;&nbsp;<a href="#" onclick="anotherwindow1()">查询账户</a></br>
        
    </td>
  </tr>
  <tr>
    <td class="row1"><span class="changecolor">*&nbsp;</span>汇款子账户:</td>
    <td width="260">

		<select name="trans_sub" id="trans_sub" onblur="hihi()" >
			<option>请选择子账户</option>
<!--         <c:forEach items="${list}" var="list">  -->
<!--           <option>${list.account}</option> -->
<!--          </c:forEach>  -->
        </select><br />
        </td>
    <td width="500">境外外汇汇款只能使用现汇账户，如您有现钞账户，可先进行"钞斩汇" </td>
  </tr>
  <tr>
    <td class="row1">币种：</td> 
    <td colspan='2'><input readonly type="text" name="currency" id="currency"/> </td>;
    </tr>
    
    <tr>
    <td class="row1">金额：</td> 
    <td colspan='2'><input readonly type="text" name="amount" id="amount"/> </td>;
    </tr>

  <tr>
    <td class="row1"><span class="changecolor">*&nbsp;</span>汇款人拼音/英文姓名:</td>
    <td><input type="text" name="username" readonly value= "" id="username"/></td>
    <td>请输入字母或数字，不能超过30个字符，如汇款账户开户户名为英文请填写英文姓名，如汇款账户开户户名为中文请填写中文姓名拼音，为保证汇款顺利汇出，请确保姓名信息填写无误，拼音或英文姓名大小写均可</td>
  </tr>
  <tr>
    <td class="row1">汇款人证件:</td>
    <td colspan="2"><input type="text" name="cardid" id="cardid" readonly value= ""/></td>
  </tr>
  <tr>
    <td class="row1"><span class="changecolor">*&nbsp;</span>汇款人地址:</td>
    <td>
    	
        <select name="country" id="country" onblur="addCoun()" >
          <option>美国</option>
          <option>日本</option>
          <option>中国</option>
          <option>英国</option>
          <option>德国</option>
          <option>瑞士</option>
          <option>法国</option>
          <option>加拿大</option>
        </select> 国家<br/>
       
    </td>
    <td>请输入字母或数字，不能超过100个字符，为保证汇款顺利汇出，请填写详细地址，包括国家、城市、街道。街道输入举例：Jinyuan3-101,Zhongxin Cheng,Caishikou Street,Xicheng District</td>
  </tr>
  
  
  <tr>
    <td colspan="3"  class="color">2.请填写收款账户信息</td>
  </tr>
  
  <tr>
    <td class="row1"><span class="changecolor">*&nbsp;</span>收款人账户:</td>
    <td>
    	<input type="text" id="account1" name="account1" onblur="checkaccount()"/>
        <a href="#" onclick="anotherWindow()">收款人名册</a>
    </td>
    <td><span id="accountid"></span> 您可以直接输入收款人信息，也可以点击"使用模版"选择个人境外外汇汇款账户。
    <span class="changecolor">收款人帐号必须为境外账号，如填写境内帐号将自动退款。</span>
     </td>
  </tr>
  
  <tr>
    <td class="row1"><span class="changecolor">*&nbsp;</span>收款人姓名:</td>
    <td><input type="text" id="name" name="name" onblur="checkName()"/> </td>
    <td> <span id="nameid"></span> </td>
    
  </tr>
  
  <tr> 
    <td class="row1"><span class="changecolor">*&nbsp;</span>收款人地址:</td>
    <td><input type="text" id="addr" name="addr" onblur="checkAddr()"/> </td>
    <td> <span id="addrid"></span> </td>
  </tr>
  
  <tr>
    <td class="row1"><span class="changecolor">*&nbsp;</span>收款人开户行代码:</td>
    <td>
    	<input type="radio" name="code" checked="checked" value="1" onclick="radio()" />SWIFT代码
        <input type="radio" name="code" value="0" onclick="radio()"/>地区清算代码
    </td>
    <td>SWIFT代码和地区清算代码只能选择一个填写，请您优先填写SWIFT代码，系统将根据您输入正确的SWIFT代码自动反显示开户行名称、地址。如您没有SWIFT代码信息，请填写地区清算代码和开户行名称、地址 </td>
  </tr>
  <tr>
    <td class="row1" id="swift_dis" ><span class="changecolor" >*&nbsp;</span>SWIFT代码:</td>
    <td colspan="2" id="swift_dis1" ><input type="text" name="swift" id="swift" onblur="checkSwift()"/>
    <span id="swiftid"></span></td>
  </tr>
  <tr>
    <td class="row1" id="name_dis" style="display:none" >收款人开户行名称:</td> 
    <td colspan="2" id="name_dis1" style="display:none" >
    <input type="text" name="staAccoName" id="staAccoName"onblur="checkStaAccoName()"/>
  	<span id="staAccoNameid"></span></td>
  </tr>
  <tr>
    <td class="row1" id="addr_dis" style="display:none" >收款人开户行地址:</td>
    <td colspan="2" id="addr_dis1" style="display:none" >
    <input type="text" name="staAccoAddr" id="staAccoAddr"onblur="checkStaAccoAddr()"/>
	<span id="staAccoAddrid"></span></td>
  </tr>
  <tr>
    <td colspan="3"  class="color">3.请填写汇款金额及相关信息</td>
  </tr>
  
  <tr>
    <td class="row1"><span class="changecolor">*&nbsp;</span>汇款金额：</td>
    <td><input type="text" name="money" id="money" onblur="checkMoney()"/></td>
    <td><span id="moneyid"></span></td>
  </tr>

  <tr>
    <td class="row1">汇款附言：</td>
    <td><input type="text" name="postcript" id="postcript"  onblur="checkPros()"/></td>
    <td><span id="postcriptid">请输入字母或数字，不能超过100个字符</span> </td>
  </tr>
   <tr>
    <td colspan="3" id="nextstep"><input type="button" value="下一页" onclick="sub()" /></td>

  </tr>
  </form>
</table>
    </div>
    <iframe id="footer" src="<%=path %>/foot.jsp" width="980" height="136" frameborder="0" scrolling="no marginwidth="0px;"></iframe>
</div>
</body>
</html>