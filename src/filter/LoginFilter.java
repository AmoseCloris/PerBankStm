package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(urlPatterns={"/payover/*","/account/*","/trans/*","/query/*","/splashID.jsp"})

public class LoginFilter implements Filter {

	String login_uri="";
	public void destroy() {
		

	}
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		
		//将ServletRequest对象转换为HttpServletRequest
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse resp=(HttpServletResponse)response;
		
		String request_uri=req.getContextPath();
		String uri=req.getRequestURI();
		String path=uri.substring(request_uri.length());
		//创建session对象
		HttpSession session=req.getSession();
		//判断session是否有值
		if(session!=null){
			//已经登录，可以正常操作
			if(session.getAttribute("username")!=null){
				chain.doFilter(request, response);
				return;
			}else{
				req.getRequestDispatcher("/login.jsp").forward(req, resp);
				
			}
		}
			
	}

	public void init(FilterConfig config) throws ServletException {

	}

}
