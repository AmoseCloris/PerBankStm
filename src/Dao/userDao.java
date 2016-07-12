package Dao;

import model.*;

public interface userDao {
	
	public  void  adduser(User user);

	public boolean checkuser(String username);
	
	public boolean checkLoginUser(String username,String userpwd);
	
	


}
