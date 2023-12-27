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
<link href="/resources/css/styles.css" rel="stylesheet" />
<title>Insert title here</title>
<style type="text/css">
	
</style>

<script type="text/javascript">
</script>
</head>
<body style="background-color: #e3f2fd">
<h2 style="text-align: center; padding: 20px;">출금하기</h2>
<hr/>
<div style="text-align: center;">
<form action="/banking/withdraw" method="post">
	<table class="table" >
		<tr>	
			<th>출금 메모</th>
			<td><input type="text" name="dps_print_content" class="form-control"/></td>
		</tr>
		<br/>
		<tr>	
			<th>수취 계좌번호</th>
			<td><input type="text" name="recv_client_account_num" class="form-control"/></td>
		</tr>
		<tr>	
			<th>출금액</th>
			<td><input type="text" name="tran_amt" class="form-control"/></td>
		</tr>
		<tr>
		   	<td colspan="2">
			<button type="submit" class="btn btn-outline-primary" >출금</button>
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>