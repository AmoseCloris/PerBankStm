package implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;

import Dao.accountDao;
import model.Account;
import model.Forcur;
import util.Util;

public class accountImpl implements accountDao {

    public ArrayList<Account> accountSearchAll() {
		Connection conn = Util.getConnection();
		PreparedStatement ptmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append("select u.username,u.cardid,a.account,a.amount,a.accountType,a.accountState from t_account a, t_user u");
		sql.append(" where u.username=a.username and a.parentAccount=''");

		ArrayList<Account> as = new ArrayList<Account>();

		try {
			ptmt = conn.prepareCall(sql.toString());
			ResultSet rs = ptmt.executeQuery(sql.toString());
			Account ac = null;

			while (rs.next())

			{
				ac = new Account();
				ac.setAccount(rs.getString("account"));
				ac.setAccountType(rs.getString("accountType"));
				ac.setAccountState(rs.getString("accountState"));
				ac.setAmount(rs.getString("amount"));

				ac.setUsername(rs.getString("username"));
				ac.setCardid(rs.getString("cardid"));
				as.add(ac);
			}

		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return as;

	}

	public void addAccount(Account account) {
		Connection conn = Util.getConnection();
		PreparedStatement ptmt = null;

		StringBuffer strsql = new StringBuffer();
		strsql.append("insert into t_account(currency,parentAccount,username,cardid,account,amount,accountType,accountState) ");
		strsql.append(" values('人民币','','Clris','140602199702021111',?,?,?,'0')");

		try {

			ptmt = conn.prepareCall(strsql.toString());
			ptmt.setString(1, account.getAccount());
			ptmt.setString(2, account.getAmount());
			ptmt.setString(3, account.getAccountType());

			ptmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			Util.closeParam(null, null, ptmt, null);

		}

	}
	
	public void addSubAccount(Account account) {
		Connection conn = Util.getConnection();
		PreparedStatement ptmt = null;

		StringBuffer strsql = new StringBuffer();
		strsql.append("insert into t_account(currency,parentAccount,username,cardid,account,amount,accountType,accountState) ");
		strsql.append(" values(?,?,?,?,?,?,'0','0')");

		try {

			ptmt = conn.prepareCall(strsql.toString());
			ptmt.setString(1, account.getCurrency());
			ptmt.setString(2, account.getParentAccount());
			ptmt.setString(3, account.getUsername());
			ptmt.setString(4, account.getCardid());
			ptmt.setString(5, account.getAccount());
			ptmt.setString(6, account.getAmount());
			
			ptmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			Util.closeParam(null, null, ptmt, null);

		}

	}


	public void normlState(String accountString) {
		StringBuffer sql = new StringBuffer();
		sql.append("update t_account set accountState='0' where account=?");
		Connection connection = Util.getConnection();
		PreparedStatement  ptmp= null;
		try {
			ptmp = connection.prepareCall(sql.toString());
	
			ptmp.setString(1, accountString);
			ptmp.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			Util.closeParam(null, null, ptmp, null);
		}
	}

	public void lossState(String accountString) {
		StringBuffer sql = new StringBuffer();
		sql.append("update t_account set accountState='1' where account=?");
		Connection connection = Util.getConnection();
		PreparedStatement  ptmp= null;
		try {
			ptmp = connection.prepareCall(sql.toString());
	
			ptmp.setString(1, accountString);
			ptmp.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			Util.closeParam(null, null, ptmp, null);
		}
	}

	public void frizeState(String accountString) {
		StringBuffer sql = new StringBuffer();
		sql.append("update t_account set accountState='3' where account= ? and accountState!='1' ");
		Connection connection = Util.getConnection();
		PreparedStatement  ptmp= null;
		try {
			ptmp = connection.prepareCall(sql.toString());
	
			ptmp.setString(1, accountString);
			ptmp.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			Util.closeParam(null, null, ptmp, null);
		}

	}

	public boolean checkAccount(String account) {
		String sql = "select account from t_account where account=? ";
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

	public String getAmount(String account,String amount,String subAmount) {
		int a=Integer.parseInt(amount);
		int b=Integer.parseInt(subAmount);
		int c=a-b;
		if(c<0)
			{
			return "0";
			}
		String s=""+c;
		StringBuffer sql = new StringBuffer();
		sql.append("update t_account set amount="+s);
		sql.append(" where account="+account+" and parentAccount=''");
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
		return null;
	}


	public ArrayList<Account> getParentAmount(String account) {
		Connection conn = Util.getConnection();
		PreparedStatement ptmt = null;
     //   String as="";
		Account ac = null;
		StringBuffer sql = new StringBuffer();
		sql.append("select a.amount from t_account a, t_user u");
		sql.append(" where u.username=a.username and a.parentAccount='' and a.account="
				+ account);
		
		ArrayList<Account> as = new ArrayList<Account>();
		try {
			ptmt = conn.prepareCall(sql.toString());
			ResultSet rs = ptmt.executeQuery(sql.toString());

			while (rs.next())
			{
				ac=new Account();
				ac.setAmount(rs.getString("amount"));
				as.add(ac);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

		return as;


	}

	public ArrayList<Forcur> getCurrency(String account) {
		Connection conn = Util.getConnection();
		PreparedStatement ptmt = null;
    
		StringBuffer sql = new StringBuffer();
		
		sql.append("select CURNAME from forcur where CURNAME not in(select currency from t_account");
		sql.append(" where parentAccount="+account+")");
		System.out.println("++++++++++++++++"+sql);		
		ArrayList<Forcur> as = new ArrayList<Forcur>();
		Forcur foucurItem = null;
		try {
			ptmt = conn.prepareCall(sql.toString());
			
			ResultSet rs = ptmt.executeQuery(sql.toString());
			ResultSetMetaData m = null;// 获取 列信息
			m = rs.getMetaData();
			int columns = m.getColumnCount();
			//显示列,表格的表头
			for (int i = 1; i <= columns; i++) {
				System.out.print(m.getColumnName(i));
				System.out.print("\t\t");
			}

		
			// 显示表格内容
			while (rs.next()) {
				for (int i = 1; i <= columns; i++) {
					foucurItem = new Forcur();
					foucurItem.setCurname(rs.getString(i));
					System.out.print(rs.getString(i));
					System.out.print("\t\t");
				}
				System.out.println();
				as.add(foucurItem);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		System.out.println(as.size());
		return as;

	}

	@Override
	public ArrayList<Account> getAccountState(String account) {
		Connection conn = Util.getConnection();
		PreparedStatement ptmt = null;
     //   String as="";
		Account ac = null;
		StringBuffer sql = new StringBuffer();
		sql.append("select a.accountState from t_account a ");
		sql.append(" where  a.parentAccount='' and a.account="
				+ account);
	
		ArrayList<Account> as = new ArrayList<Account>();
		try {
			ptmt = conn.prepareCall(sql.toString());
			ResultSet rs = ptmt.executeQuery(sql.toString());

			while (rs.next())
			{
				ac=new Account();
				ac.setAccountState(rs.getString("accountState"));
				as.add(ac);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

		return as;

	}


}
