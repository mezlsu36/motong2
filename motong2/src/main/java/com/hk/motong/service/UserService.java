package com.hk.motong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import com.hk.motong.dtos.AccountTableDto;
import com.hk.motong.dtos.UserDto;
import com.hk.motong.mapper.UserMapper;


@Service
public class UserService implements IUserService {
	
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
	
	public UserDto myInfo(String email) {
		return userMapper.myInfo(email);
	}
	
	public boolean updateMyInfo(UserDto dto) {
		return userMapper.updateMyInfo(dto);
	}
	
	public boolean delUser(String email) {
		return userMapper.delUser(email);
	}
	
	@Transactional(propagation =  Propagation.REQUIRED) //선언적
	public boolean registTokenAccount(UserDto dto, AccountTableDto adto) {
		int count =0 ;
		
		userMapper.registToken(dto);
		userMapper.registAccount(adto);
		
		return count>0?true:false;
	}

	
	public boolean registAccount(AccountTableDto adto) {
		return userMapper.registAccount(adto);
	}
	
}
