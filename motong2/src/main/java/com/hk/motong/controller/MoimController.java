package com.hk.motong.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hk.motong.dtos.MoimDto;
import com.hk.motong.dtos.UserDto;
import com.hk.motong.service.MoimService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/moim")
public class MoimController {
	
	@Autowired
	private MoimService moimService;
	
	@GetMapping("/moimlist")
	public String moimList(Model model) {		
		System.out.println("moimlist요청");
		
		List<MoimDto>list=moimService.getMoimList();
		model.addAttribute("list", list);
		System.out.println(list);
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
	
	@PostMapping("/addmoim")
	public String addMoim(@RequestParam("moimname") String moimname,
			              @RequestParam("Account") String Account,
			              @RequestParam("moimPin") String moimPin) {
			
			moimService.addMoim(moimname, Account, moimPin);
			
			return "/moimlist";
	}
	
}



