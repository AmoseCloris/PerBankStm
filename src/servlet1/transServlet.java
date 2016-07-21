package servlet1;

import implement.payOverImpl;
import implement.transImpl;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Util;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import model.Account;
import model.LogRecordPay;
import model.PayOver;
import Dao.payOverDao;
import Dao.transDao;

public class transServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String method = request.getParameter("method");
		LogRecordPay logRecordPay = new LogRecordPay();
		Account acco=new Account();
		PayOver payOver=new PayOver();
		payOverDao payDao=new payOverImpl();
		transDao transDao=new transImpl();
		
		if ("remit".equals(method)) {
			JSONArray jsonarray = new JSONArray();
			JSONObject json = null;
			String transaccount = request.getParameter("transAccount");
			
			// 查询选中主账户下的所有子账户
			ArrayList<Account> list = transDao.getAllThings(transaccount);

			if (list != null && list.size() > 0) {
				for (int i = 0; i < list.size(); i++) {
					json = new JSONObject();
					json.put("accountchdno", list.get(i).getAccount());
					json.put("currency", list.get(i).getCurrency());
					jsonarray.add(json);
				}
			}
			PrintWriter out = response.getWriter();
			out.write(jsonarray.toString());
			out.flush();
			out.close();
		} else if ("remitchild".equals(method)) {
			//JSONArray jsonarray = new JSONArray();
			JSONObject json = null;
			String transaccountchild = request.getParameter("transAccountChild");
			// 查询选中主账户下的所有子账户
			acco  = transDao.getCurr(transaccountchild);
			json = new JSONObject();
			json.put("acco",acco);
			//jsonarray.add(json);
			
			PrintWriter out = response.getWriter();
			out.write(json.toString());
			//out.write(jsonarray.toString());
			out.flush();
			out.close();
		}
		
		if("checkacc".equals(method))
		{
			String account1=request.getParameter("account1");
		   boolean  flag=payDao.checkAccount(account1);
			Writer out=response.getWriter();
			if(flag)
			{
				out.write("yes");
			}else{
				out.write("no");
			}
			out.flush();
			out.close();
		}
		
		if("queryOverpay".equals(method))
		{
			String queryAccount = request.getParameter("queryAccount");
			
			PayOver ob = transDao.getAll(queryAccount);
			request.setAttribute("overbean",ob);
			
			String flag=request.getParameter("flag");
			if("query".equals(flag)){
				
				PrintWriter out=response.getWriter();
				JSONObject json1=new JSONObject();
				json1.put("payacc", ob.getAccount());
				json1.put("payname", ob.getName());
				json1.put("swiftcode", ob.getSwift());
				json1.put("accadd", ob.getStaAccoAddr());
				json1.put("accname", ob.getStaAccoName());
				json1.put("payadd", ob.getAddr());
				out.write(json1.toString());
				out.flush();
				out.close();
				
			}else{
			    request.getRequestDispatcher("./overpay/updateoverpay.jsp").forward(request, response);
			}
	
			
		}
		
		if("confirmrec".equals(method)){
			String a=request.getParameter("amount");
			String b=request.getParameter("money");
			String d=request.getParameter("account1");
			String c=request.getParameter("trans_sub");
			//添加新的境外存款人
			payOver.setName(request.getParameter("name"));
			payOver.setAddr(request.getParameter("addr"));
			payOver.setAccount(d);
			payOver.setSwift(request.getParameter("swift"));
			payOver.setStaAccoName(request.getParameter("staAccoName"));
			payOver.setStaAccoAddr(request.getParameter("staAccoAddr"));		
			payOver.setAmount(b);
			
			
			 boolean  flag=payDao.checkAccount(d);
		
			if(!flag)
			{	
				payDao.addpayOver(payOver);
			}else {
			}
			
			//金额的变化
			
			transDao.getAmount(c, a, b);
			
			//新的界面值得获取
			String parrentid=request.getParameter("trans_acc");
			String payaccchd=request.getParameter("trans_sub");
			String currency=request.getParameter("currency");
			String amount=request.getParameter("amount");
			String engname=request.getParameter("username");
			String paycardid=request.getParameter("cardid");
			String payaddress=request.getParameter("country");
			
			request.setAttribute("parrentid", parrentid);
			request.setAttribute("payaccchd", payaccchd);
			request.setAttribute("currency", currency);
			request.setAttribute("amount", amount);
			request.setAttribute("engname", engname);
			request.setAttribute("paycardid", paycardid);
			request.setAttribute("payaddress", payaddress);
			
			String recaccount=request.getParameter("account1");
			String recname=request.getParameter("name");
			String recaddress=request.getParameter("addr");
			String swiftcode=request.getParameter("swift");
			String recbankname=request.getParameter("staAccoName");
			String recbankadd=request.getParameter("staAccoAddr");
			
			request.setAttribute("recaccount", recaccount);
			request.setAttribute("recname", recname);
			request.setAttribute("recaddress", recaddress);
			request.setAttribute("swiftcode", swiftcode);
			request.setAttribute("recbankname", recbankname);
			request.setAttribute("recbankadd", recbankadd);
			
			
			String moneynum=request.getParameter("money");			
			String payps=request.getParameter("postcript");
			
			request.setAttribute("moneynum", moneynum);
			request.setAttribute("payps", payps);
			
			int x=Integer.parseInt(amount);
			int e=Integer.parseInt(moneynum);
			int f=x-e;
			SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy/MM/dd HH:mm:ss " ); 
			String str = sdf.format(new Date()); 
			logRecordPay.setTime(str);
			logRecordPay.setDesposit(amount);
			logRecordPay.setPayment(moneynum);
			logRecordPay.setRemain(f+"");
			logRecordPay.setRemark(payps);
			logRecordPay.setCurrency(currency);
			logRecordPay.setPacc(parrentid);
			logRecordPay.setCacc(payaccchd);
			logRecordPay.setUsername(engname);
			logRecordPay.setCardid(paycardid);
			logRecordPay.setPayacc(recaccount);
			logRecordPay.setPayname(recname);
			logRecordPay.setPayaddr(recaddress);
			logRecordPay.setPayswift(swiftcode);
			logRecordPay.setPayStaA(recbankadd);
			logRecordPay.setPayStaN(recbankadd);
		
			transDao.addLog(logRecordPay);
			
			request.getRequestDispatcher("/trans/showTrans.jsp").forward(request, response);
			
		}
		
		if("addLog".equals(method))
		{
			
			response.sendRedirect("/PerBankStm/trans/ok.jsp");

		}
	}

}
