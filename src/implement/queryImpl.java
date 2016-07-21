package implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Dao.queryDao;
import model.Account;
import model.LogRecordPay;
import model.PayOver;
import util.Util;

public class queryImpl implements queryDao{

	public ArrayList<LogRecordPay> logSerSome() {
		Connection conn = Util.getConnection();
		PreparedStatement ptmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append("select time,cacc,payacc,payment,remain from t_log");

		ArrayList<LogRecordPay> as = new ArrayList<LogRecordPay>();

		try {
			ptmt = conn.prepareCall(sql.toString());
			ResultSet rs = ptmt.executeQuery(sql.toString());
			LogRecordPay lr = null;

			while (rs.next())

			{
				lr = new LogRecordPay();
				
				lr.setTime(rs.getString("time"));
				lr.setCacc(rs.getString("cacc"));
				lr.setPayacc(rs.getString("payacc"));
				lr.setPayment(rs.getString("payment"));
				lr.setRemain(rs.getString("remain"));
				
				as.add(lr);
			}

		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return as;

	}

	public LogRecordPay getAll(String time) {
		Connection conn = Util.getConnection();
		PreparedStatement ptmt = null;

		LogRecordPay lr = new LogRecordPay();
		StringBuffer sql = new StringBuffer();
		sql.append("select time,desposit,payment,remain ,remark,currency,pacc,cacc,username,cardid,"
				+ "payacc,payname,payaddr,payswift, payStaA,payStaN from t_log where  time='"+time+"'");
	
		try {
			ptmt = conn.prepareCall(sql.toString());
			
			ResultSet rs = ptmt.executeQuery(sql.toString());
			
			while (rs.next()) {
				lr.setTime(rs.getString("time"));
				lr.setDesposit(rs.getString("desposit"));
				lr.setPayment(rs.getString("payment"));
				lr.setRemain(rs.getString("remain"));
				lr.setRemark(rs.getString("remark"));
				lr.setCurrency(rs.getString("currency"));
				lr.setPacc(rs.getString("pacc"));
				lr.setCacc(rs.getString("cacc"));
				lr.setUsername(rs.getString("username"));
				lr.setCardid(rs.getString("cardid"));
				lr.setPacc(rs.getString("payacc"));
				lr.setPayname(rs.getString("payname"));
				lr.setPayaddr(rs.getString("payaddr"));
				lr.setPayswift(rs.getString("payswift"));
				lr.setPayStaA(rs.getString("payStaA"));
				lr.setPayStaN(rs.getString("payStaN"));
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

		return lr;
	}
}
