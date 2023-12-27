package com.hk.motong.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.motong.dtos.AccountDto;
import com.hk.motong.dtos.MoimDto;
import com.hk.motong.dtos.UserDto;
import com.hk.motong.service.BankService;
import com.hk.motong.service.MoimService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/bank")
public class BankController {

   @Autowired
   private MoimService moimService;
   @Autowired
   private BankService bankService;
   
   @GetMapping("/bank_main")
   public String bank_main(Model model, HttpServletRequest request) {
      System.out.println("회비관리 페이지 이동");
      
      HttpSession session=request.getSession();

      UserDto ldto = (UserDto)session.getAttribute("ldto");
      int user_seq= ldto.getUser_seq();
 
      List<MoimDto> list=moimService.subsMoim(user_seq);
      model.addAttribute("list",list);
      
      List<String> leaderList=moimService.moimLeader(user_seq);
      model.addAttribute("leaderList",leaderList);
      
      
      return "bank/bank_main";
   }
   
   @GetMapping("/bank_moim")
   public String bank_moim(int account_seq, Model model) {
	   System.out.println(account_seq);
	   System.out.println("모임계좌 페이지로 이동");
	   AccountDto dto=bankService.getmoimAccount(account_seq);
	   System.out.println(dto);
	   model.addAttribute("dto",dto);
	   
	   // 모임 이름 뿌리기
	   String mname=moimService.moimName(account_seq);
	   System.out.println(mname);
	   model.addAttribute("mname",mname);

	   return "bank/bank_moim";
   }
   
}