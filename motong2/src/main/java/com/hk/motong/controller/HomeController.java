package com.hk.motong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

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