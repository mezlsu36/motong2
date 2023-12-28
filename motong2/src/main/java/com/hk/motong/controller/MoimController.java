package com.hk.motong.controller;

import java.util.List;
import java.util.Map;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hk.motong.utils.Paging;
import com.hk.motong.dtos.MoimDto;
import com.hk.motong.service.MoimService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;




@Controller
@RequestMapping("/moim")
public class MoimController {
	
	@Autowired
	private MoimService moimService;
	
	@GetMapping("/moimlist")
	public String moimList(Model model, String pnum,HttpServletRequest request) {		
		System.out.println("moimlist요청");
		
		//---페이지번호 유지를 위한 코드----------------------
		//페이지번호를 전달하지 않으면 세션에 저장된 페이지번호를 사용
		HttpSession session=request.getSession();
		
			if(pnum==null) {
				pnum=(String)session.getAttribute("pnum");//현재 조회중인 페이지번호
			}else {
				//새로 페이지를 요청할 경우 세션에 저장
				session.setAttribute("pnum", pnum);
			}
			//---페이지번호 유지를 위한 코드 종료-------------------
				
		List<MoimDto>list=moimService.getMoimList(pnum);
		model.addAttribute("list", list);
		System.out.println(list);
		
		//페이지 수 구하기 
		int pcount=moimService.getPCount();
		model.addAttribute("pcount", pcount);
		
		//---페이지에 페이징 처리 기능 추가
		//필요한 값: 페이지수, 페이지번호, 페이지범위(페이지수)
		Map<String, Integer>map=Paging.pagingValue(pcount, pnum, 10);
		model.addAttribute("pMap", map);
				
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