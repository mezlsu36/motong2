package com.hk.motong.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;

import com.hk.motong.dtos.ListDto;
import com.hk.motong.service.moimService;

@Controller

public class MoimController {
	
	@Autowired
	private moimService moimService;
	
	@GetMapping("/moimlist")
	public String moimList(Model model) {	//int moim_seq, 	
		System.out.println("moimlist.do요청");
		
//		List<ListDto>list=moimService.getMoim(moim_seq);
//		model.addAttribute("list", list);
		
		return "moimlist";
	}
	
}
