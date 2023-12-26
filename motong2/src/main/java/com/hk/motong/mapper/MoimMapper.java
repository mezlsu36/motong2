package com.hk.motong.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hk.motong.dtos.MoimDto;
import com.hk.motong.dtos.UserDto;

@Mapper
public interface MoimMapper {
   
   public List<MoimDto> subsMoim(int user_seq);
   
   public List<String> moimLeader(int user_seq);
   
   public String moimName(int user_seq);
}