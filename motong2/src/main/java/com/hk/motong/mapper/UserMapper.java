package com.hk.motong.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.hk.motong.dtos.UserDto;

@Mapper
public interface UserMapper {
	public int addUser(UserDto dto);
	
	public String idChk(String email);
	
	public UserDto loginUser(UserDto dto);
}
