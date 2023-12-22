package com.hk.motong.dtos;

public class AccountTableDto {
	private String account_seq;
	private int user_seq;
	private String fintech_use_num;
	private int balance_amt;
	private String bank_name;
	public AccountTableDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AccountTableDto(String account_seq, int user_seq, String fintech_use_num, int balance_amt, String bank_name) {
		super();
		this.account_seq = account_seq;
		this.user_seq = user_seq;
		this.fintech_use_num = fintech_use_num;
		this.balance_amt = balance_amt;
		this.bank_name = bank_name;
	}
	public String getAccount_seq() {
		return account_seq;
	}
	public void setAccount_seq(String account_seq) {
		this.account_seq = account_seq;
	}
	public int getUser_seq() {
		return user_seq;
	}
	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}
	public String getFintech_use_num() {
		return fintech_use_num;
	}
	public void setFintech_use_num(String fintech_use_num) {
		this.fintech_use_num = fintech_use_num;
	}
	public int getBalance_amt() {
		return balance_amt;
	}
	public void setBalance_amt(int balance_amt) {
		this.balance_amt = balance_amt;
	}
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	@Override
	public String toString() {
		return "AccountDto [account_seq=" + account_seq + ", user_seq=" + user_seq + ", fintech_use_num="
				+ fintech_use_num + ", balance_amt=" + balance_amt + ", bank_name=" + bank_name + "]";
	}
	
	
}