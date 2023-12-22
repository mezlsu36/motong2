package com.hk.motong.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.hk.motong.dtos.AccountTableDto;
import com.hk.motong.dtos.UserDto;

@Mapper
public interface UserMapper {
	public int addUser(UserDto dto);
	
	public String idChk(String email);
	
	public UserDto loginUser(UserDto dto);
	
	public UserDto myInfo(String email);
	
	public boolean updateMyInfo(UserDto dto);
	
	public boolean delUser(String email);
	
	//토큰 발급받아서 DB에 저장
	public boolean registToken(UserDto dto);
	//계좌테이블에 계좌 정보 저장
	public boolean registAccount(AccountTableDto dto);
}
