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
    <title>Full Width Pics - Start Bootstrap Template</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/resources/css/styles.css" rel="stylesheet" />
	
	<script type="text/javascript">
	
	</script>

</head>
<body>
<!-- Responsive navbar-->

        <nav class="navbar navbar-expand-lg navbar-light" style="width:100%; position:fixed; z-index:100; top:0px;  background-color:#e3f2fd;">
            <div class="container">
            	<a href="/"><img src="/resources/img/motong_logo.png" style="width:100px; height:50px;" /></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="/moim/moimlist?pnum=1">모임리스트</a></li>
                        <li class="nav-item"><a class="nav-link" href="/user/signin_form">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="/user/signup">회원가입</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    <!-- Content section-->
    <section class="py-5">
        <div class="container my-5">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                	<br/><br/><br/><br/><br/>
                	<h2 style="font-weight: bold;">로그인</h2>
                	<hr/>
                    <form action="/user/login" method="post" style="text-align: center;">
                    	<table class="table" >
                    		<tr>
                    			<th>이메일</th>

                    			<td>
                    				<input type="text" style="width:400px" name="email" class="form-control hi" value="${ID==null?'':ID}" required/>
                    				<span style="color:red; font-size:10pt;">${failID==null?"":failID}</span>
                    			</td>
                    		</tr>
                    		<tr>
                    			<th>비밀번호</th>

                    			<td>
                    				<input type="password" style="width:400px"  name="password" class="form-control hi" value="${pw==null?'':pw}" required/>
                    				<span style="color:red; font-size:10pt;">${failPW==null?"":failPW}</span>
                    			</td>
                    		</tr>

                    	</table>
                    		<input type="submit" value="로그인" class="btn btn-outline-primary">
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- Footer-->

 <footer class="py-3"  style="width:100%; position:absolute; bottom:0; background-color:#e3f2fd;" >
            <div class="container"><p class="m-0 text-center text-gray" style=" height: 40px;">Copyright &copy; motong 2023</p></div>
        </footer>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="resources/js/scripts.js"></script>
</body>
</html>















