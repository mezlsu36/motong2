package com.hk.motong.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.motong.dtos.UserDto;
import com.hk.motong.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	// 회원가입창 이동
	@GetMapping("/signup")
	public String signUp() {
		return "signup";
	}
	
	// 아이디 중복체크
	@ResponseBody
	@PostMapping("/idChk")
	public String idChk(Model model,@RequestParam String email) {
		System.out.println("idChk 요청");
		String resultEmail=userService.idChk(email);
		model.addAttribute("resultEmail",resultEmail);
		
		return resultEmail;
	}
	
	// 회원가입
	@PostMapping("/addUser")
	public String addUser(UserDto dto) {
		boolean isS=userService.addUser(dto);
		
		if(isS) {
			System.out.println("회원가입 성공");
			return "redirect:/";
		}else {
			System.out.println("회원가입 실패");
			return "error";
		}
	}
	
	// 로그인 창 이동
	@GetMapping("/signin_form")
	public String signinForm() {
		System.out.println("로그인 폼 이동");
		return "signin_form";
	}
	
	// 로그인
	@PostMapping("/login")
	public String login(UserDto dto,HttpServletRequest request ) {
		UserDto ldto=userService.loginUser(dto);
		
		if(ldto==null) {
			System.out.println("회원이 아님");
			return "redirect:/user/signin_form";
		}else {
			System.out.println("회원이 맞음");
			HttpSession session=request.getSession();
			session.setAttribute("ldto", ldto);
			session.setMaxInactiveInterval(60*10);
			return "redirect:/main";
		}
	}
	
}
