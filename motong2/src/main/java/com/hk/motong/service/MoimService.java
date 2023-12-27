package com.hk.motong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.motong.dtos.AccountTableDto;
import com.hk.motong.dtos.MoimDto;
import com.hk.motong.dtos.MoimDto;
import com.hk.motong.mapper.MoimMapper;

@Service
public class MoimService {

   @Autowired
   private MoimMapper moimMapper;
   
	public int getPCount() {
		return moimMapper.getPCount();
	}
   
   public List<MoimDto> getMoimList(String pnum) {		
		List<MoimDto> list = moimMapper.getMoimList(pnum);				
		return list;
	}
  
   public List<MoimDto> subsMoim(int user_seq){
      return moimMapper.subsMoim(user_seq);
   }
   
   public List<String> moimLeader(int user_seq) {
	   return moimMapper.moimLeader(user_seq);
   }
   
   public List<String> getMyAccountList(int user_seq){
	   return moimMapper.getMyAccountList(user_seq);
   }
   
   public void addMoim(String moimname, String Account, String moimPin) {
	    moimMapper.addMoim(moimname, Account, moimPin);
   }




}
