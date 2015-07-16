<!-- 주소록기능 테스트 결과값 페이지 Model2형태-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function submit() {	 
		window.opener.document.getElementById("toAddress").insertAdjacentHTML('beforeend',"${mailList }");
	    self.close();		
	}
</script>
<body onload="submit()">
	<input type="hidden" value="${mailList }" name="mailSendAdress" style="width: 50%;">
</body>
</html>