package com.hk.motong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.motong.dtos.UserDto;
import com.hk.motong.mapper.UserMapper;

@Service
public class UserService {

	@Autowired
	private UserMapper userMapper;
	
	public boolean addUser(UserDto dto) {
		int count=userMapper.addUser(dto);
		return count>0?true:false;
	}
	
	public String idChk(String email) {
		return userMapper.idChk(email);
	}
	
	public UserDto loginUser(UserDto dto) {
		return userMapper.loginUser(dto);
	}
}
