package implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.hibernate.validator.util.SetAccessibility;

import model.Account;
import model.LogRecordPay;
import model.PayOver;
import util.Util;
import Dao.transDao;

public class transImpl implements transDao {
	
	
	public ArrayList<Account> getAcc() {
		Connection conn = Util.getConnection();
		PreparedStatement ptmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append("select account from t_account ");
		sql.append(" where parentAccount='' and accountState='0'");

		ArrayList<Account> as = new ArrayList<Account>();

		try {
			ptmt = conn.prepareCall(sql.toString());
			ResultSet rs = ptmt.executeQuery(sql.toString());
			Account ac = null;

			while (rs.next())

			{
				ac = new Account();
				ac.setAccount(rs.getString("account"));
				as.add(ac);
			}

		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return as;
	}


	public ArrayList<Account> getAllThings(String paccount) {
		Connection conn = Util.getConnection();
		PreparedStatement ptmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append("select parentAccount, account,username,cardid,currency from t_account where  parentAccount="+paccount);
	
		ArrayList<Account> as = new ArrayList<Account>();
		try {
			ptmt = conn.prepareCall(sql.toString());
			ResultSet rs = ptmt.executeQuery(sql.toString());

			Account ac = null;
			
			while (rs.next())
			{
				ac=new Account();
				ac.setParentAccount(rs.getString("parentAccount"));
				ac.setAccount(rs.getString("account"));
				ac.setUsername(rs.getString("username"));
				ac.setCardid(rs.getString("cardid"));
				ac.setCurrency(rs.getString("currency"));
				as.add(ac);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

		return as;

	}


	public void updateStr(String addCou,String account) {
		StringBuffer sql = new StringBuffer();
		sql.append("update t_account set addr='"+addCou+"' where account=" + account );
		sql.append(" and parentAccount=''");
		Connection connection = Util.getConnection();
		PreparedStatement  ptmp= null;
		try {
			ptmp = connection.prepareCall(sql.toString());
			ptmp.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			Util.closeParam(null, null, ptmp, null);
		}
		
	}


	public Account getCurr(String account) {
		Connection conn = Util.getConnection();
		PreparedStatement ptmt = null;

		Account ac = new Account();
		StringBuffer sql = new StringBuffer();
		sql.append("select currency,username,cardid,amount from t_account");
		sql.append(" where  parentAccount!='' and account='" + account+"'");

		try {
			ptmt = conn.prepareCall(sql.toString());
			ResultSet rs = ptmt.executeQuery(sql.toString());
			while (rs.next()) {
				ac.setCurrency(rs.getString("currency"));
				ac.setUsername(rs.getString("username"));
				ac.setCardid(rs.getString("cardid"));
				ac.setAmount(rs.getString("amount"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return ac;
	}


	public PayOver getAll(String account) {
		Connection conn = Util.getConnection();
		PreparedStatement ptmt = null;

		PayOver ac = new PayOver();
		StringBuffer sql = new StringBuffer();
		sql.append("select account, name,addr,swift,staAccoName,staAccoAddr from t_payover where  account="+account);
	
		try {
			ptmt = conn.prepareCall(sql.toString());
			ResultSet rs = ptmt.executeQuery(sql.toString());
			while (rs.next()) {
				ac.setAccount(rs.getString("account"));
				ac.setName(rs.getString("name"));
				ac.setAddr(rs.getString("addr"));
				ac.setSwift(rs.getString("swift"));
				ac.setStaAccoName(rs.getString("staAccoName"));
				ac.setStaAccoAddr(rs.getString("staAccoAddr"));
	
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

		return ac;

	}


	public void getAmount(String account,String amount,String subAmount) {
		int a=Integer.parseInt(amount);
		int b=Integer.parseInt(subAmount);
		int c=a-b;

		String s=""+c;
		StringBuffer sql = new StringBuffer();
		sql.append("update t_account set amount="+s);
		sql.append(" where account='"+account+"' and parentAccount!=''");
	
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


	public void addLog(LogRecordPay logRecordPay) {
		Connection conn = Util.getConnection();
		PreparedStatement ptmt = null;
		StringBuffer strsql = new StringBuffer();
		strsql.append("insert into t_log(time,desposit,payment,remain ,remark,currency,pacc,cacc, ");
		strsql.append("username,cardid,payacc,payname,payaddr,payswift, payStaA,payStaN)");
		strsql.append(" values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

		try {

			ptmt = conn.prepareCall(strsql.toString());
			ptmt.setString(1,logRecordPay.getTime());
			ptmt.setString(2, logRecordPay.getDesposit());
			ptmt.setString(3, logRecordPay.getPayment());
			ptmt.setString(4, logRecordPay.getRemain());
			ptmt.setString(5, logRecordPay.getRemark());
			ptmt.setString(6, logRecordPay.getCurrency());
			ptmt.setString(7, logRecordPay.getPacc());
			ptmt.setString(8, logRecordPay.getCacc());
			ptmt.setString(9, logRecordPay.getUsername());
			ptmt.setString(10, logRecordPay.getCardid());
			ptmt.setString(11, logRecordPay.getPayacc());
			ptmt.setString(12, logRecordPay.getPayname());
			ptmt.setString(13, logRecordPay.getPayaddr());
			ptmt.setString(14, logRecordPay.getPayswift());
			ptmt.setString(15, logRecordPay.getPayStaA());
			ptmt.setString(16, logRecordPay.getPayStaN());

			System.out.println(logRecordPay.toString());
			ptmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}
		
	}
}
