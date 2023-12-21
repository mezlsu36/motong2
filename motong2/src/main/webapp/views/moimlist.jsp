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
      <!-- Favicon-->
      <link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
      <!-- Core theme CSS (includes Bootstrap)-->
      <link href="resources/css/styles.css" rel="stylesheet" />
      <script type="text/javascript">
      	
      </script>
</head>

<body>
	 <nav class="navbar navbar-expand-lg navbar-light" style="background-color:#e3f2fd;">
	     <div class="container">
	     	<img src="resources/img/header.png">
	         <a class="navbar-brand" href="#!">MOTONG</a>
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
<h1>모임 목록 </h1>
	 <div id="container">
	 	<table class="table table-striped">
	 		<tr>
	 			<th>모임번호</th>
	 			<th>모임장</th>
	 			<th>계좌SEQ</th>
	 			<th>모임이름</th>	 			
	 		</tr>
	 		<c:set var="lists" value="${list}" />
			<c:choose>
				<c:when test="${empty lists}">
					<tr>
						<td colspan="10">--작성된 글이 없습니다.--</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="{lists}" var="dto">
						<tr>
							<td>
								<input type="checkbox" name="chk" value="${dto.moim_seq}"/>
							</td>
							<td>${dto.moim_seq}</td>
							<td>${dto.leader}</td>
							<td>${dto.account_num}</td>
							<td>${dto.mname}</td>
							<c:choose>
								<c:when test="${dto.delflag=='Y'}">
									--삭제된 모임입니다.--
								</c:when>
							</c:choose>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
	 	</table>
	 </div>

<footer class="py-3 bg-dark">
    <div class="container"><p class="m-0 text-center text-white" style="height: 40px;">Copyright &copy; motong 2023</p></div>
</footer>
</body>
</html>






