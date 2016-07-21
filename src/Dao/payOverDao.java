package Dao;

import java.util.ArrayList;

import model.PayOver;

public interface payOverDao {
	
	public ArrayList<PayOver> payOverSeaAll();

	public ArrayList<PayOver> payOverSea(String account);

	public void addpayOver(PayOver payOver);
	
	public void updatepayOver(PayOver payOver);
	
	public void deletpayOver(String account);
	
	public boolean checkAccount(String account);
	

}
