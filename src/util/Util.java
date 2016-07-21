package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Util {
	private static final String url = "jdbc:mysql://127.0.0.1/a?useUnicode=true&characterEncoding=utf-8";
	private static final String user = "root";
	private static final String password = "";
	public static String account_old;
	private static Connection conn;
	public static String trans_account_old;

	// 静态快是执行最早的
	static {

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static Connection getConnection() {
		// TODO Auto-generated method stub
		return conn;
	}

	public static void closeParam(ResultSet rs, Statement s, PreparedStatement preparedStatement, Connection c) {

		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (s != null) {
			try {
				s.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (preparedStatement != null) {
			try {
				preparedStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (c != null) {
			try {
				c.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}


	public static boolean checkStr(String obj)
	{
		if(obj==null||obj==""||obj.length()==0)
		{
			return false;
		
		}
		return true;
	}

	
}
