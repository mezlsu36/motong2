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

	</script>

</head>
<body>
<!-- Responsive navbar-->
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color:#e3f2fd;">
        <div class="container">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="/main">Home</a></li>
                    <li class="nav-item">${sessionScope.ldto.name}님</li>
                    <li class="nav-item"><a class="nav-link" href="">로그아웃</a></li>
                    <li class="nav-item"><a class="nav-link" href="#!" >마이 페이지</a></li>
                    <li class="nav-item"><a class="nav-link" href="">모임 목록</a></li>
                    <li class="nav-item"><a class="nav-link" href="">회비 관리</a></li>
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
                    <div id="list">
<!--                     	<div class="box container"> -->
<!-- 	                       	<div> -->
<!-- 	                     	   <h1>이름</h1> -->
<!-- 	                     	   <p>번호 [은행이름]</p> -->
<!-- 	                      	</div> -->
<!-- 	                      	<div class="sub_menu"> -->
<!-- 	                      		<button  onclick="balance(fintech_user_num,this)" class="balance">잔액조회</button> -->
<!-- 	                      	</div> -->
<!-- 	                      	<div class="balance_amt"></div> -->
<!-- 	                    </div>	 -->
                    </div>
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

