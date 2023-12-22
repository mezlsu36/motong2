package com.hk.motong.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.motong.apidto.AccountBalanceDto;
import com.hk.motong.apidto.UserMeAccountDto;
import com.hk.motong.apidto.UserMeDto;
import com.hk.motong.dtos.AccountTableDto;
import com.hk.motong.dtos.UserDto;
import com.hk.motong.feignMapper.OpenBankingFeign;
import com.hk.motong.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/banking")
public class BankingController {
	
	@Autowired
	private OpenBankingFeign openBankingFeign;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/main")
	public String main() {
		return "main";
	}
	
	//계좌등록
	@ResponseBody
	@GetMapping("/addaccount")
	public String addAccount(String code,HttpServletRequest request) throws IOException, ParseException {
		System.out.println("계좌등록하기");
		
		HttpSession session=request.getSession();
		UserDto dto = (UserDto)session.getAttribute("ldto");
		String useraccesstoken = dto.getUseraccesstoken();
		//DB에 계좌 정보 등록하는 과정
		//계좌 정보 가져오기
		UserMeDto userMeDto = getAccount(request, useraccesstoken);
		List<UserMeAccountDto> list = userMeDto.getRes_list();
		
		String fintech_use_num = list.get(0).getFintech_use_num();
	
		System.out.println(list.get(0));
		
		//계좌 잔액 정보 들은 dto 가져오기
		AccountBalanceDto accountBalanceDto = getAccountBalanceDto(request,useraccesstoken,fintech_use_num);
		System.out.println(accountBalanceDto);
		
		AccountTableDto aDto = new AccountTableDto();
		aDto.setAccount_seq(list.get(0).getAccount_seq());
		aDto.setUser_seq(dto.getUser_seq());
		aDto.setFintech_use_num(fintech_use_num);
		aDto.setBalance_amt(Integer.parseInt(accountBalanceDto.getBalance_amt()));
		aDto.setBank_name(list.get(0).getBank_name());
		System.out.println(aDto);
		
		userService.registAccount(aDto);
		
		//팝업창을 닫아 주기 위해서
		String str="<script type='text/javascript'>"
				  +"     self.close();"
				  +"     alert('계좌등록완료');"
				  +"</script>";
		return str;
	}

	//계좌 목록 부르기
	//잔액 조회
	//거래내역조회
	
	//계좌 정보 가져오기
			public UserMeDto getAccount(HttpServletRequest request,String useraccesstoken) throws IOException, ParseException {
					
				System.out.println("DB에 계좌 등록하기 위한 계좌들 목록");
				//사용자 일련 번호를 가져오기 위해 session객체 구함
				HttpSession session=request.getSession();
				UserDto ldto=(UserDto)session.getAttribute("ldto");
				int userSeqNo=ldto.getUserseqno();//사용자 일련번호
				
				//json값들을 userMeDto에 저장
				UserMeDto userMeDto=openBankingFeign.requestUserMe("Bearer "+useraccesstoken, userSeqNo+"");
					
				return userMeDto;
				
			}
			
			//잔액 정보 들어있는 dto 가져오기
			public AccountBalanceDto getAccountBalanceDto(HttpServletRequest request,String access_token,String fintech_use_num) throws IOException, ParseException {
							
				System.out.println("잔액정보 들어있는 Dto가져오기");
				String useraccesstoken=access_token;//접근할 토큰
				String bank_tran_id = "M202201886U" + createNum();
				String tran_dtime = getDateTime();
				
				//json값들을 userMeDto에 저장
				AccountBalanceDto accountBalanceDto=openBankingFeign.requestAccountBalance("Bearer "+useraccesstoken, bank_tran_id,fintech_use_num,tran_dtime);

				return accountBalanceDto;
						
			}
			
			//이용기관부여번호 9자리를 생성하는 메서드
			public String createNum() {
				String createNum="";
				for (int i = 0; i < 9; i++) {
					createNum+=((int)(Math.random()*10))+"";
				}
				System.out.println("이용기관부여번호9자리생성:"+createNum);
				return createNum;
			}
			
			//현재시간 구하는 메서드
			public String getDateTime() {
				LocalDateTime now = LocalDateTime.now(); //현재시간구하기
				String formatNow = now.format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
				return formatNow;
			}
}
