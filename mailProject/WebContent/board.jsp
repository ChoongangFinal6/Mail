<!-- 단순디자인 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/Sunghun.css" rel="stylesheet">
<script src="//code.jquery.com/jquery.js"></script>

</head>
<body>

<form>
	<table style="font-size: 10pt;" id="maillist" cellpadding="4">
		<tr>
			<td id="title">받는 사람</td>
			<td>
				<input type="checkbox" style="margin-top: 10px">
					<label style="font-weight: lighter;">내게쓰기</label>
			</td>
			<td><input type="text" style="width: 100%;"></td>
			<td align="right">
				<button id="buttonicon">
					주소록
				</button>
			</td>
			<td align="right">
			 	<input type="checkbox" style="margin-top: 10px">
				<label style="font-weight: lighter;">개인별</label>
			 </td>
		</tr>
		<tr>
			<td id="title">참조</td>
			<td><button style="width: 10px;"  id="buttonicon" >
				<span class="glyphicon glyphicon-plus" id="plusicon"></span>
			</button></td>
			<td colspan="2"><input type="text" size="137%"></td>
			<td align="right">
				<button  id="buttonicon" style="height: 24px;">
					주소록
				</button>
			</td>
		</tr>
		<tr>
			<td id="title">제목</td>
			<td><input type="checkbox" style="margin-top: 10px">
					<label style="font-weight: lighter;">중요</label></td>
			<td colspan="2"><input type="text" size="137%"></td>
			<td align="right">
				<button  id="buttonicon">
					약속잡기
				</button>
			</td>
		</tr>
		<tr>
			<td id="title">파일첨부</td>
			<td><button style="width: 10px;" id="buttonicon">
				<span class="glyphicon glyphicon-plus" id="plusicon"></span>
			</button></td>
			<td>
				<button  id="buttonicon">
					내 pc
				</button> 
				<button  id="buttonicon">
					N드라이브
				</button> x<a>삭제</a>
			</td>
			<td width="50" colspan="2" align="right">일반0KB/10MB | 대용량 0KB/2GBx10개</td>
		</tr>
	</table><p>
	<table border="1">
		<tr style="height: 30px; ">
			<td style="font-weight: lighter;">
				<div>
	          		<button id="buttonicon">
	          		  	글꼴
	           			<span class="caret"></span>
	       		    </button>
	       		    
	       		    <button id="buttonicon">
	          		  	9pt
	           			<span class="caret"></span>
	       		    </button>
	       		    
	       		    <button style="height: 24px;" id="buttonicon">
				 		가
				 	</button>
				 	<button style="height: 24px;" id="buttonicon">
				 		가
				 	</button>
				 	<button style="height: 24px;" id="buttonicon">
				 		가
				 	</button>
				 	<button style="height: 24px;" id="buttonicon">
	          		  	가
	           			<span class="caret"></span>
	       		 	</button>
				 	<button style="height: 24px;" id="buttonicon">
	          		  	가
	           			<span class="caret"></span>
	       		 	</button>
	       		 	<button id="buttonicon">
				   		<span style="height: 24px" class="glyphicon glyphicon-align-left"></span></button>
				   	<button id="buttonicon">
				   		<span style="height: 24px" class="glyphicon glyphicon-align-center"> </span></button>
				   	<button id="buttonicon">
					 	<span style="height: 24px" class="glyphicon glyphicon-align-right"> </span></button>
				   	<button id="buttonicon">
				   		<span style="height: 24px" class="glyphicon glyphicon-align-justify"> </span></button>
				   		
				   		<button style="border-color:white; height: 24px;"  id="buttonicon">
			    		<span id="buttonlable">>></span>
			    	</button>
	        	</div>
        	</td>
		</tr>
		<tr>
			<td><textarea rows="30%" cols="170%">aaaaaa</textarea>
		</tr>
	</table>
	<button type="button" class="btn btn-default btn-lg"></button>
</form>
</body>
</html>