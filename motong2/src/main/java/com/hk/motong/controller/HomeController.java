package com.hk.motong.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.hk.motong.dtos.MoimDto;
import com.hk.motong.dtos.UserDto;
import com.hk.motong.service.MoimService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {

	@Autowired
	MoimService moimService;
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	// 로그인 된 상태 main
	@GetMapping("/main")
	public String main() {
		return "main";
	}
	

}
