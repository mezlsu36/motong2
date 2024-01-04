package com.hk.motong.dtos;

public class MoimDto { 
   private int moim_seq;
   private int leader;
   private String name;//팀장 이름
   private int account_seq;
   private String mname;
   private String account_num_masked;
   private String bank_name;
   private String delflag; //계좌 사용중인지 여부
   private int pin;
   private int roomno;
   
	public MoimDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MoimDto(int moim_seq, int leader, String name, int account_seq, String mname, String account_num_masked,
			String bank_name, String delflag, int pin, int roomno) {
		super();
		this.moim_seq = moim_seq;
		this.leader = leader;
		this.name = name;
		this.account_seq = account_seq;
		this.mname = mname;
		this.account_num_masked = account_num_masked;
		this.bank_name = bank_name;
		this.delflag = delflag;
		this.pin = pin;
		this.roomno = roomno;
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
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the account_seq
	 */
	public int getAccount_seq() {
		return account_seq;
	}

	/**
	 * @param account_seq the account_seq to set
	 */
	public void setAccount_seq(int account_seq) {
		this.account_seq = account_seq;
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
	 * @return the account_num_masked
	 */
	public String getAccount_num_masked() {
		return account_num_masked;
	}

	/**
	 * @param account_num_masked the account_num_masked to set
	 */
	public void setAccount_num_masked(String account_num_masked) {
		this.account_num_masked = account_num_masked;
	}

	/**
	 * @return the bank_name
	 */
	public String getBank_name() {
		return bank_name;
	}

	/**
	 * @param bank_name the bank_name to set
	 */
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}

	/**
	 * @return the delflag
	 */
	public String getDelflag() {
		return delflag;
	}

	/**
	 * @param delflag the delflag to set
	 */
	public void setDelflag(String delflag) {
		this.delflag = delflag;
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

	/**
	 * @return the roomno
	 */
	public int getRoomno() {
		return roomno;
	}

	/**
	 * @param roomno the roomno to set
	 */
	public void setRoomno(int roomno) {
		this.roomno = roomno;
	}

	@Override
	public String toString() {
		return "MoimDto [moim_seq=" + moim_seq + ", leader=" + leader + ", name=" + name + ", account_seq="
				+ account_seq + ", mname=" + mname + ", account_num_masked=" + account_num_masked + ", bank_name="
				+ bank_name + ", delflag=" + delflag + ", pin=" + pin + ", roomno=" + roomno + "]";
	}
	
   
   
  }