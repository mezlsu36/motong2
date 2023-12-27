<%@page import="java.util.List"%>
<%@page import="com.hk.motong.dtos.ListDto"%>
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
  
   </style>

<script type="text/javascript">
	$(function(){
		$(".listContents").click(function(){
			$(this).find("input").focus();
		});
	});
	
	function enter(pin,btnEle){
		var pinNum = btnEle.parentNode.previousElementSibling.childNodes[0].value;
		if(pinNum == pin){
			alert("입장~");
		}else{
			alert("PIN번호가 일치하지 않습니다.");
			pinNum.focus
		}
	}
	
 </script>
</head>

<body>
	 <nav class="navbar navbar-expand-lg navbar-light" style="background-color:#e3f2fd;">
	     <div class="container">
	     	<a href="/main"><img src="/resources/img/motong_logo.png" style="width:100px; height:50px;" /></a>
	         <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
	         <div class="collapse navbar-collapse" id="navbarSupportedContent">
	             <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
	                 <li class="nav-item"><a class="nav-link active" aria-current="page" href="/">Home</a></li>
	                 <li class="nav-item"><a class="nav-link" href="">SignIN</a></li>
	                 <li class="nav-item"><a class="nav-link" href="">SignUp</a></li>
	                 <li class="nav-item"><a class="nav-link" href="">모임리스트</a></li>
	             </ul>
	         </div>
	     </div>
	 </nav>
	<div class="container my-5">
    <div class="row justify-content-center">
    <div class="col-lg-6" style="width:1200px; overflow:auto;">
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
						<td colspan="6">--모임이 없습니다.--</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${lists}" var="dto">
					    <tr class="listContents">					        
					        <td>${dto.moim_seq}</td>
					        <td>${dto.name}</td>
					        <td>${dto.mname}</td>   
					        <td><input type="password" name="pin" class="pinNum form-control"/></td>
					        <td><button onclick="enter('${dto.pin}',this)" >입장</button></td>
					    </tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			</table>
		<div class="container">
         <div class="row">
         <form method="post" name="search" action="">
            <table class="pull-right">
            <col width="120px;" />
            <col width="300px;" />
            <col width="100px;" />
            <col width="600px;" />
               <tr>
                  <td><select class="form-control" name="search_node">
                        <option value="1">선택</option>
                        <option value="2">모임이름</option>
                        <option value="3">모임장</option>
                  </select></td>
                  <td><input type="text" class="form-control"
                     placeholder="검색어 입력" name="searchText" maxlength="100"  value="${map.keyword}"></td>
                  <td><input type="submit" class="btn btn-secondary" value="검색"></td>
                  <td style="text-align: right;">
		               <button style="margin-left:400px;" class="btn btn-secondary" type="button" onclick="location.href='/moim/newmoim'">모임개설</button>                  
                  </td>  
               </tr>
            </table>

         </form>         
		      </div>
		   </div>
    </div>
  </div>
  </div>
<footer class="py-3" style="background-color:#e3f2fd;">
    <div class="container"><p class="m-0 text-center text-black" style="height: 40px;">Copyright &copy; motong 2023</p></div>
</footer>
</body>
</html>
















