package servlet1;

import implement.ProductImpl;
import implement.payOverImpl;







import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PayOver;
import model.User;
import Dao.ProductDao;
import Dao.payOverDao;

public class payOverServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8"); 
		response.setCharacterEncoding("UTF-8");

		PayOver payOver=new PayOver();
		payOverDao payDao=new payOverImpl();
		String method=request.getParameter("method");

		if("payOverAdd".equals(method))
		{

			payOver.setName(request.getParameter("name"));
			payOver.setAddr(request.getParameter("addr"));
			payOver.setAccount(request.getParameter("account1"));
			payOver.setSwift(request.getParameter("swift"));
			payOver.setStaAccoName(request.getParameter("staAccoName"));
			payOver.setStaAccoAddr(request.getParameter("staAccoAddr"));
		
			payDao.addpayOver(payOver);
			response.sendRedirect("/PerBankStm/payover/payOverList.jsp");
		}
		else if("checkacc".equals(method))
		{
			String account1=request.getParameter("account1");
			boolean flag=payDao.checkAccount(account1);
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
		else if("update".equals(method))
		{

			payOver.setName(request.getParameter("name"));
			payOver.setAddr(request.getParameter("addr"));
			payOver.setAccount(request.getParameter("account1"));
			payOver.setSwift(request.getParameter("swift"));
			payOver.setStaAccoName(request.getParameter("staAccoName"));
			payOver.setStaAccoAddr(request.getParameter("staAccoAddr"));
			payDao.updatepayOver(payOver);
			System.out.println("---------------------------------");
			System.out.println(payOver);
			
			payDao.addpayOver(payOver);
		//	 request.getRequestDispatcher("/payover/payOverList.jsp").forward(request, response);
			response.sendRedirect("/PerBankStm/payover/payOverList.jsp");
		}
		
		else if("delete".equals(method))
		{
	
			  String strings=request.getParameter("arrayObj");
			  String[] sourceStrArray=strings.split(",");
		for(int i=0;i<sourceStrArray.length;i++){
			payDao.deletpayOver(sourceStrArray[i]);
		}
		response.sendRedirect("/PerBankStm/payover/payOverList.jsp");
		}
		
		
		else if("informationTrans".equals(method))
		{
			ArrayList<PayOver> gs = payDao.payOverSea(request.getParameter("account"));
			payOver=gs.get(0);

//			payOver.setName(request.getParameter("name"));
//			payOver.setAddr(request.getParameter("addr"));
//			payOver.setAccount(request.getParameter("account1"));
//			payOver.setSwift(request.getParameter("swift"));
//			payOver.setStaAccoName(request.getParameter("staAccoName"));
//			payOver.setStaAccoAddr(request.getParameter("staAccoAddr"));
				
	        request.setAttribute("payOver", payOver );
//	 request.setAttribute("account",);
//	 request.setAttribute("addr", );
//	 request.setAttribute("swift", );
//	 request.setAttribute("staAccoName",  );
//	request.setAttribute("staAccoAddr", );

	 System.out.println(""+gs.get(0).getAccount()+""+gs.get(0).getName());
	 request.getRequestDispatcher("/payover/payOverUpdate.jsp").forward(request, response);
		}
		
	}

}
