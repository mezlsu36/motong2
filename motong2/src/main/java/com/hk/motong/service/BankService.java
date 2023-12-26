package com.hk.motong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.motong.dtos.AccountDto;
import com.hk.motong.dtos.MoimDto;
import com.hk.motong.dtos.UserDto;
import com.hk.motong.mapper.BankMapper;
import com.hk.motong.mapper.MoimMapper;

@Service
public class BankService {
	
	@Autowired
	BankMapper bankMapper;
	
	public AccountDto getmoimAccount(int user_seq) {
		return bankMapper.getmoimAccount(user_seq);
	}
   
}