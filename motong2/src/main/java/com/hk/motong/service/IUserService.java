package com.hk.motong.service;


import com.hk.motong.dtos.AccountTableDto;
import com.hk.motong.dtos.UserDto;

public interface IUserService {
	public boolean addUser(UserDto dto);
	
	public String idChk(String email);
	
	public UserDto loginUser(UserDto dto);
	
	public UserDto myInfo(String email) ;
	
	public boolean updateMyInfo(UserDto dto) ;
	
	public boolean delUser(String email);
	
	public boolean registTokenAccount(UserDto dto, AccountTableDto adto) ;

	public boolean registAccount(AccountTableDto adto) ;
}
