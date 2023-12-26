package com.hk.motong.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.motong.apidto.AccountBalanceDto;
import com.hk.motong.apidto.AccountTransactionDto;
import com.hk.motong.apidto.AccountTransactionListDto;
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
		String account_num_masked = list.get(0).getAccount_num_masked();
		System.out.println(list.get(0));
		
		//계좌 잔액 정보 들은 dto 가져오기
		AccountBalanceDto accountBalanceDto = getAccountBalanceDto(request,useraccesstoken,fintech_use_num);
		System.out.println(accountBalanceDto);
		
		AccountTableDto aDto = new AccountTableDto();
		aDto.setUser_seq(dto.getUser_seq());
		aDto.setFintech_use_num(fintech_use_num);
		aDto.setAccount_num_masked(account_num_masked);
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

	//거래내역조회
	//거래내역 조회
	@GetMapping("/transactionList")
	@ResponseBody
	public JSONObject transactionList(String fintech_use_num
            ,HttpServletRequest request) throws IOException, ParseException {
		System.out.println("거래내역 조회하기");
		HttpURLConnection conn=null;
		JSONObject result=null;
		
		HttpSession session=request.getSession();
		UserDto ldto=(UserDto)session.getAttribute("ldto");
		
		URL url=new URL("https://testapi.openbanking.or.kr/v2.0/account/transaction_list/fin_num?"
		+ "bank_tran_id=M202201886U"+createNum()
		+ "&fintech_use_num="+fintech_use_num
		+ "&inquiry_type=A"
		+ "&inquiry_base=D"
		+ "&from_date=20190101"
		+ "&to_date=20190131"
		+ "&sort_order=D"
		+ "&tran_dtime="+getDateTime());
		
		conn = (HttpURLConnection)url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-Type", "application/json");
		conn.setRequestProperty("Authorization", "Bearer "+ldto.getUseraccesstoken());
		conn.setDoOutput(true);
		
		// java에서 사용할 수 있도록 읽어들이는 코드
		BufferedReader br=new BufferedReader(
		new InputStreamReader(conn.getInputStream(),"utf-8")
		);
		StringBuilder response=new StringBuilder();
		String responseLine=null;
		
		while((responseLine=br.readLine())!=null) {
		response.append(responseLine.trim());
		}
		
		//읽은 값이 json 형태로 된 문자열 --> json객체로 변환하자
		result=(JSONObject)new JSONParser().parse(response.toString());
		System.out.println("거래내역:"+result.get("res_list"));
		
		return result;
		}
//	public List<AccountTransactionDto> transactionList(String fintech_use_num) throws IOException, ParseException {
//		System.out.println("거래내역 조회하기");
//		String bank_tran_id = "M202201886U" + createNum();
//	    String inquiry_type="A";
//	    String inquiry_base="D";
//	    String from_date="20190101";
//	    String to_date="20190131";
//	    String sort_order="D";
//	    String tran_dtime = getDateTime();
//		AccountTransactionListDto accountTransactionListDto = openBankingFeign.requestAccountTransactionList(bank_tran_id,fintech_use_num,inquiry_type,inquiry_base,from_date,to_date,sort_order,tran_dtime);
//		List<AccountTransactionDto> res_list = accountTransactionListDto.getRes_list();
//		return res_list;
//	}
	
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
