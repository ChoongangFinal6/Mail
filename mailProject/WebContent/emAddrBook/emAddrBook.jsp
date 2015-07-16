<!-- index.html로 실행시켜야 한다. 주소록 기능 테스트 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../reference.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="color addrTitle">
		<h1 style="margin-top: -10px; color: white;">주소록</h1>	
	</div>

	<div class="addrInput">
		<input type="email" id="mailAddr" required="required" class="background" placeholder="메일 주소 입력">
		<input type="button"  id="mailAddAddrBook" value="추가" class="button-style">
		<input type="button"  id="mailDelAddrBook" value="삭제" class="button-style">
	</div>
	
		<form action="emAddrBookResult.do">	
		<div>
			<div class="addrBookList1">
				<!-- 아이디를 구별할 수 있게 변수를 선언 -->
				<c:set var="cnt" value="0"/>
				<!-- 이메일 값들을 가지고와서 보여준다 -->
				<c:forEach var="addrBookList" items="${getMailAddrList }">
					<!-- 아이디들을 각각 구별할 수 있게 넣는다. --> 
					<div class="addrList">
						<span id="sendList${cnt}" class="sendList">
							<!-- 디자인을 위해 checkbox는 보이지 않게함 -->
							<input type="checkbox" value="${addrBookList.emAddrBook }" id="sendChk${cnt}" class="checkbox">${addrBookList.emAddrBook }
						</span>
					</div>
					<!-- forEach문이 돌 때마다 아이디 구별 변수의 값을 증가 -->
					<c:set var="cnt" value="${cnt+1}" />
				</c:forEach>
			</div>
			<div class="btnDiv">
				<input type="button" value=">" id="moveRight" class="button-style">				
				<input type="button" value="<" id="moveLeft" class="button-style">
			</div>
			
			<div class="addrBookList2">
				<!-- 위의 아이디 구별 변수와 같음 -->
				<c:set var="cnt" value="0"/>
				<c:forEach var="addrBookList" items="${getMailAddrList }">
					<div class="addrList">
						<span id="getList${cnt}"  style="display: none;">
							<input type="checkbox" value="${addrBookList.emAddrBook }" id="getChk${cnt}" class="checkbox">${addrBookList.emAddrBook }
						</span>
					</div>
					<c:set var="cnt" value="${cnt+1}" />
				</c:forEach>
			</div>
		</div>
		
		<!-- 다음페이지로 넘어갈 데이터를 가지고 있는 div -->
		<div>
			<div id="mailWaitData"></div>
			<div id="mailWaitDel"></div>
			<input type="submit" value="전송" class="button-style sendBtn">
			<input type="button" value="취소" class="button-style cancelBtn">
		</div>
		</form>
</body>
</html>