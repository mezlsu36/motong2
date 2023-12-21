package com.hk.motong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.motong.daos.moimDao;
import com.hk.motong.dtos.ListDto;

@Service
public class moimService {
	
	private moimDao moimDao;
	
	public List<ListDto> getMoim(int moim_seq) {
		return moimDao.getMoim(moim_seq);
	}

}
