package com.hk.motong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TalkController {
   @GetMapping("/talk")
   public String moimList(Model model) {   
      System.out.println("talk요청");
      
      
      return "talk";
   }
}