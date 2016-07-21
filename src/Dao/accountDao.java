package Dao;

import java.util.ArrayList;

import model.Account;
import model.Forcur;

public interface accountDao {
	
	public ArrayList<Account> accountSearchAll();
	public void addAccount(Account account);
	public void normlState(String accountString);
	public void lossState(String accountString);
	public void frizeState(String accountString);
	public boolean checkAccount(String account);
	public void addSubAccount(Account account);
	public String getAmount(String account,String amount,String subAmount);
	public ArrayList<Account> getParentAmount(String account);
	public ArrayList<Account> getAccountState(String account);
	public ArrayList<Forcur> getCurrency(String account);
}
