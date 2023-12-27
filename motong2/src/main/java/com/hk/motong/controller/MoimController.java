package com.hk.motong.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hk.motong.dtos.ListDto;
import com.hk.motong.dtos.UserDto;
import com.hk.motong.service.MoimService;

import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/moim")
public class MoimController {
	
	@Autowired
	private MoimService moimService;
	
	@GetMapping("/moimlist")
	public String moimList(Model model) {		
		System.out.println("moimlist요청");
		
		List<ListDto>list=moimService.getMoimList();
		model.addAttribute("list", list);
		
		return "moimlist";
	}
	
	@GetMapping("/newmoim")
	public String newmoim(Model model, HttpServletRequest request) {
//		HttpSession session=request.getSession();
		
//		UserDto userDto =  (UserDto)session.getAttribute("ldto");
//		int user_seq= userDto.getUser_seq();
		int user_seq=1;
		List<String>acList=moimService.getMyAccountList(user_seq);
		model.addAttribute("acList", acList);
		System.out.println(acList);
        return "newmoim";
	}
	
	
	
}
