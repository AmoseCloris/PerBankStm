<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String path=request.getContextPath();
%>
<meta http-equiv="Content-Type" content="<%=path %>/text/html; charset=utf-8" />
<title>����ת��</title>
<link type="text/css" href="<%=path %>/css/transfer_accounts.css" rel="stylesheet">
<script type="text/javascript" src="<%=path %>/js/trans.js"></script>
</head>

<body onload="getAccountPat()">
<div id="container">
	<iframe id="header" src="<%=path %>/head.jsp" width="980" height="136" frameborder="0" scrolling="no" marginwidth="0px;"></iframe>
    <div id="content">
    <img src="<%=path %>/images/pic1.png">
    <span id="flag">ȷ�Ͼ�������èè�Ǻ�</span>
    <span class="changecolor">����*��Ϊ������!��</span>
    
    <form action="<%=path %>/transServlet?method=addLog" id="form1" name="form1" method="post">
    
<!--     <form action="<%=path%>/trans/ok.jsp" method="post"> -->
    
    <table width="980" border="0" id="tab1">
  <tr>
    <td colspan="3">������������̣�??<span class="changecolor">1.��д����˻���Ϣ</span> ??2.��д�տ��˻���Ϣ ??3.��д�������Ϣ ??4.��д�걨��Ϣ ??5.ȷ�Ͼ����������Ϣ</td>
  </tr>
  
  <tr>
    <td colspan="3" class="color">1.��д����˻���Ϣ</td>
  </tr>
  <tr>
    <td width="220" class="row1"><span class="changecolor">*&nbsp;</span>����˻�:</td>
    <td colspan="2">
    <input readonly id="parrentid" name="parrentid" value="${parrentid}">
    </td>
  </tr>
  <tr>
    <td class="row1"><span class="changecolor">*&nbsp;</span>������˻�:</td>
    <td width="260">
        <input readonly name="payaccchds" value="${payaccchd}">
        </td>
    <td width="500">&raquo���������ֻ��ʹ���ֻ��˻����������ֳ��˻������Ƚ���"��ն��" </td>
  </tr>
  
  <tr>
    <td class="row1">���֣�</td> 
    <td colspan='2'><input readonly type="text" name="currency" id="currency" value="${currency}" /> </td>;
    </tr>
    
      <tr>
    <td class="row1">��</td> 
    <td colspan='2'><input readonly type="text" name="amount" id="amount" value="${amount}" /> </td>;
    </tr>
    
    <td class="row1"><span class="changecolor">*&nbsp;</span>�����ƴ��/Ӣ������:</td>
    <td><input type="text" readonlyname="engname" value="${engname}" size="32"/></td>
    <td>&raquo��������ĸ�����֣����ܳ���30���ַ� �����˻���������ΪӢ������дӢ�������������˻���������Ϊ��������д��������ƴ����Ϊ��֤���˳���������ȷ��������Ϣ��д����ƴ����Ӣ��������Сд����</td>
  </tr>
  <tr>
    <td class="row1">�����֤��:</td>
    <td colspan="2"><input readonly  type="text" name="paycardid" value="${paycardid}" size="32"/></td>
  </tr>
  <tr>
    <td class="row1"><span class="changecolor">*&nbsp;</span>����˵�ַ:</td>
    <td>
    	<input type="text" readonly  name="payaddress" value="${payaddress}" size="32"/>
    </td>
    <td>&raquo��������ĸ�����֣����ܳ���100���ַ���Ϊ��֤���˳�����������д��ϸ��ַ���������ҡ����С��ֵ����ֵ����������Jinyuan3-101,Zhongxin Cheng,Caishikou Street,Xicheng District</td>
  </tr>
  <tr>
    <td colspan="3"  class="color">2.����д�տ��˻���Ϣ</td>
  </tr>
  <tr>
    <td class="row1"><span class="changecolor">*&nbsp;</span>�տ����˻�:</td>
    <td>
    	<input type="text" readonly name="recaccount" value="${recaccount}"  size="32"/>
    </td>
    <td>&raquo������ֱ�������տ�����Ϣ��Ҳ���Ե��"ʹ��ģ��"ѡ����˾���������˻���<span class="changecolor">�տ����ʺű���Ϊ�����˺ţ�����д�����ʺŽ��Զ��˿</span> </td>
  </tr>
  <tr>
    <td class="row1"><span class="changecolor">*&nbsp;</span>�տ�������:</td>
    <td><input type="text" readonly name="recname" value="${recname}" size="32"/></td>
    <td>&raquo��������ĸ�����֣����ܳ���30���ַ�</td>
  </tr>
  <tr>
    <td class="row1"><span class="changecolor">*&nbsp;</span>�տ��˵�ַ:</td>
    <td>
    	<input type="text" readonly name="recaddress" value="${recaddress}" size="32"/>
    </td>
    <td>&raquo��������ĸ�����֣����ܳ���100���ַ���Ϊ��֤���˳�����������д��ϸ��ַ���������ҡ����С��ֵ� </td>
  </tr>

  <tr>
    <td class="row1"><span class="changecolor">*&nbsp;</span>SWIFT����:</td>
    <td colspan="2"><input readonly type="text" name="swiftcode" value="${swiftcode}" size="32"/></td>
  </tr>
  <tr>
    <td class="row1">�տ��˿���������:</td>
    <td colspan="2"><input readonly type="text" name="recbankname" value="${recbankname}" size="32"/></td>
  </tr>
  <tr>
    <td class="row1">�տ��˿����е�ַ:</td>
    <td colspan="2"><input readonly type="text" name="recbankadd" value="${recbankadd}" size="32"/></td>
  </tr>
  <tr>
    <td colspan="3"  class="color">3.����д���������Ϣ</td>
  </tr>
  <tr>
    <td class="row1"><span class="changecolor">*&nbsp;</span>����</td>
    <td><input readonly type="text" name="moneynum" value="${moneynum}" size="32"/></td>
    <td>&raquo<span class="changecolor">�������շѱ�׼Ϊ�����ѣ������0.1%�����20Ԫ�����300Ԫ���ӵ籨�ѣ�80Ԫ/�ʣ������Ϸ����۳���ң��ӻ���˻���ֱ�ӿ��ա�����ȷ���������˻������㹻�Ļ���������ѣ����򽫵��»��ʧ�ܡ�</span>����������ʼ������ۼ��޶�Ϊ�������30��Ԫ���糬�޶�޷����������֪Ϥ </td>
  </tr>

  <tr>
    <td class="row1">���ԣ�</td>
    <td><textarea  readonly name="payps"  rows="" cols="" >${payps}</textarea></td>
    <td>&raquo��������ĸ�����֣����ܳ���100���ַ� </td>
  </tr>

</table>
</form>
  <tr>
    <td colspan="3" id="nextstep"><input type="button" value="�ύ" onclick="nextSub()" /></td>
  </tr>
    </div>
    <iframe id="footer" src="<%=path %>/foot.jsp" width="980" height="136" frameborder="0" scrolling="no marginwidth="0px;"></iframe>
</div>
</body>
</html>
