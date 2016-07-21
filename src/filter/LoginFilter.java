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
		
		//��ServletRequest����ת��ΪHttpServletRequest
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse resp=(HttpServletResponse)response;
		
		String request_uri=req.getContextPath();
		String uri=req.getRequestURI();
		String path=uri.substring(request_uri.length());
		//����session����
		HttpSession session=req.getSession();
		//�ж�session�Ƿ���ֵ
		if(session!=null){
			//�Ѿ���¼��������������
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
