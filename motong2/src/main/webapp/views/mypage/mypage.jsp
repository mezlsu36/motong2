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
		//사용자 인증 요청하기(사용자 인증하면서 계좌등록까지 진행함)
		function authorization(){
			var url="https://testapi.openbanking.or.kr/oauth/2.0/authorize?"
				   +"response_type=code&" //고정값 code: 인증요청시 반환되는 값의 형식의미
				   +"client_id=4987e938-f84b-4e23-b0a2-3b15b00f4ffd&" //이용기관의 ID
				   +"redirect_uri=http://localhost:8087/user/authresult&"//응답URL
				   +"scope=login inquiry transfer&" //토큰의 권한
				   +"state=12345678123456781234567812345678&" //32자리 난수 설정
				   +"auth_type=0"; //0:최초 한번 인증, 2:인증생략
				   
			window.open(url,"인증하기","width=400px,height=600px");	   
		}
	</script>

</head>
<body>
<!-- Responsive navbar-->
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color:#e3f2fd;">
        <div class="container">
        	<img src="resources/img/header.png">
            <a style="font-weight: bold;" class="navbar-brand" href="/main">MOTONG</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="/main">Home</a></li>
                    <li class="nav-item">${sessionScope.ldto.name}님</li>
                    <li class="nav-item"><a class="nav-link" href="/user/logout">로그아웃</a></li>
                    <li class="nav-item"><a class="nav-link" href="/user/mypage" >마이 페이지</a></li>
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
                <div class="col-lg-12">
                	<h2 style="font-weight: bold;">나의 정보</h2>
                	<hr/>
					<div id="myinfo">
						<form action="/user/userUpdate" method="post">
							<input type="hidden" name="email" value="${ldto.email}"/>
							<input type="hidden" name="useraccesstoken" class="form-control"  value="${ldto.useraccesstoken}"/>
							<input type="hidden" name="userrefreshtoken" class="form-control"  value="${ldto.userrefreshtoken}"/>
							<input type="hidden" name="userseqno" class="form-control" value="${ldto.userseqno}"/>
							<table class="table">
								<tr>
									<th>이메일</th>
									<td>${ldto.email}</td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td>
										<input type="text" name="password" value="${ldto.password}" class="form-control"/>
									</td>
								</tr>
								<tr>
									<th>이름</th>
									<td>${ldto.name}</td>
								</tr>
								<tr>
									<th>핸드폰번호</th>
									<td>
										<input type="text" name="phone" value="${ldto.phone}" class="form-control"/>
									</td>
								</tr>
								
								<tr>
									<th>계좌 연동</th>
									<td>
	                    				<input type="button" value="인증하기" onclick="authorization()" class="btn btn-outline-primary" />						
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<button type="submit" class="btn btn-primary">수정</button>
										<button type="button" onclick="d" class="btn btn-primary">회원 탈퇴</button>
									</td>
								</tr>
							</table>
						</form>
					</div>
					<br/>
					
                </div>
            </div>
        </div>
    </section>
    <!-- Footer-->
    <footer class="py-3 bg-dark">
        <div class="container"><p class="m-0 text-center text-white">Copyright &copy; motong 2023</p></div>
    </footer>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
<!--     <script src="resources/js/scripts.js"></script> -->
</body>
</html>

