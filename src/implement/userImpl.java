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

	public boolean checkLoginUser(String username, String userpwd) {
		String sqlString = "select username,userpwd from t_user where username=? and userpwd=?";
		Connection connection = Util.getConnection();
		PreparedStatement ptmp = null;
		ResultSet rSet = null;

		try {
			ptmp = connection.prepareStatement(sqlString);
			ptmp.setString(1, username);
			ptmp.setString(2, userpwd);
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


}
