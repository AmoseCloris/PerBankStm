package servlet1;


import implement.userImpl;

import java.io.IOException;
import java.io.Writer;

import javassist.compiler.ast.Variable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.userDao;
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
		userDao userDao=new userImpl();
		String method=request.getParameter("method");
		String path=request.getContextPath();
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
			//获取session对象
			HttpSession session=request.getSession();
			String username=request.getParameter("username");
			String userpwd=request.getParameter("userpwd");
//			boolean flag=userDao.checkLoginUser(username, userpwd);
//			if(flag)
//			{	
//			response.sendRedirect("login-success.jsp");
//			}else {
//			{
//					response.sendRedirect("login.jsp");
//			}
		user=userDao.checkLoginUser1(username, userpwd);
		if(user!=null)
		{

			session.setAttribute("name",user.getName());
			session.setAttribute("username", user.getUsername());
			session.setAttribute("userpwd",user.getUserpwd());
			session.setAttribute("cardid",user.getCardid());
			session.setAttribute("phone",user.getPhone());
			session.setAttribute("email",user.getEmail());
			session.setAttribute("address",user.getAddress());
					
		}
		
		request.getRequestDispatcher("login-success.jsp").forward(request,response);

		}
		
		if("logout".equals(method)){
			
			HttpSession session = request.getSession();
			session.removeAttribute("name");
			session.removeAttribute("username");
			session.removeAttribute("userpwd");
			session.removeAttribute("cardid");
			session.removeAttribute("phone");
			session.removeAttribute("userpwd");
			session.removeAttribute("email");
			session.removeAttribute("address");
			
			//让session失效
			session.invalidate();
			
			response.sendRedirect(path+"/login.jsp");
		}
		
		if("checkPassWord".equals(method)){
			String oldp=request.getParameter("oldpwd");
			boolean flag=userDao.checkp(oldp);
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
		
		if("updatepwd".equals(method))
		{
			String a=request.getParameter("currentname");
			String b=request.getParameter("newpwd1");
			
			userDao.updatepwd(b,a);
			
			HttpSession session = request.getSession();
			session.removeAttribute("name");
			session.removeAttribute("username");
			session.removeAttribute("userpwd");
			session.removeAttribute("cardid");
			session.removeAttribute("phone");
			session.removeAttribute("userpwd");
			session.removeAttribute("email");
			session.removeAttribute("address");
			
			//让session失效
			session.invalidate();
			
			response.sendRedirect(path+"/login.jsp");
	}
	}

}
