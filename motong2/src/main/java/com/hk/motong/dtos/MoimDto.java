package com.hk.motong.dtos;

public class MoimDto {
	
	private int moim_seq;
	private int leader;
	private int account_seq;
	private String mname;
	private String pin;
	
	public MoimDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MoimDto(int moim_seq, int leader, int account_seq, String mname, String pin) {
		super();
		this.moim_seq = moim_seq;
		this.leader = leader;
		this.account_seq = account_seq;
		this.mname = mname;
		this.pin = pin;
	}



	public int getMoim_seq() {
		return moim_seq;
	}

	public void setMoim_seq(int moim_seq) {
		this.moim_seq = moim_seq;
	}

	public int getLeader() {
		return leader;
	}

	public void setLeader(int leader) {
		this.leader = leader;
	}

	public int getAccount_seq() {
		return account_seq;
	}

	public void setAccount_seq(int account_seq) {
		this.account_seq = account_seq;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getPin() {
		return pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	@Override
	public String toString() {
		return "MoimDto [moim_seq=" + moim_seq + ", leader=" + leader + ", account_seq=" + account_seq + ", mname="
				+ mname + ", pin=" + pin + "]";
	}
	

}