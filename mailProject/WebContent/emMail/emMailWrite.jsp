<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="frm" action="emMailSend.do" method="post">
	<div style="border-bottom: 2px solid black; height: 30px; margin-bottom: 10px; padding-bottom: 10px;">
		<input type="button" class="button-style" id="send" value="보내기"/>
	</div>
	<table>
		<tr>
			<th class="navbar" id="toAddrleft">받는사람</th>
			<td><div class="mailwrite" id="toAddress" contenteditable="true"></div></td>
			<td><input type="button" value="주소록" id="saveaddr" class="button-style"></td>			
		</tr>
		<tr>
			<td style="height: 5px;">
		</tr>
		<tr>
			<th class="navbar" id="titleleft">제목</th>
			<td><div class="mailwrite" contenteditable="true" id="title"></div></td>			
		</tr>
	</table>
	
	<table style="width: 100%;">
		<tr>
			<td style="width: 80%; height: 30px;">
				<input type="button" value="컬러" id="color" class="button-style writeBtn">	
				<input type="button" value="굵게" id="bold" class="button-style">	
				<input type="button" value="글씨체" id="style" class="button-style">			
				<input type="button" value="글씨 크기" id="size" class="button-style">
				<input type="button" id="upload" value="사진" class="button-style"/>
				<span style="color: red; margin-left: 10px;">사진은 2장까지 가능합니다.</span>
			</td>
			<td style="width: 20%; height: 30px; padding-left: 120px;">
				<div id="trash" class="ui-widget-content ui-state-default">
					<h4 class="ui-widget-header">
						<span class="ui-icon ui-icon-trash">Trash</span> Trash</h4>
				</div>
			</td>
		</tr>
	</table>					
		
	<p id="container" contenteditable="true"></p>		
	
	<div id="sendText"></div>
	<div id="sendAddr"></div>	
	<div id="sendTitle"></div>		
	</form>
</body>
</html>