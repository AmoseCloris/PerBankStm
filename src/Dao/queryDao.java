package Dao;

import java.util.ArrayList;

import model.LogRecordPay;

public interface queryDao {
	
	public ArrayList<LogRecordPay> logSerSome();
	public LogRecordPay getAll(String time);
}
