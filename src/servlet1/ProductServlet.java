package servlet1;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.nio.channels.WritableByteChannel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ProductDao;
import implement.ProductImpl;
import model.Product;

public class ProductServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Product pro=new Product();
		ProductDao productDao=new ProductImpl();
		String method=request.getParameter("method");
		
		if("add".equals(method))
		{
			
			pro.setProductid(request.getParameter("productid"));
			pro.setProductname(request.getParameter("productname"));
			pro.setPrice(request.getParameter("price"));
			pro.setManufactory(request.getParameter("manufactory"));
			pro.setNumber(request.getParameter("number"));
			response.sendRedirect("updateProduct.jsp");
			productDao.addProduct(pro);
			
		}
		if("checkno".equals(method))
		{
			String productno=request.getParameter("productid");
			boolean flag=productDao.check(productno);
			Writer outWriter=response.getWriter();
			if(!flag)
			{
				outWriter.write("yes");
			}else {
				
					outWriter.write("no");
				
			}
			outWriter.flush();
			outWriter.close();
		}
		if("update".equals(method))
		{
			ProductDao pr=new ProductImpl();
			
			pro.setProductid(request.getParameter("productid"));
			pro.setProductname(request.getParameter("productname"));
			pro.setPrice(request.getParameter("price"));
			pro.setManufactory(request.getParameter("manufactory"));
			pro.setNumber(request.getParameter("number"));
			
			pr.updateProduct(pro);
			response.sendRedirect("updateProduct.jsp");
		}
		if("delete".equals(method))
		{
			productDao.deleProduct(request.getParameter("productid"));
			response.sendRedirect("updateProduct.jsp");
		}
		
		
		
		
	}

}
