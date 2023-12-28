package com.hk.motong.chatting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
   
   @GetMapping("/chat")
   public String index() {
      return "chatroom";
   }
}