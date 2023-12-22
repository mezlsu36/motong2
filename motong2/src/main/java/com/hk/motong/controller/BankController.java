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

import com.hk.motong.dtos.MoimDto;
import com.hk.motong.service.MoimService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/bank")
public class BankController {

   @Autowired
   private MoimService moimService;
   
   @GetMapping("/bank_main")
   public String bank_main(Model model, HttpServletRequest request) {
      System.out.println("회비관리 페이지 이동");
      
      HttpSession session=request.getSession();
      int user_seq=(int) session.getAttribute("user_seq");
 
      List<MoimDto> list=moimService.subsMoim(user_seq);
      model.addAttribute("list",list);
      
      List<String> leaderList=moimService.moimLeader(user_seq);
      model.addAttribute("leaderList",leaderList);
      
      return "bank/bank_main";
   }
   
   
}