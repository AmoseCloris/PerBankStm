package Dao;

import model.*;

public interface userDao {
	
	public  void  adduser(User user);

	public boolean checkuser(String username);
	
//	public boolean checkLoginUser(String username,String userpwd);
	
	public User checkLoginUser1(String username,String userpwd);

	public boolean checkp(String oldp);
	
	public void updatepwd(String newpwd,String username);
}
