package servlet1;


import implement.userImpl;

import java.io.IOException;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.userDao;
import model.PayOver;
import model.User;

public class servlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 
		response.setCharacterEncoding("UTF-8");
		User user=new User();
		PayOver payOver=new PayOver();
		userDao userDao=new userImpl();
		String method=request.getParameter("method");
		
		if("register".equals(method))
		{
			user.setName(request.getParameter("name"));
			user.setUsername(request.getParameter("username"));
			user.setUserpwd(request.getParameter("pass"));
			user.setPhone(request.getParameter("phone"));
			user.setCardid(request.getParameter("cardId"));
			user.setEmail(request.getParameter("mail"));
			user.setAddress(request.getParameter("addr"));
			
			response.sendRedirect("index.jsp");
			userDao.adduser(user);
			
		}
		if("checkUsername".equals(method))
		{
			String username=request.getParameter("username");
			boolean flag=userDao.checkuser(username);
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
		
		if("login".equals(method))
		{
			String username=request.getParameter("username");
			String userpwd=request.getParameter("userpwd");
			boolean flag=userDao.checkLoginUser(username, userpwd);
			if(flag)
			{	
			response.sendRedirect("login-success.jsp");
			}else {
				{
					response.sendRedirect("login.jsp");
				}
			}
		}
		



	}

}
