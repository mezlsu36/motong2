package com.hk.motong.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.motong.dtos.MoimDto;
import com.hk.motong.mapper.MoimMapper;

@Service
public class MoimService {

   @Autowired
   private MoimMapper moimMapper;
   
   public List<MoimDto> subsMoim(int user_seq){
      return moimMapper.subsMoim(user_seq);
   }
   
   public List<String> moimLeader(int user_seq) {
	   return moimMapper.moimLeader(user_seq);
   }
   
   public String moimName(int account_seq) {
	   return moimMapper.moimName(account_seq);
   }

   //모임리스트
   public int getPCount() {
		return moimMapper.getPCount();
	}

   public List<MoimDto> getMoimList(String pnum) {		
	   List<MoimDto> list = moimMapper.getMoimList(pnum);				
	   return list;
   }
   
   public List<MoimDto> getMyAccountList(int user_seq){
	   return moimMapper.getMyAccountList(user_seq);
   }
   
   public boolean addMoim(MoimDto dto){
	   return moimMapper.addMoim(dto);
   }
   
   public int getMoimSeq(int account_seq) {
	   return moimMapper.getMoimSeq(account_seq);
   }
   
   public boolean addUserMoim(Map<String, Integer> map) {
	   return moimMapper.addUserMoim(map);
   }
   
   public boolean updateAcDelflag(int account_seq) {
	   return moimMapper.updateAcDelflag(account_seq);
   }
   
   public List<MoimDto> moimSearch(String searchData){
	   List<MoimDto> list = moimMapper.moimSearch(searchData);
	   return list;
   }
}
