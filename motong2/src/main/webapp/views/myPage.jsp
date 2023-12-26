<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Motong</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/resources/css/styles.css" rel="stylesheet" />
	<style type="text/css">
		.box{border-bottom: 1px solid gray; margin-bottom: 10px;}
		.box > .sub_menu{text-align: right;}
	</style>
	<script type="text/javascript">
		
		function isDel(email){
			if(confirm("정말 탈퇴하시겠습니까?")){
				location.href="/user/delUser?email="+email;
			}else{
				return false;
			}
		}
		
		//사용자 인증 되어잇으면 되어있다고 알림
		function already(){
			alert("사용자 인증이 완료된 회원입니다.");
		}
		
		//사용자 인증 요청하기(사용자 인증하면서 계좌등록까지 진행함)
		function authorization(){
			var url="https://testapi.openbanking.or.kr/oauth/2.0/authorize?"
				   +"response_type=code&" //고정값 code: 인증요청시 반환되는 값의 형식의미
				   +"client_id=4987e938-f84b-4e23-b0a2-3b15b00f4ffd&" //이용기관의 ID
				   +"redirect_uri=http://localhost:8070/user/authresult&"//응답URL
				   +"scope=login inquiry transfer&" //토큰의 권한
				   +"state=12345678123456781234567812345678&" //32자리 난수 설정
				   +"auth_type=0"; //0:최초 한번 인증, 2:인증생략
				   
			window.open(url,"인증하기","width=400px,height=600px");
			
// 			alert("사용자 인증 완료");
		}
		
		//계좌등록하기(센터인증 이용기관용: 사용자 인증후에 계좌 등록 가능)
		function addAccount(email){
			var url="https://testapi.openbanking.or.kr/oauth/2.0/authorize?"
				   +"response_type=code&" //고정값 code: 인증요청시 반환되는 값의 형식의미
				   +"client_id=4987e938-f84b-4e23-b0a2-3b15b00f4ffd&" //이용기관의 ID
				   +"redirect_uri=http://localhost:8070/banking/addaccount&"//응답URL
				   +"scope=login inquiry transfer&" //토큰의 권한
				   +"state=12345678123456781234567812345678&" //32자리 난수 설정
				   +"auth_type=0"; //0:최초 한번 인증, 2:인증생략
				   
			window.open(url,"인증하기","width=400px,height=600px");	
		}
		
		//잔액확인 버튼 누르면 잔액 확인
		$(function(){
				$(".amt-btn").click(function(){
					$(this).siblings().eq(4).toggle();
					$(this).parent().parent().siblings().each(function(){ 
						
						$(this).find("span").eq(1).hide();
						$(this).find(".tranList").hide();
					});
					
				});
				
				$(".tran-btn").click(function(){
					$(this).siblings().eq(6).toggle();
					$(this).parent().parent().siblings().each(function(){ 
						$(this).find("span").eq(1).hide();
						$(this).find(".tranList").hide();
					});
				});
			});
		
		//거래내역조회
		function transactionList(fintech_use_num,btnEle){
			$.ajax({
				url:"/banking/transactionList",
				method:"get",
				data:{"fintech_use_num":fintech_use_num},
				dataType:"json",
				success:function(data){ //data: 응답결과을 받을 변수
					var list="<ul>";
					// data.res_list  -->  배열
					for (var i = 0; i < data.res_list.length; i++) {
						var res=data.res_list[i];// json객체를 가져온다 {key:value,...}
						list+="<li>"+res.tran_date
						            +" ["+res.branch_name+"] "
						            +res.inout_type+" "
						            +res.print_content+":"
						            +res.tran_amt+"</li>"
					}
					list+="</ul>";// <ul><li>거래내역1</li><li>거래내역2</li>..</ul>
					//button .   p    . <div> 
					$(btnEle).next().next().next().next().html(list);	
				}
			});
		}
	</script>

</head>
<body>
<!-- Responsive navbar-->
    <nav class="navbar navbar-expand-lg navbar-light" style="width:100%; position:fixed; z-index:100; top:0px;  background-color:#e3f2fd;">
        <div class="container">
            <a href="/main"><img src="/resources/img/motong_logo.png" style="width:100px; height:50px;" /></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="/main">Home</a></li>
                    <li class="nav-item"><a class="nav-link" aria-current="page" href="#!">${sessionScope.ldto.name}님</a></li>
                    <li class="nav-item"><a class="nav-link" href="/user/logout">로그아웃</a></li>
                    <li class="nav-item"><a class="nav-link" href="/user/myPage?email=${sessionScope.ldto.email}"  >마이 페이지</a></li>
                    <li class="nav-item"><a class="nav-link" href="">모임 목록</a></li>
                    <li class="nav-item"><a class="nav-link" href="/bank/bank_main">회비 관리</a></li>
                    <li class="nav-item"><a class="nav-link" href="">모임 커뮤니티</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Content section-->
    <section class="py-5">
    <br/><br/>
        <div class="container my-5">
       		 <div class="row justify-content-center">
                <div class="col-lg-6" style="width:1200px; overflow:auto;">
                	<div id="myinfo" style="width:500px; float:left;">
					<h1>나의 정보</h1>
					<hr/>	
						<table class="table">
							<tr>
								<th>이름</th>
								<td>${dto.name}</td>
							</tr>
							<tr>
								<th>아이디</th>
								<td>${dto.email}</td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td>${dto.password}</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>${dto.phone}</td>
							</tr>
							<tr>
								<td colspan="2">
									<button type="button" class="btn btn-outline-primary" onclick="isDel('${sessionScope.ldto.email}')" >회원탈퇴</button>
									<button type="button" class="btn btn-outline-primary" onclick="location.href='/user/updateMyInfoForm?email=${sessionScope.ldto.email}'">정보수정</button>
								</td>
							</tr>
						</table>
					</div>
					<div id="myAccount" style="width:500px;  float:right;">
					<h1>나의 계좌</h1>
					<hr/>
						<button type="button" class="btn btn-outline-primary" onclick="${sessionScope.ldto.useraccesstoken == null ? 'authorization()':'already()'}">사용자인증</button>
						<button type="button" class="btn btn-outline-primary" onclick="addAccount('${sessionScope.ldto.email}')" >계좌 등록하기</button>
						<table class="table">
							<c:choose> 
								<c:when test="${empty aList}"><!-- 안에가 비어있냐 -->
									<tr>
										<td></td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${aList}" var="aTdto">
										<tr>
											<td>
												<p style="font-size:20pt">${aTdto.bank_name}</p>
												<span>계좌번호 : ${aTdto.account_num_masked}</span>
												<button class="btn btn-outline-primary amt-btn" style="margin-left:50px">잔액조회</button>
												<button class="btn btn-outline-primary tran-btn" onclick="transactionList('${aTdto.fintech_use_num}',this)">거래내역조회</button>
												<br/><span class="amt" style="display:none;">${aTdto.balance_amt}원</span>
												<br/><div class="tranList" ></div>
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>
					</div>
                </div>
              </div>
        </div>
    </section>
  <br/><br/><br/><br/><br/><br/>
    <!-- Footer-->
        <footer class="py-3"  style="width:100%; background-color:#e3f2fd;" >
            <div class="container"><p class="m-0 text-center text-gray" style=" height: 40px;">Copyright &copy; motong 2023</p></div>
        </footer>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
<!--     <script src="resources/js/scripts.js"></script> -->
</body>
</html>
