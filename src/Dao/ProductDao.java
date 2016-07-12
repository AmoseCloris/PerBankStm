package Dao;

import java.sql.SQLException;
import java.util.List;

import model.Product;

public interface ProductDao {

	public void addProduct(Product pro) ;

	public List<Product> query() throws SQLException ;
	
	public void updateProduct(Product pro);

	public void deleProduct(String id);



	public boolean check(String productno);
}
