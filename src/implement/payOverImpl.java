package implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Dao.payOverDao;
import model.PayOver;
import util.Util;

public class payOverImpl implements payOverDao {

	public ArrayList<PayOver> payOverSeaAll() {
		Connection conn = Util.getConnection();
		StringBuffer sql = new StringBuffer();
		sql.append("select name,addr,account,swift,staAccoName,staAccoAddr from t_payover");

		PreparedStatement ptmt = null;

		ArrayList<PayOver> gs = new ArrayList<PayOver>();

		try {
			ptmt = conn.prepareCall(sql.toString());
			ResultSet rs = ptmt.executeQuery(sql.toString());
			PayOver g = null;

			while (rs.next())

			{
				g = new PayOver();
				g.setName(rs.getString("name"));
				g.setAccount(rs.getString("account"));
				g.setAddr(rs.getString("addr"));
				g.setSwift(rs.getString("swift"));
				g.setStaAccoName(rs.getString("staAccoName"));
				g.setStaAccoAddr(rs.getString("staAccoAddr"));
				gs.add(g);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return gs;

	}

	public ArrayList<PayOver> payOverSea(String account) {
		PayOver po = null;
		ArrayList<PayOver> result = new ArrayList<PayOver>();
		Connection conn = Util.getConnection();
		String sqlString = "select name,addr,account,swift,staAccoName,staAccoAddr from t_payover where account=?";

		PreparedStatement ptmp;
		try {
			ptmp = conn.prepareStatement(sqlString);
			ptmp.setString(1, account);
			ResultSet rs = ptmp.executeQuery();
			while (rs.next()) {
				po = new PayOver();
				po.setName(rs.getString("name"));
				po.setAccount(rs.getString("account"));
				po.setAddr(rs.getString("addr"));
				po.setSwift(rs.getString("swift"));
				po.setStaAccoName(rs.getString("staAccoName"));
				po.setStaAccoAddr(rs.getString("staAccoAddr"));
				result.add(po);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;

	}

	public void addpayOver(PayOver payOver) {
		
		Connection connection = Util.getConnection();
		StringBuffer strsql = new StringBuffer();
		strsql.append("insert into t_payover(name,addr,account,swift,staAccoName,staAccoAddr,amount) ");
		strsql.append(" values(?,?,?,?,?,?,?)");

		PreparedStatement ptmp = null;
		
	try {
	
			ptmp = connection.prepareCall(strsql.toString());
			
			ptmp.setString(1, payOver.getName());
			ptmp.setString(2, payOver.getAddr());
			ptmp.setString(3, payOver.getAccount());
			ptmp.setString(4, payOver.getSwift());
			ptmp.setString(5, payOver.getStaAccoName());
			ptmp.setString(6, payOver.getStaAccoAddr());
			ptmp.setString(7, payOver.getAmount());
			
			ptmp.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			Util.closeParam(null, null, ptmp, null);

		}

	}

	public void updatepayOver(PayOver payOver)
	{
		
		StringBuffer sql = new StringBuffer();
		sql.append("update t_payover set name=?,account=?,addr=?,swift=?,staAccoName=?,staAccoAddr=?,amount=?");
		sql.append(" where account= "+Util.account_old);
		Connection connection = Util.getConnection();

		PreparedStatement ptmp = null;

		try {

			ptmp = connection.prepareCall(sql.toString());
			ptmp.setString(1, payOver.getName());
			ptmp.setString(2, payOver.getAccount());
			ptmp.setString(3, payOver.getAddr());
			
			ptmp.setString(4, payOver.getSwift());
			ptmp.setString(5, payOver.getStaAccoName());
			ptmp.setString(6, payOver.getStaAccoAddr());
			ptmp.setString(7, payOver.getAmount());
	
			ptmp.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			Util.closeParam(null, null, ptmp, null);
		}
	}

	public void deletpayOver(String account)
	{
		Connection conn = Util.getConnection();

		String sqlString = "delete  from t_payover where account=?";

		PreparedStatement ptmp;
		try {
			ptmp = conn.prepareStatement(sqlString);
			ptmp.setString(1, account);
			ptmp.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}
	
	public boolean checkAccount(String account) {
		String sql = "select account from t_payover where account=? ";
		Connection conn = Util.getConnection();
		ResultSet rSet = null;
		PreparedStatement ptmp = null;

		try {
			ptmp = conn.prepareStatement(sql);

			ptmp.setString(1, account);
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
