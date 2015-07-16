<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../reference.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div class="color joinTop" style="">
			<h2 style="padding: 10px; margin: 2px 0px 0px 8px; color:white;">회원가입</h2>		
		</div>
		
	<form action="joinSucess.do" class="join">
		<fieldset class="join1 color">
			<div style="font-weight: bold;" class="idLeft" >아이디</div><input type="text" id="id" name="id" required="required" placeholder="아이디" class="idRight"><span style="font-weight: bold;" class="domain">@choongang.com</span>
			<div class="idChkMsg" style="display: none; color: red;">이미 존재하는 아이디입니다.</div>
			
			<div style="font-weight: bold;" class="passLeft">비밀번호</div><input type="password" id="password" name="password" required="required" placeholder="비밀번호" class="passRight">				
			<div style="font-weight: bold;" class="passLeft2">비밀번호 확인</div><input type="password" id="passChk" name="passChk" required="required" placeholder="비밀번호 재확인" class="passRight2">
			
			<div id="passChkMsg"  style="display: none; color: red;">비밀번호가 일치하지 않습니다.</div>
		</fieldset>
		
		<fieldset class="join2 color">
			<div class="nameLeft">이름</div><input type="text" class="nameRight" id="name" name="name" required="required" placeholder="이름" >		
			<div class="birthLeft">생일</div>	<input type="date" class="birthRight" id="birthdate" name="birthdate" required="required" placeholder="생년">
			<div class="genderLeft">성별</div>
			<div class="genderRight">
				<input type="radio" id="gender" name="gender" required="required" value="1" checked="checked">남 
				<input type="radio" id="gender" name="gender" required="required" value="2">여
			</div>			
		</fieldset>
		
		<fieldset class="join3 color">
			<div class="phone1">
				<input type="text" class="input-style" id="phone" name="phone" required="required" placeholder="핸드폰 번호">
				<input type="button" class="button-style hover" value="핸드폰 확인" id="phInfoChk">
			</div>
			<div class="phone2">
				<input type="text" class="input-style" id="phConfirm" required="required" disabled="disabled" placeholder="휴대폰 인증 번호">
				<input type="button" class="button-style hover" value="인증 전송" id="phConfirmBtn" style="display: none;">
				<div id="confiSec"></div>
			</div>
		</fieldset>
			<div>
				<input type="submit"  value="확인" id="joinSubmit" class="joinSend button-style hover">
				<input type="button"  value="취소" class="joinCancel button-style hover">
			</div>
		</form>
</div>
</body>
</html>