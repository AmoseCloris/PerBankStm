package model;

public class Account {

	private String account;
	private String username;
	private String cardid;
	private String amount;
	private String accountType;
	private String accountState;
	private String parentAccount;
	private String currency;
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public String getAccountState() {
		return accountState;
	}

	public void setAccountState(String accountState) {
		this.accountState = accountState;
	}

	public String getParentAccount() {
		return parentAccount;
	}

	public void setParentAccount(String parentAccount) {
		this.parentAccount = parentAccount;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public String getCardid() {
		return cardid;
	}

	public void setCardid(String cardid) {
		this.cardid = cardid;
	}


	@Override
	public String toString() {
		return "Account [account=" + account + ", username=" + username
				+ ", cardid=" + cardid + ", amount=" + amount
				+ ", accountType=" + accountType + ", accountState="
				+ accountState + ", parentAccount=" + parentAccount
				+ ", currency=" + currency + "]";
	}



}
