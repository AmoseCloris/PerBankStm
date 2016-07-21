package implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.Util;
import model.*;
import Dao.userDao;

public class userImpl implements userDao {

	// public static void main(String[] args) {
	// UserDaoImpl impl = new UserDaoImpl();
	// List<User> users = impl.getUsersByJson();
	//
	// for (User user : users) {
	// System.out.println(user);
	// }
	// }
	//
	// @Override //get Users
	// public List<User> getUsersByJson() {
	// Connection conn = UtilDB.getConnection2();
	//
	// List<User> users = null;
	// String sql = "select * from t_register";
	//
	// QueryRunner qr = new QueryRunner();
	// try {
	//
	// users = (List<User>)qr.query(conn, sql, new BeanListHandler(User.class)
	// );
	//
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	//
	// return users;
	// }
	//
	public void adduser(User user) {
		Connection connection = Util.getConnection();
		StringBuffer strsql = new StringBuffer();
		strsql.append("insert into t_user(name,username,userpwd,cardid,phone,email,address)");
		strsql.append(" values(?,?,?,?,?,?,?)");

		PreparedStatement ptmp = null;

		int index = 1;

		try {

			ptmp = connection.prepareCall(strsql.toString());

			if (user.getName() != null && !"".equals(user.getName())) {
				ptmp.setString(index++, user.getName());
			}

			if (user.getUsername() != null && !"".equals(user.getUsername())) {
				ptmp.setString(index++, user.getUsername());
			}

			if (user.getUserpwd() != null && !"".equals(user.getUserpwd())) {
				ptmp.setString(index++, user.getUserpwd());
			}

			if (user.getCardid() != null && !"".equals(user.getCardid())) {
				ptmp.setString(index++, user.getCardid());
			}

			if (user.getPhone() != null && !"".equals(user.getPhone())) {
				ptmp.setString(index++, user.getPhone());
			}
			ptmp.setString(index++, user.getEmail());
			ptmp.setString(index++, user.getAddress());
			ptmp.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			Util.closeParam(null, null, ptmp, null);

		}

	}

	public boolean checkuser(String username) {
		String sql = "select username from t_user where username=? ";
		Connection conn = Util.getConnection();
		ResultSet rSet = null;
		PreparedStatement ptmp = null;

		try {
			ptmp = conn.prepareStatement(sql);

			ptmp.setString(1, username);
			rSet = ptmp.executeQuery();

			if (rSet.next()) {
				return true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Util.closeParam(rSet, null, ptmp, null);
		}

		return false;
	}

//	public boolean checkLoginUser(String username, String userpwd) {
//		String sqlString = "select username,userpwd from t_user where username=? and userpwd=?";
//		Connection connection = Util.getConnection();
//		PreparedStatement ptmp = null;
//		ResultSet rSet = null;
//
//		try {
//			ptmp = connection.prepareStatement(sqlString);
//			ptmp.setString(1, username);
//			ptmp.setString(2, userpwd);
//			rSet = ptmp.executeQuery();
//
//			if (rSet.next()) {
//				return true;
//			}
//
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			Util.closeParam(rSet, null, ptmp, null);
//		}
//
//		return false;
//	}
//

	public User checkLoginUser1(String username, String userpwd) {
		System.out.println(username);
		
		StringBuffer sqlString = new StringBuffer();
		sqlString.append("select name,username,userpwd,cardid,phone,email,address from t_user where 1=1 ");
		
		Connection connection = Util.getConnection();
		
		if(username!=null&& !"".equals(username))
		{
			sqlString.append( " and username=?");
		}
		if(username!=null&& !"".equals(userpwd))
		{
			sqlString.append( " and userpwd=?");
		}
		
		PreparedStatement ptmp = null;
		ResultSet rSet = null;
        User user=new User();
        try {
			ptmp = connection.prepareStatement(sqlString.toString());
			
			if (username != null && !"".equals(username)) {
				ptmp.setString(1, username);
			}
			if (username != null && !"".equals(userpwd)) {
				ptmp.setString(2, userpwd);
			}

			rSet = ptmp.executeQuery();
			
			
			
				if (rSet.next()) {
					user.setName(rSet.getString(1));
					user.setUsername(rSet.getString(2));
					user.setUserpwd(rSet.getString(3));
					user.setCardid(rSet.getString(4));
					user.setPhone(rSet.getString(5));
					user.setEmail(rSet.getString(6));
					user.setAddress(rSet.getString(7));
					  
				}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			Util.closeParam(rSet, null, ptmp, null);

		}
		return user;
	}


	public boolean checkp(String oldp) {
		String sql = "select userpwd from t_user where userpwd=? ";
		Connection conn = Util.getConnection();
		ResultSet rSet = null;
		PreparedStatement ptmp = null;

		try {
			ptmp = conn.prepareStatement(sql);

			ptmp.setString(1,oldp);
			rSet = ptmp.executeQuery();

			if (rSet.next()) {
				return true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Util.closeParam(rSet, null, ptmp, null);
		}

		return false;
	}


	public void updatepwd(String newpwd,String username) {
		StringBuffer sql = new StringBuffer();
		sql.append("update t_user set userpwd='"+newpwd+"'");
		sql.append(" where username= '"+username+"'");
		Connection connection = Util.getConnection();

		PreparedStatement ptmp = null;

		try {

			ptmp = connection.prepareCall(sql.toString());
			ptmp.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			Util.closeParam(null, null, ptmp, null);
		}
		
	}



}
