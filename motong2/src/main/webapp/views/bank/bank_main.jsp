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
            <div class="col-lg-6">
                <h2 style="font-weight: bold;">가입된 모임</h2>
                <hr/>
                <form>
                   <table class="table table-hover">
                      <col width="50px"/>
                      <col width="50px"/>
                      <col width="100px"/>
                      <col width="80px"/>
                      <thead>
                      <tr>
                         <th>모임 번호 </th><th>모임장</th><th>계좌 잔액</th><th>모임이름</th>
                      </tr>
                      </thead>
                      <tbody>
                     <c:set var="list" value="${list}"/>
                     <c:choose>
                     	<c:when test="${empty list}">
						<tr>
							<td colspan="10">--가입된 모임이 없습니다.--</td>
						</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="dto" varStatus="status">
								<tr>
									<td>${dto.moim_seq}</td>
									<td>${leaderList[status.index]}</td>
									<td>${dto.account_seq}</td>
									<td>${dto.mname}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
                     </c:choose>
                     </tbody>
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
<!--     <script src="resources/js/scripts.js"></script> -->
</body>
</html>
