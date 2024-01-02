<%@page import="java.util.List"%>
<%@page import="com.hk.motong.dtos.MoimDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
   <style>
   .right-btn {
     float: right;
   }
   h2 { text-align: center; margin-top: 10px;}
   
 	a{text-decoration: none;}
	
	.pagination{
		display: flex;
		padding-left: 550px;
		font-family: sans-serif;
		font-weight: bold;		
	}
	ul.pagination {
	    list-style: none;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    padding: 0;
	}
	
	ul.pagination li {
	    margin: 0 5px;
	    display: inline;
	}
	
	ul.pagination li a {
	    text-decoration: none;
	    padding: 2px 2px;
	    color: #000000; 
	}
	
	ul.pagination li.active a {
	    color: #D1B2FF;
	}
	
	ul.pagination li a span {
	    width: 15px;
	    height: 15px;
	    vertical-align: middle;
	}

   </style>

<script type="text/javascript">
	$(function(){
		$(".listContents").click(function(){
			$(this).find("input").focus();
		});
	});
	
	function enter(pin,email,btnEle){
		console.log(email);
		if(email == null || email==""){
			alert("회원이 아닙니다. 로그인하세요");
		}else{
			var pinNum = btnEle.parentNode.previousElementSibling.childNodes[0].value;
			if(pinNum == pin){
				alert("입장~");
	//			window.location.href = "";
				
			}else{
				alert("PIN번호가 일치하지 않습니다.");
				pinNum.focus
			}				
		}
	}
	
	function addMoimForm(email){
		if(email == null || email==""){
			alert("회원이 아닙니다. 로그인하세요");
		}else{
			location.href="/moim/newmoim";
		}
	}
	
 </script>
</head>

<body>
	 <nav class="navbar navbar-expand-lg navbar-light" style="background-color:#e3f2fd;">
	     <div class="container">
	     	<a href="/main"><img src="/resources/img/motong_logo.png" style="width:100px; height:50px;" /></a>
	         <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
	         
	         <c:choose>
				<c:when test="${sessionScope.ldto.email != null}">
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
	                	<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
		                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="/main">Home</a></li>
		                    <li class="nav-item"><a class="nav-link" aria-current="page" href="#!">${sessionScope.ldto.name}님</a></li>
		                    <li class="nav-item"><a class="nav-link" href="/user/logout">로그아웃</a></li>
		                    <li class="nav-item"><a class="nav-link" href="/user/myPage?email=${sessionScope.ldto.email}"  >마이 페이지</a></li>
		                    <li class="nav-item"><a class="nav-link" href="/moim/moimlist?pnum=1">모임리스트</a></li>
                    		<li class="nav-item"><a class="nav-link" href="/bank/my_moim">나의 모임</a></li>
	                    </ul>
	         	   </div>
				</c:when>
				<c:otherwise>
		            <div class="collapse navbar-collapse" id="navbarSupportedContent">
		            	<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
		                	<li class="nav-item"><a class="nav-link active" aria-current="page" href="/">Home</a></li>
		                	<li class="nav-item"><a class="nav-link" href="/moim/moimlist?pnum=1">모임리스트</a></li>
		                	<li class="nav-item"><a class="nav-link" href="/user/signin_form">로그인</a></li>
		                	<li class="nav-item"><a class="nav-link" href="/user/signup">회원가입</a></li>
		               	</ul>
	                </div>
				</c:otherwise>
			</c:choose>
	     </div>
	 </nav>
	<div class="container my-5">
    <div class="row justify-content-center">
    <div class="col-lg-6" style="width:1200px; overflow:auto;">
    	<br/><br/><br/>

		<h1>모임 목록 </h1>
		<hr/>
	 	<table class="table" style="text-align: center;">	 	
            <col width="150px;" />
            <col width="150px;" />
            <col width="600px;" />
            <col width="120px;" />
            <col width="200px;" />
	 		<tr>
	 			<th>모임번호</th>
	 			<th>모임장</th>
	 			<th >모임이름</th>	 			
	 			<th>PIN번호</th>
	 			<th></th>
	 		</tr>
	 		<c:set var="lists" value="${list}" />
			<c:choose>
				<c:when test="${empty lists}">
					<tr>
						<td colspan="5">--모임이 없습니다.--</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${lists}" var="dto">
					    <tr class="listContents">					        
					        <td>${dto.moim_seq}</td>
					        <td>${dto.name}</td>
					        <td>${dto.mname}</td>   
					        <td><input type="password" name="pin" class="pinNum form-control"/></td>
					        <td><button onclick="enter('${dto.pin}','${sessionScope.ldto.email}',this)" >입장</button></td>
					    </tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			</table>
				<!-- 페이징 처리부분 시작 -->
				<nav style="text-align: center;">
				  <ul class="pagination">
				    <li ><a href="/moim/moimlist?pnum=${pMap.prePageNum}" aria-label="Previous"><span aria-hidden="true">◀</span></a></li>
				    <c:forEach var="i" begin="${pMap.startPage}" end="${pMap.endPage}">
				    	<li ${sessionScope.pnum==i?"class='active'":""}><a href="/moim/moimlist?pnum=${i}">${i}<span class="sr-only"></span></a></li>
				    </c:forEach> 
				    <li ><a href="/moim/moimlist?pnum=${pMap.nextPageNum}" aria-label="Next"><span aria-hidden="true">▶</span></a></li>
				  </ul>
				</nav>
				<!-- 페이징 처리부분 종료 -->

		<div class="container">
         <div class="row">
         <form method="post" name="search" action="/moim/research">
            <table class="pull-right">
            <col width="300px;" />
            <col width="100px;" />
            <col width="600px;" />
               <tr>
                  <td><input type="text" class="form-control"
                     placeholder="검색어 입력" name="searchData" maxlength="100"></td>
                  <td><input type="submit" name="researchBtn" class="btn btn-secondary" value="검색"></td>
                  <td style="text-align: right;">
		               <button style="margin-left:400px;" class="btn btn-secondary" type="button" onclick="addMoimForm('${sessionScope.ldto.email}')">모임개설</button>                  
                  </td>  
               </tr>
            </table>

         </form>         
		      </div>
		   </div>
    </div>
  </div>
  </div>
  <br/><br/><br/><br/><br/><br/><br/>
<footer class="py-3" style="background-color:#e3f2fd;">
    <div class="container"><p class="m-0 text-center text-black" style="height: 40px;">Copyright &copy; motong 2023</p></div>
</footer>
<!-- Bootstrap core JS-->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>