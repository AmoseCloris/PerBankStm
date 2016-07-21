package servlet1;

import implement.accountImpl;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Util;
import Dao.accountDao;
import model.Account;
import model.Forcur;

public class AccountServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 
		response.setCharacterEncoding("UTF-8");
		
		Account accountGet=new Account();
		accountDao accountDao=new accountImpl();
		String method=request.getParameter("method");

		if ("accountAdd".equals(method)) {
			String strings = request.getParameter("account");
			String strings1 = request.getParameter("amount");
			String str = strings.substring(0, 4);
			accountGet.setAccount(strings);
			accountGet.setAmount(strings1);
			System.out.println(str);
			if (str.equals("6215")) {          //"=="表示对象比较，equals表示内容比较
				accountGet.setAccountType("0");// 普通卡
			}
			else if (str.equals("6216")) {
				accountGet.setAccountType("1");// 金卡
			}
			else if (str.equals("6217")) {
				accountGet.setAccountType("2");// 白金卡
			}
			accountDao.addAccount(accountGet);
			response.sendRedirect("/PerBankStm/account/accountList.jsp");

		}
		
		if("normalState".equals(method))
		{
			 String strings=request.getParameter("accountString");
			 accountDao.normlState(strings);
			 request.getRequestDispatcher("/account/accountList.jsp").forward(request, response);
				
		}
		
		if("lostState".equals(method))
		{
			 String strings=request.getParameter("accountString");
			 accountDao.lossState(strings);
			 request.getRequestDispatcher("/account/accountList.jsp").forward(request, response);
				
		}
		
		if("frizeState".equals(method))
		{
			 String strings=request.getParameter("accountString");
			 accountDao.frizeState(strings);
			 request.getRequestDispatcher("/account/accountList.jsp").forward(request, response);
				
		}
		
		if("checkacc".equals(method))
		{
			String account1=request.getParameter("account1");
			boolean flag=accountDao.checkAccount(account1);
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
		
		if("subAccoAdd".equals(method))
		{
			String strA = request.getParameter("subAmount");
			String subAccount = request.getParameter("subAcco");
			String parentaccount = request.getParameter("acco");
		
			ArrayList<Account> ac = accountDao.getParentAmount(parentaccount);
			
			String amount=ac.get(0).getAmount();
			String amountStr=accountDao.getAmount(parentaccount, amount, strA);
			
			accountGet.setParentAccount(parentaccount);
			accountGet.setAmount(strA);
			accountGet.setUsername( request.getParameter("subAcconame"));
			accountGet.setCardid(request.getParameter("subCardid"));
			accountGet.setAccount(subAccount);	
			accountGet.setCurrency(request.getParameter("currency"));
			accountGet.setAccountState("0");
			accountGet.setAccountType("0");    

			accountDao.addSubAccount(accountGet);
			System.out.println(accountGet.toString());
			//response.sendRedirect("/PerBankStm/account/accountList.jsp");
			request.getRequestDispatcher("/account/accountList.jsp").forward(request, response);
			
		}
		
		if("subAccoAdd1".equals(method))
		{
			String x=request.getParameter("accountString1");
			
			accountDao accountdao = new accountImpl();
		 	ArrayList<Forcur> forcur = accountdao.getCurrency(x);
		 	ArrayList<Account> haha=accountDao.getParentAmount(x);
		 	
		 	String y=haha.get(0).getAmount();
		 	request.setAttribute("acco", x );
		 	request.setAttribute("y", y );
		 	request.setAttribute("forcur", forcur);
		 	ArrayList<Account> a = accountdao.getAccountState(x);
			String string=a.get(0).getAccountState();
			//System.out.println(forcur.toString());
		
			if(string.equals("0")){
			request.getRequestDispatcher("/account/subAccoAdd.jsp").forward(request, response);
			}else {
			//	request.getRequestDispatcher("/account/accountList.jsp").forward(request, response);
				
//				PrintWriter out = response.getWriter();
//				
//				out.println("<script type='text/javascript'>");
//				out.println("alert('账户不能冻结或者挂失');</script>");
				response.sendRedirect("/PerBankStm/account/accountList.jsp");
				
			}
		}
	}

}
