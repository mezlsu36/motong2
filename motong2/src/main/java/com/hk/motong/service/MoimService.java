package com.hk.motong.service;

import java.util.List;

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
}