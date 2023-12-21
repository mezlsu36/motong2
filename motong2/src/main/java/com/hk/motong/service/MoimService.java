package com.hk.motong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.motong.dtos.ListDto;
import com.hk.motong.mapper.MoimMapper;

@Service
public class MoimService implements IMoimService{
	
	@Autowired
	private MoimMapper moimMapper;
	

	@Override
	public List<ListDto> getMoimList() {
		
		List<ListDto> list = moimMapper.getMoimList();
		
		
		return list;
	}

}
