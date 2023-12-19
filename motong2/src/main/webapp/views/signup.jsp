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
    <title>회원가입</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/resources/css/styles.css" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script type="text/javascript">
		
	onload=function(){
		// 아이디 중복체크 후, 다른 정보를 입력할 수 있게 처리
		var inputs=document.querySelectorAll("input[name]");
		var idChk=document.getElementById("idChk");
		for(var i=1; i<inputs.length; i++){
			inputs[i].onfocus=function(){
				if(idChk.textContent=="n"){	// 중복체크 여부 확인
					alert("아이디 중복체크를 먼저 확인하세요");
					inputs[0].focus();	// 아이디 입력박스 이동
				}
			}
		}
	}
	// 아이디 중복 체크
	function idChk(){
		var email=document.getElementsByName("email")[0].value;
		if(email==""){
			alert("이메일을 입력하세요.");
		}else{
			/* window.open("userController.jsp?command=idChk"
					+"&id="+id,"아이디 확인","width=300px, height=300px"); */
			$.ajax({
				url:"/user/idChk",	// 요청 url
				method:"post",		// 전송방식
				data:{"email":email},		// 전송할 데이터
				dataType:"text",	// 전달받을 데이터 타입 (xml,json,html,text ...)
				async: false,		// $.ajax()메서드를 실행하는 방식
				success: function(data){// 데이터 받기 성공하면 함수 실행
					
					if(data=="null"){
						$("#enabledEmail").css("color","blue").text(" 사용가능한 이메일입니다.");
						$("#idChk").text("y");
					}else{
						$("#enabledEmail").css("color","blue").text(" 사용가능한 이메일입니다.");
						$("#idChk").text("y");
					}
				}, error:function(){ // 데이터받기 실패하면 함수 실행
					alert("통신 실패");
				}	
			}); 

		}
	}
	</script>

</head>
<body>
<!-- Responsive navbar-->
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color:#e3f2fd;">
        <div class="container">
            <img src="resources/img/header.png">
            <a style="font-weight: bold;" class="navbar-brand" href="/">MOTONG</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="/">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="/user/signin_form">SignIN</a></li>
                        <li class="nav-item"><a class="nav-link" href="/user/signup">SignUp</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Content section-->
    <section class="py-5">
        <div class="container my-5">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                	<h2 style="font-weight: bold;">회원가입</h2>
                	<hr/>
                    <form action="/user/addUser" method="post">
                    	<table class="table">
                    		<tr>
                    			<th>이메일</th>
                    			<td><input type="text" name="email" class="form-control" />
                    				<a href="#" onclick="idChk()">중복체크</a>
                    				<span id="idChk" style="display:none;">n</span>
                    				<span id="enabledEmail"></span>
                    			</td>
                    		</tr>
                    		<tr>
                    			<th>비밀번호</th>
                    			<td><input type="password" name="password" class="form-control" /></td>
                    		</tr>
                    		<tr>
                    			<th>이름</th>
                    			<td><input type="text" name="name" class="form-control" /></td>
                    		</tr>
                    		<tr>
                    			<th>핸드폰번호</th>
                    			<td><input type="text" name="phone" class="form-control" /></td>
                    		</tr>
                    		<tr>
                    			<td colspan="2">
                    				<input style="font-weight: bold;" type="submit" value="가입하기" class="btn btn-primary">
                    			</td>
                    		</tr>
                    	</table>
                    </form>
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
    <script src="resources/js/scripts.js"></script>
</body>
</html>











