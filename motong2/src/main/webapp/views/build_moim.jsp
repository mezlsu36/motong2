<%@page import="java.util.List"%>
<%@page import="com.hk.motong.dtos.ListDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      <style>
        h2 { text-align: center; margin-top: 10px;}
        
        .my-div {
        text-align : center;
      }

      </style>
     <script type="text/javascript">
   
   </script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color:#e3f2fd;">
        <div class="container">
           <img src="resources/img/logo.png" style="width:100px; height:50px;">
            <a class="navbar-brand" href="#!">MOTONG</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="/">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="/user/signin_form">SignIN</a></li>
                        <li class="nav-item"><a class="nav-link" href="/user/signup">SignUp</a></li>
                        <li class="nav-item"><a class="nav-link" href="/moimlist">모임리스트</a></li>
                        <li class="nav-item"><a class="nav-link" href="/talk">Talk</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <h2>모임 개설하기</h2>
    <div class='my-div'>
    <tr>
    <button  class="btn btn-secondary" type="submit">모임계좌신청</button>
   </tr>
    <form action="/addMoim" method="post">
                       <table class="table">
                          <tr>
                             <input type="text" name="moim"  placeholder="모임계좌를 입력하세요" aria-describedby="button-search" class="newmoim-control" >
                          </tr>
                          <tr>
                             <input type="text" name="moimname"  placeholder="모임이름을 입력하세요" aria-describedby="button-search" class="newmoim-control" >
                          </tr>
                       </table>
                    </form>
     <button  class="btn btn-secondary" type="submit">모임개설!</button>
    </div>
   <footer class="py-3 bg-dark">
       <div class="container"><p class="m-0 text-center text-white" style="height: 40px;">Copyright &copy; motong 2023</p></div>
<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="resources/js/scripts.js"></script>
</body>
</html>