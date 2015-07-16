<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../reference.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="button" class="button-style" value="목록" onclick="location.href='emMailMain.do'">
	<div style="border-bottom: 2px solid black; height: 15px; margin-bottom: 15px;"></div>
		
		<div class="color mailContTop" style="color: white;">
			<div style="margin-bottom: 5px;"><span style="font-weight: bold;">보낸 사람</span> ${emEmail.emSendAddr }</div>  
			<div><span style="font-weight: bold; ">받는 사람</span> ${emEmail.emGetAddr }</div>
		</div>	
	<div style="border-bottom: 2px solid black; height: 15px; margin-bottom: 20px;"></div>	
	
	<div class="mailCont">
		 <h3>${emEmail.emTitle }</h3>
		 ${emEmail.emContent }
	</div>	
</body>
</html>