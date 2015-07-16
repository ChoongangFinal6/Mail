<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="./css/email.css">
<script type="text/javascript" src="./js/jquery.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript" src="./js/email.js"></script>
</head>
<body class="mailMain">	
	<div class="color mainTop">
		<h1 class="mailham">메일함</h1>
		<input type="button" id="logout" value="로그아웃" class="button-style logout hover">
	</div>
	
	<div class="mailSide color">
		<jsp:include page="sideMenu.jsp" />
	</div>
	<div class="mailView">
		<jsp:include page="${param.view }" />
	</div>
</body>
</html>