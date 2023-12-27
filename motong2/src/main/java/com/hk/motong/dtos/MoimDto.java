package com.hk.motong.dtos;

public class MoimDto { 
   private int moim_seq;
   private int leader;
   private String name;//팀장 이름
   private String account_seq;
   private String mname;
   private int pin;
   public MoimDto() {
      super();
      // TODO Auto-generated constructor stub
   }
   public MoimDto(int moim_seq, int leader, String name, String account_seq, String mname, int pin) {
      super();
      this.moim_seq = moim_seq;
      this.leader = leader;
      this.name = name;
      this.account_seq = account_seq;
      this.mname = mname;
      this.pin = pin;
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
    * @return the user_name
    */
   public String getName() {
      return name;
   }
   /**
    * @param user_name the user_name to set
    */
   public void setName(String name) {
      this.name = name;
   }
   /**
    * @return the account_seq
    */
   public String getAccount_seq() {
      return account_seq;
   }
   /**
    * @param account_seq the account_seq to set
    */
   public void setAccount_seq(String account_seq) {
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
   @Override
   public String toString() {
      return "ListDto [moim_seq=" + moim_seq + ", leader=" + leader + ", name=" + name + ", account_seq="
            + account_seq + ", mname=" + mname + ", pin=" + pin + "]";
   }
   
   
   
   
}