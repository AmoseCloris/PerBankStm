package servlet1;

import implement.queryImpl;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.queryDao;
import model.LogRecordPay;
import model.PayOver;

public class queryServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		queryDao queryDao=new queryImpl();
		if("query".equals(method)){

			String times=request.getParameter("time");
			
			LogRecordPay  logRecordPay= queryDao.getAll(times);
			
			String parrentid=logRecordPay.getPacc();
			String payaccchd=logRecordPay.getCacc();
			String currency=logRecordPay.getCurrency();
			String amount=logRecordPay.getDesposit();
			String engname=logRecordPay.getUsername();
			String paycardid=logRecordPay.getCardid();
			
			request.setAttribute("parrentid", parrentid);
			request.setAttribute("payaccchd", payaccchd);
			request.setAttribute("currency", currency);
			request.setAttribute("amount", amount);
			request.setAttribute("engname", engname);
			request.setAttribute("paycardid", paycardid);

			
			String recaccount=logRecordPay.getPayacc();
			String recname=logRecordPay.getPayname();
			String recaddress=logRecordPay.getPayaddr();
			String swiftcode=logRecordPay.getPayswift();
			String recbankname=logRecordPay.getPayStaN();
			String recbankadd=logRecordPay.getPayStaA();
			
			request.setAttribute("recaccount", recaccount);
			request.setAttribute("recname", recname);
			request.setAttribute("recaddress", recaddress);
			request.setAttribute("swiftcode", swiftcode);
			request.setAttribute("recbankname", recbankname);
			request.setAttribute("recbankadd", recbankadd);
			
			
			String moneynum=logRecordPay.getPayment();			
			String payps=logRecordPay.getRemark();
			
			request.setAttribute("moneynum", moneynum);
			request.setAttribute("payps", payps);
			

			
			request.getRequestDispatcher("/query/show.jsp").forward(request, response);
			
		}
	}

}
