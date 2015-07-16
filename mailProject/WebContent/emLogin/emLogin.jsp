<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../reference.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Cache-Control" content="no-chache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Pragma" content="no-cache"/>
<title>Insert title here</title>
</head>
<body onload="reset()">
<div style="width: 100%; padding-top: 250px;" align="center">
	<div class="color" style="width: 400px; height: 200px; padding-top: 30px;" >
		<form action="emLoginSucess.do">
			<h3 style="color: white;">로그인</h3>
			<input type="text" name="id" id="id" placeholder="아이디">
			<input type="submit" id="submit" value="로그인" class="button-style hover" style="width: 80px; height: 30px;">
			<input type="password" name="password" id="password" placeholder="비밀번호">		
			<input type="button" value="회원가입" class="button-style hover" style="width: 80px; height: 30px;" onclick="location.href='emJoin.do'">
		</form>
	</div>
</div>
</body>
</html>