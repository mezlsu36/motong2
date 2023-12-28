<%@page import="java.util.List"%>
<%@page import="com.hk.motong.dtos.MoimDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
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
        h2 { text-align: center; margin-top: 10px;}
        
        .my-div {
        text-align : center;
      }
      

       .newmoim-control, select,button {
        margin-bottom: 10px;
      }    
      .table{
        display: flex;
      	text-align: center;
      	margin-left : 620px; 
      	flex-direction: column;   
        width : 900px; 	
      }

      </style>
	<script type="text/javascript">
    function addMoim(){
    	var select= document.getElementsByName("account_seq")[0].value;
    	if(select == "no"){
    		alert('계좌번호를 선택하세요.');
	    	return false;    		
    	}else if(select == "noAccount") {
    		alert('계좌를 등록하세요.');
	    	return false;    		
    	}else{
    		return true;	
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
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="/main">Home</a></li>
                    <li class="nav-item"><a class="nav-link" aria-current="page" href="#!">${sessionScope.ldto.name}님</a></li>
                    <li class="nav-item"><a class="nav-link" href="/user/logout">로그아웃</a></li>
                    <li class="nav-item"><a class="nav-link" href="/user/mypage" >마이 페이지</a></li>
                    <li class="nav-item"><a class="nav-link" href="/moim/moimlist">모임리스트</a></li>
                    <li class="nav-item"><a class="nav-link" href="/bank/bank_main">회비 관리</a></li>
                    <li class="nav-item"><a class="nav-link" href="">모임 커뮤니티</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <br/><br/><br/>
    <h2>모임 개설하기</h2>
    <br/><br/><br/><br/>
    <div class='my-div'>	  	   	 
	    <form action="/moim/addMoim" method="post" onsubmit="return addMoim()">	  
	      <input type="hidden" name="leader" value="${sessionScope.ldto.user_seq}">
	      <table class="table">
	   			<tr>
	   				<th>이름</th>
	   				<td> <input type="text" name="moimname"  placeholder="모임이름을 입력하세요" aria-describedby="button-search" class="newmoim-control" ></td>
	   			</tr>
	   			<tr>
	   				<th>계좌</th>
	   				<td>
	   					<select name="account_seq" class="acseq">
						      <option value="no" selected="selected">---------------</option> 
						      <c:set var="lists" value="${acList}" />
							      <c:choose>
							          <c:when test="${empty lists}">
							              <option value="noAccount">등록된 계좌번호가 없음</option>
							          </c:when>
							          <c:otherwise>
							              <c:forEach items="${lists}" var="dto">
							                  <option value="${dto.account_seq}">${dto.bank_name}[${dto.account_num_masked}]</option> 
							              </c:forEach>
							          </c:otherwise>
							      </c:choose>
						  </select>
	   				  </td>
	   			</tr>
	   			<tr>
	   				<th>PIN번호</th>
	   				<td><input type="text" name="moimPin"  placeholder="6자리" minlength="6" maxlength="6" class="newmoim-control" ></td>
				
	   			</tr>
	   		</table>
	   		<button  class="btn btn-secondary" type="submit">모임개설!</button>
	   		<br/><br/><br/><br/><br/>
	     </form>	     
    </div>
    
   <footer class="py-3" style="background-color:#e3f2fd;">
       <div class="container"><p class="m-0 text-center text-black" style="height: 40px;">Copyright &copy; motong 2023</p></div>
    </footer>
		<!-- Bootstrap core JS-->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>