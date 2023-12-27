<%@page import="com.hk.motong.dtos.MoimDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
				$(btnEle).next().next().next().next().next().html(list);	
			}
		});
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
            <a style="font-weight: bold;" class="navbar-brand" href="/main">MOTONG</a>
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="/main">Home</a></li>
                    <li class="nav-item">${sessionScope.ldto.name}님</li>
                    <li class="nav-item"><a class="nav-link" href="/user/logout">로그아웃</a></li>
                    <li class="nav-item"><a class="nav-link" href="/user/myPage?email=${sessionScope.ldto.email}" >마이 페이지</a></li>
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
                <h2 style="font-weight: bold;">거래 내역</h2>
                <hr/>
                <div id="getMoimAccount">
                	<table class="table">
                		<tr>
                			<th>모임 이름</th>
                			<td>${mname}</td>
                		</tr>
                		<tr>
                			<th>bank_name</th>
                			<td>${dto.bank_name}</td>
                		</tr>
                		<tr>
                			<td colspan="2">
                			<button type="button" class="btn btn-outline-primary" onclick="transactionList('${dto.fintech_use_num}',this)">거래 내역 조회</button>
                			<button type="button" class="btn btn-outline-primary" onclick="">입금</button>
                			<button type="button" class="btn btn-outline-primary" onclick="window.open('/banking/withdraw_popup', 'withdrawpopup','width=450, height=400, top=150, left=200')">출금</button>
                			<br/><br/><div class="tranList"></div>
                		</tr>
                	</table>
                </div>
            </div>
            </div>
        </div>
    </section>
    <!-- Footer-->
    <footer style="bottom: 0px; position: fixed; width: 100%" class="py-3 bg-dark">
        <div class="container"><p class="m-0 text-center text-white">Copyright &copy; motong 2023</p></div>
    </footer>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
<!--     <script src="resources/js/scripts.js"></script> -->
</body>
</html>
