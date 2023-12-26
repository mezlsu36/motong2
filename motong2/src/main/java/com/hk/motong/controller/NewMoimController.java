package com.hk.motong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class NewMoimController {
   
   //모임개설 창 이동
   @GetMapping("/newmoim")
   public String moimList(Model model) {   
      System.out.println("newmoim요청");
      
      
      return "newmoim";
   }
}
