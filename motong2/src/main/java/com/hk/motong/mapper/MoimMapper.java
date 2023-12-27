package com.hk.motong.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hk.motong.dtos.ListDto;
import com.hk.motong.dtos.MoimDto;


@Mapper
public interface MoimMapper {
	
   public List<ListDto> getMoimList();
   
   public List<MoimDto> subsMoim(int user_seq);
   
   public List<String> moimLeader(int user_seq);
   
   public List<String> getMyAccountList(int user_seq);

   
}