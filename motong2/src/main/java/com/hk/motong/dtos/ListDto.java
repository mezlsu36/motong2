package com.hk.motong.dtos;

public class ListDto { 
	private int moim_seq;
	private int leader;
	private String account_num;
	private String mname;
	private int pin;
	
	public ListDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @return the moim_seq
	 */
	public int getMoim_seq() {
		return moim_seq;
	}

	/**
	 * @param moim_seq the moim_seq to set
	 */
	public void setMoim_seq(int moim_seq) {
		this.moim_seq = moim_seq;
	}

	/**
	 * @return the leader
	 */
	public int getLeader() {
		return leader;
	}

	/**
	 * @param leader the leader to set
	 */
	public void setLeader(int leader) {
		this.leader = leader;
	}

	/**
	 * @return the account_num
	 */
	public String getAccount_num() {
		return account_num;
	}

	/**
	 * @param account_num the account_num to set
	 */
	public void setAccount_num(String account_num) {
		this.account_num = account_num;
	}

	/**
	 * @return the mname
	 */
	public String getMname() {
		return mname;
	}

	/**
	 * @param mname the mname to set
	 */
	public void setMname(String mname) {
		this.mname = mname;
	}

	/**
	 * @return the pin
	 */
	public int getPin() {
		return pin;
	}

	/**
	 * @param pin the pin to set
	 */
	public void setPin(int pin) {
		this.pin = pin;
	}

	public ListDto(int moim_seq, int leader, String account_num, String mname, int pin) {
		super();
		this.moim_seq = moim_seq;
		this.leader = leader;
		this.account_num = account_num;
		this.mname = mname;
		this.pin = pin;
	}

	@Override
	public String toString() {
		return "ListDto [moim_seq=" + moim_seq + ", leader=" + leader + ", account_num=" + account_num + ", mname="
				+ mname + ", pin=" + pin + "]";
	}
	
	
	
}