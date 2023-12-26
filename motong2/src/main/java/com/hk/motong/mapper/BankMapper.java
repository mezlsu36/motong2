package com.hk.motong.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hk.motong.dtos.AccountDto;
import com.hk.motong.dtos.MoimDto;
import com.hk.motong.dtos.UserDto;

@Mapper
public interface BankMapper {
   
	public AccountDto getmoimAccount(int user_seq);
  
   
}