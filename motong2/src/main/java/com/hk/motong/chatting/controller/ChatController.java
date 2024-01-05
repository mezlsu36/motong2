package com.hk.motong.chatting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ChatController {
   
   
   @PostMapping("/chatform")
   public String chatform(HttpServletRequest request,String userId) {
      System.out.println("채팅시작:"+userId);
      request.getSession().setAttribute("userId", userId);
      return "chatroom";
   }
}