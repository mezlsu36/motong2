package com.hk.motong.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.hk.motong.dtos.ListDto;

public class moimDao {
	
	private String namespace="com.hk.motong.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<ListDto> getMoim(int moim_seq) {		
		return sqlSession.selectOne(namespace+"moim_seq", moim_seq);
	}
}
