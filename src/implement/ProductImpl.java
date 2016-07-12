package implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import Dao.ProductDao;
import model.Product;
import util.Util;

public class ProductImpl implements ProductDao {

	public void addProduct(Product pro) {
		Connection connection = Util.getConnection();
		StringBuffer strsql = new StringBuffer();
		strsql.append("insert into t_product(productid,productname,price,manufactory,number)");
		strsql.append(" values(?,?,?,?,?)");

		PreparedStatement ptmp = null;

		int index = 1;

		try {

			ptmp = connection.prepareCall(strsql.toString());

			if (pro.getProductid() != null && !"".equals(pro.getProductid())) {
				ptmp.setString(index++, pro.getProductid());
			}

			if (pro.getProductname() != null && !"".equals(pro.getProductname())) {
				ptmp.setString(index++, pro.getProductname());
			}

			if (pro.getPrice() != null && !"".equals(pro.getPrice())) {
				ptmp.setString(index++, pro.getPrice());
			}

			if (pro.getManufactory() != null && !"".equals(pro.getManufactory())) {
				ptmp.setString(index++, pro.getManufactory());
			}

			if (pro.getNumber() != null && !"".equals(pro.getNumber())) {
				ptmp.setString(index++, pro.getNumber());
			}

			ptmp.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			Util.closeParam(null, null, ptmp, null);

		}

	}

	public List<Product> query() throws SQLException {

		Connection conn = Util.getConnection();
		StringBuffer sql = new StringBuffer();
		sql.append("select productid,productname,price,manufactory,number from t_product");

		PreparedStatement ptmt = null;
		int count = 0;
		int index = 1;

		ptmt = conn.prepareCall(sql.toString());
		ResultSet rs = ptmt.executeQuery(sql.toString());

		List<Product> gs = new ArrayList<Product>();
		Product g = null;

		while (rs.next())

		{
			g = new Product();
			g.setProductname(rs.getString("productname"));
			g.setProductid(rs.getString("productid"));
			g.setPrice(rs.getString("price"));
			g.setManufactory(rs.getString("manufactory"));
			g.setNumber(rs.getString("number"));
			gs.add(g);
		}

		return gs;

	}

	public void updateProduct(Product pro) {
		StringBuffer sql = new StringBuffer();
		sql.append("update t_product set productname=?,price=?,manufactory=?,number=? where productid=?");
		Connection connection = Util.getConnection();

		PreparedStatement ptmp = null;

		int index = 1;

		try {

			ptmp = connection.prepareCall(sql.toString());

			if (pro.getProductname() != null && !"".equals(pro.getProductname())) {
				ptmp.setString(index++, pro.getProductname());
			}

			if (pro.getPrice() != null && !"".equals(pro.getPrice())) {
				ptmp.setString(index++, pro.getPrice());
			}

			if (pro.getManufactory() != null && !"".equals(pro.getManufactory())) {
				ptmp.setString(index++, pro.getManufactory());
			}

			if (pro.getNumber() != null && !"".equals(pro.getNumber())) {
				ptmp.setString(index++, pro.getNumber());
			}

			if (pro.getProductid() != null && !"".equals(pro.getProductid())) {
				ptmp.setString(index++, pro.getProductid());
			}

			ptmp.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			Util.closeParam(null, null, ptmp, null);
		}

	}

	public void deleProduct(String id) {
		Connection conn = Util.getConnection();
		String sqlString = "delete  from t_product where productid=?";

		Product pr = new Product();
		PreparedStatement ptmp;
		try {
			ptmp = conn.prepareStatement(sqlString);
			ptmp.setString(1, id);
			ptmp.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public boolean check(String productno)
	{
		if(!Util.checkStr(productno))
		{
			return false;
		}
		
		String sql="select productid from t_product where productid=? ";
		Connection conn = Util.getConnection();
        ResultSet rSet=null;
		PreparedStatement ptmp = null;
	
		try {
			ptmp = conn.prepareStatement(sql);
			
			ptmp.setString(1, productno);
			rSet=ptmp.executeQuery();
			
			if(rSet.next())
			{
				return true;}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
		
		
	}
}
