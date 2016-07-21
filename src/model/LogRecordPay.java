package model;

public class LogRecordPay {

	private String time;
	private String desposit;
	private String payment;
	private String remain;
	private String remark;
	private String currency;
	private String pacc;
	private String cacc;


	private String username;
	private String cardid;
	private String payacc;
	private String payname;
	private String payaddr;
	private String payswift;
	private String payStaA;
	private String payStaN;

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getDesposit() {
		return desposit;
	}

	public void setDesposit(String desposit) {
		this.desposit = desposit;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getRemain() {
		return remain;
	}

	public void setRemain(String remain) {
		this.remain = remain;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public String getPacc() {
		return pacc;
	}

	public void setPacc(String pacc) {
		this.pacc = pacc;
	}

	public String getCacc() {
		return cacc;
	}

	public void setCacc(String cacc) {
		this.cacc = cacc;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getCardid() {
		return cardid;
	}

	public void setCardid(String cardid) {
		this.cardid = cardid;
	}

	public String getPayacc() {
		return payacc;
	}

	public void setPayacc(String payacc) {
		this.payacc = payacc;
	}

	public String getPayname() {
		return payname;
	}

	public void setPayname(String payname) {
		this.payname = payname;
	}

	public String getPayaddr() {
		return payaddr;
	}

	public void setPayaddr(String payaddr) {
		this.payaddr = payaddr;
	}

	public String getPayswift() {
		return payswift;
	}

	public void setPayswift(String payswift) {
		this.payswift = payswift;
	}

	public String getPayStaA() {
		return payStaA;
	}

	public void setPayStaA(String payStaA) {
		this.payStaA = payStaA;
	}

	public String getPayStaN() {
		return payStaN;
	}

	public void setPayStaN(String payStaN) {
		this.payStaN = payStaN;
	}
	
	public String toString() {
		return "LogRecordPay [time=" + time + ", desposit=" + desposit
				+ ", payment=" + payment + ", remain=" + remain + ", remark="
				+ remark + ", currency=" + currency + ", pacc=" + pacc
				+ ", cacc=" + cacc + ", username=" + username + ", cardid="
				+ cardid + ", payacc=" + payacc + ", payname=" + payname
				+ ", payaddr=" + payaddr + ", payswift=" + payswift
				+ ", payStaA=" + payStaA + ", payStaN=" + payStaN + "]";
	}

}
