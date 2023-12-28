package com.hk.motong.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hk.motong.dtos.MoimDto;

import feign.Param;

@Mapper
public interface MoimMapper {
   
   public List<MoimDto> subsMoim(int user_seq);
   
   public List<String> moimLeader(int user_seq);
   
   public String moimName(int account_seq);
   
   
   //모임리스트
   public int getPCount();
   
   public List<MoimDto> getMoimList(String pnum);
   
   public List<String> getMyAccountList(int user_seq);
   
   public int addMoim(MoimDto dto);
   
   public void addMoim(@Param("moimname") String moimname, 
		   			   @Param("selectedAccount") String selectedAccount, 
		   			   @Param("moimPin") String moimPin);
}