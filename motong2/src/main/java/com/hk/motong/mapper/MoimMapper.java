package com.hk.motong.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hk.motong.dtos.ListDto;

@Mapper
public interface MoimMapper {
	public List<ListDto> getMoimList();
}
