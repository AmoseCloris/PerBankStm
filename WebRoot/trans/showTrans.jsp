<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String path=request.getContextPath();
%>
<meta http-equiv="Content-Type" content="<%=path %>/text/html; charset=utf-8" />
<title>境外转账</title>
<link type="text/css" href="<%=path %>/css/transfer_accounts.css" rel="stylesheet">
<script type="text/javascript" src="<%=path %>/js/trans.js"></script>
</head>

<body onload="getAccountPat()">
<div id="container">
	<iframe id="header" src="<%=path %>/head.jsp" width="980" height="136" frameborder="0" scrolling="no" marginwidth="0px;"></iframe>
    <div id="content">
    <img src="<%=path %>/images/pic1.png">
    <span id="flag">确认境外外汇汇款，猫猫呵呵</span>
    <span class="changecolor">（带*号为必填项!）</span>
    
    <form action="<%=path %>/transServlet?method=addLog" id="form1" name="form1" method="post">
    
<!--     <form action="<%=path%>/trans/ok.jsp" method="post"> -->
    
    <table width="980" border="0" id="tab1">
  <tr>
    <td colspan="3">境外外汇汇款流程：??<span class="changecolor">1.填写汇款账户信息</span> ??2.填写收款账户信息 ??3.填写汇款金额信息 ??4.填写申报信息 ??5.确认境外外汇汇款信息</td>
  </tr>
  
  <tr>
    <td colspan="3" class="color">1.填写汇款账户信息</td>
  </tr>
  <tr>
    <td width="220" class="row1"><span class="changecolor">*&nbsp;</span>汇款账户:</td>
    <td colspan="2">
    <input readonly id="parrentid" name="parrentid" value="${parrentid}">
    </td>
  </tr>
  <tr>
    <td class="row1"><span class="changecolor">*&nbsp;</span>汇款子账户:</td>
    <td width="260">
        <input readonly name="payaccchds" value="${payaccchd}">
        </td>
    <td width="500">&raquo境外外汇汇款只能使用现汇账户，如您有现钞账户，可先进行"钞斩汇" </td>
  </tr>
  
  <tr>
    <td class="row1">币种：</td> 
    <td colspan='2'><input readonly type="text" name="currency" id="currency" value="${currency}" /> </td>;
    </tr>
    
      <tr>
    <td class="row1">金额：</td> 
    <td colspan='2'><input readonly type="text" name="amount" id="amount" value="${amount}" /> </td>;
    </tr>
    
    <td class="row1"><span class="changecolor">*&nbsp;</span>汇款人拼音/英文姓名:</td>
    <td><input type="text" readonlyname="engname" value="${engname}" size="32"/></td>
    <td>&raquo请输入字母或数字，不能超过30个字符 如汇款账户开户户名为英文请填写英文姓名，如汇款账户开户户名为中文请填写中文姓名拼音，为保证汇款顺利汇出，请确保姓名信息填写无误，拼音或英文姓名大小写均可</td>
  </tr>
  <tr>
    <td class="row1">汇款人证件:</td>
    <td colspan="2"><input readonly  type="text" name="paycardid" value="${paycardid}" size="32"/></td>
  </tr>
  <tr>
    <td class="row1"><span class="changecolor">*&nbsp;</span>汇款人地址:</td>
    <td>
    	<input type="text" readonly  name="payaddress" value="${payaddress}" size="32"/>
    </td>
    <td>&raquo请输入字母或数字，不能超过100个字符，为保证汇款顺利汇出，请填写详细地址，包括国家、城市、街道。街道输入举例：Jinyuan3-101,Zhongxin Cheng,Caishikou Street,Xicheng District</td>
  </tr>
  <tr>
    <td colspan="3"  class="color">2.请填写收款账户信息</td>
  </tr>
  <tr>
    <td class="row1"><span class="changecolor">*&nbsp;</span>收款人账户:</td>
    <td>
    	<input type="text" readonly name="recaccount" value="${recaccount}"  size="32"/>
    </td>
    <td>&raquo您可以直接输入收款人信息，也可以点击"使用模版"选择个人境外外汇汇款账户。<span class="changecolor">收款人帐号必须为境外账号，如填写境内帐号将自动退款。</span> </td>
  </tr>
  <tr>
    <td class="row1"><span class="changecolor">*&nbsp;</span>收款人姓名:</td>
    <td><input type="text" readonly name="recname" value="${recname}" size="32"/></td>
    <td>&raquo请输入字母或数字，不能超过30个字符</td>
  </tr>
  <tr>
    <td class="row1"><span class="changecolor">*&nbsp;</span>收款人地址:</td>
    <td>
    	<input type="text" readonly name="recaddress" value="${recaddress}" size="32"/>
    </td>
    <td>&raquo请输入字母或数字，不能超过100个字符，为保证汇款顺利汇出，请填写详细地址，包括国家、城市、街道 </td>
  </tr>

  <tr>
    <td class="row1"><span class="changecolor">*&nbsp;</span>SWIFT代码:</td>
    <td colspan="2"><input readonly type="text" name="swiftcode" value="${swiftcode}" size="32"/></td>
  </tr>
  <tr>
    <td class="row1">收款人开户行名称:</td>
    <td colspan="2"><input readonly type="text" name="recbankname" value="${recbankname}" size="32"/></td>
  </tr>
  <tr>
    <td class="row1">收款人开户行地址:</td>
    <td colspan="2"><input readonly type="text" name="recbankadd" value="${recbankadd}" size="32"/></td>
  </tr>
  <tr>
    <td colspan="3"  class="color">3.请填写汇款金额及相关信息</td>
  </tr>
  <tr>
    <td class="row1"><span class="changecolor">*&nbsp;</span>汇款金额：</td>
    <td><input readonly type="text" name="moneynum" value="${moneynum}" size="32"/></td>
    <td>&raquo<span class="changecolor">境外汇款收费标准为手续费（汇款本金的0.1%，最低20元，最高300元）加电报费（80元/笔）。以上费用折成外币，从汇款账户中直接扣收。请您确保汇款外币账户中有足够的汇款本金和手续费，否则将导致汇款失败。</span>网银境外汇款单笔及当日累计限额为折人民币30万元，如超限额将无法汇出，请您知悉 </td>
  </tr>

  <tr>
    <td class="row1">汇款附言：</td>
    <td><textarea  readonly name="payps"  rows="" cols="" >${payps}</textarea></td>
    <td>&raquo请输入字母或数字，不能超过100个字符 </td>
  </tr>

</table>
</form>
  <tr>
    <td colspan="3" id="nextstep"><input type="button" value="提交" onclick="nextSub()" /></td>
  </tr>
    </div>
    <iframe id="footer" src="<%=path %>/foot.jsp" width="980" height="136" frameborder="0" scrolling="no marginwidth="0px;"></iframe>
</div>
</body>
</html>
