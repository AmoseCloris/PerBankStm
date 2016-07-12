package model;

public class PayOver {

	private int payOverId;
	private String name;
	private String swift;
	private String account;
	private String staAccoName;
	private String staAccoAddr;
	private String addr;
	private String cusidString;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSwift() {
		return swift;
	}

	public void setSwift(String swift) {
		this.swift = swift;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getStaAccoName() {
		return staAccoName;
	}

	public void setStaAccoName(String staAccoName) {
		this.staAccoName = staAccoName;
	}

	public String getStaAccoAddr() {
		return staAccoAddr;
	}

	public void setStaAccoAddr(String staAccoAddr) {
		this.staAccoAddr = staAccoAddr;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getCusidString() {
		return cusidString;
	}

	public void setCusidString(String cusidString) {
		this.cusidString = cusidString;
	}


	public int getPayOverId() {
		return payOverId;
	}

	public void setPayOverId(int payOverId) {
		this.payOverId = payOverId;
	}

	@Override
	public String toString() {
		return "PayOver [payOverId=" + payOverId + ", name=" + name
				+ ", swift=" + swift + ", account=" + account
				+ ", staAccoName=" + staAccoName + ", staAccoAddr="
				+ staAccoAddr + ", addr=" + addr + ", cusidString="
				+ cusidString + "]";
	}
	
	

}
