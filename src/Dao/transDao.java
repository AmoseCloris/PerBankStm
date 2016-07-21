package Dao;

import java.util.ArrayList;

import model.Account;
import model.LogRecordPay;
import model.PayOver;

public interface transDao {
	//��ȡ�������˻�
	public ArrayList<Account> getAcc();
	public ArrayList<Account> getAllThings(String account);
	public void updateStr(String addCou,String account);
	public Account getCurr(String account);
	public PayOver getAll(String account);
	public void getAmount(String account,String amount,String subAmount);
	
	public void addLog(LogRecordPay log);
}
