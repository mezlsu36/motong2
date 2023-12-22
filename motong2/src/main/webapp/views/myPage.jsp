<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>

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
		function addAccount(){
			var url="https://testapi.openbanking.or.kr/oauth/2.0/authorize?"
				   +"response_type=code&" //고정값 code: 인증요청시 반환되는 값의 형식의미
				   +"client_id=4987e938-f84b-4e23-b0a2-3b15b00f4ffd&" //이용기관의 ID
				   +"redirect_uri=http://localhost:8070/banking/addaccount&"//응답URL
				   +"scope=login inquiry transfer&" //토큰의 권한
				   +"state=12345678123456781234567812345678&" //32자리 난수 설정
				   +"auth_type=0"; //0:최초 한번 인증, 2:인증생략
				   
			window.open(url,"인증하기","width=400px,height=600px");	
			
// 			alert("계좌 등록 완료");
		}
	</script>

</head>
<body>
<!-- Responsive navbar-->
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color:#e3f2fd;">
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
        <div class="container my-5">
            <div class="row justify-content-center">
                <div class="col-lg-6">
					<h1>나의 정보</h1>
					<div id="myinfo">
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
					<br/><hr/><br/>
					<h1>나의 계좌</h1>
					<div id="myAccount">
						<button type="button" class="btn btn-outline-primary" onclick="${sessionScope.ldto.useraccesstoken == null ? 'authorization()':'already()'}">사용자인증</button>
						<button type="button" class="btn btn-outline-primary" onclick="addAccount()" >계좌 등록하기</button>
					</div>
                </div>
            </div>
        </div>
    </section>
    <!-- Footer-->
        <footer class="py-3"  style="background-color:#e3f2fd;" >
            <div class="container"><p class="m-0 text-center text-gray" style=" height: 40px;">Copyright &copy; motong 2023</p></div>
        </footer>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
<!--     <script src="resources/js/scripts.js"></script> -->
</body>
</html>
