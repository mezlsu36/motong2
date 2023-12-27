package com.hk.motong.apidto;

import org.springframework.web.bind.annotation.RequestBody;

import lombok.Data;

public class WithdrawReqDto {
	private String bank_tran_id;
	private String cntr_account_type;
	private String cntr_account_num;
	private String dps_print_content;
	private String fintech_use_num;
	private String tran_amt;
	private String tran_dtime;
	private String req_client_name;
	private String req_client_num;
	private String transfer_purpose;
	private String req_client_fintech_use_num;
	
	public WithdrawReqDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public WithdrawReqDto(String bank_tran_id, String cntr_account_type, String cntr_account_num,
			String dps_print_content, String fintech_use_num, String tran_amt, String tran_dtime,
			String req_client_name, String req_client_num, String transfer_purpose, String req_client_fintech_use_num) {
		super();
		this.bank_tran_id = bank_tran_id;
		this.cntr_account_type = cntr_account_type;
		this.cntr_account_num = cntr_account_num;
		this.dps_print_content = dps_print_content;
		this.fintech_use_num = fintech_use_num;
		this.tran_amt = tran_amt;
		this.tran_dtime = tran_dtime;
		this.req_client_name = req_client_name;
		this.req_client_num = req_client_num;
		this.transfer_purpose = transfer_purpose;
		this.req_client_fintech_use_num = req_client_fintech_use_num;
	}

	public String getBank_tran_id() {
		return bank_tran_id;
	}

	public void setBank_tran_id(String bank_tran_id) {
		this.bank_tran_id = bank_tran_id;
	}

	public String getCntr_account_type() {
		return cntr_account_type;
	}

	public void setCntr_account_type(String cntr_account_type) {
		this.cntr_account_type = cntr_account_type;
	}

	public String getCntr_account_num() {
		return cntr_account_num;
	}

	public void setCntr_account_num(String cntr_account_num) {
		this.cntr_account_num = cntr_account_num;
	}

	public String getDps_print_content() {
		return dps_print_content;
	}

	public void setDps_print_content(String dps_print_content) {
		this.dps_print_content = dps_print_content;
	}

	public String getFintech_use_num() {
		return fintech_use_num;
	}

	public void setFintech_use_num(String fintech_use_num) {
		this.fintech_use_num = fintech_use_num;
	}

	public String getTran_amt() {
		return tran_amt;
	}

	public void setTran_amt(String tran_amt) {
		this.tran_amt = tran_amt;
	}

	public String getTran_dtime() {
		return tran_dtime;
	}

	public void setTran_dtime(String tran_dtime) {
		this.tran_dtime = tran_dtime;
	}

	public String getReq_client_name() {
		return req_client_name;
	}

	public void setReq_client_name(String req_client_name) {
		this.req_client_name = req_client_name;
	}

	public String getReq_client_num() {
		return req_client_num;
	}

	public void setReq_client_num(String req_client_num) {
		this.req_client_num = req_client_num;
	}

	public String getTransfer_purpose() {
		return transfer_purpose;
	}

	public void setTransfer_purpose(String transfer_purpose) {
		this.transfer_purpose = transfer_purpose;
	}

	public String getReq_client_fintech_use_num() {
		return req_client_fintech_use_num;
	}

	public void setReq_client_fintech_use_num(String req_client_fintech_use_num) {
		this.req_client_fintech_use_num = req_client_fintech_use_num;
	}

	@Override
	public String toString() {
		return "WithdrawReqDto [bank_tran_id=" + bank_tran_id + ", cntr_account_type=" + cntr_account_type
				+ ", cntr_account_num=" + cntr_account_num + ", dps_print_content=" + dps_print_content
				+ ", fintech_use_num=" + fintech_use_num + ", tran_amt=" + tran_amt + ", tran_dtime=" + tran_dtime
				+ ", req_client_name=" + req_client_name + ", req_client_num=" + req_client_num + ", transfer_purpose="
				+ transfer_purpose + ", req_client_fintech_use_num=" + req_client_fintech_use_num + "]";
	}
	
	
}
