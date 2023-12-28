package com.hk.motong.mapper;

import java.util.List;
import java.util.Map;

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
   
   public List<MoimDto> getMyAccountList(int user_seq);
   
   public boolean addMoim(MoimDto dto);
   
   public int getMoimSeq(int account_seq);
   
   public boolean addUserMoim(Map<String, Integer> map);
   
//   public void addMoim(@Param("moimname") String moimname, 
//		   			   @Param("selectedAccount") String selectedAccount, 
//		   			   @Param("moimPin") String moimPin);
}