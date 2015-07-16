<!-- 단순 디자인 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/mailStyle.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div style="width: 64%">
        <div>
        	<h1>메일쓰기</h1>
        </div>
        <form action="mailWrite" method="post" class="mailForm">
        	<div>
        		<div>
        			<span class="title">제목</span>&nbsp;
        			<input type="text" size="100%" name="btitle" required="required" class="inputStyle">
	        	</div>
	        	<p>
    	    	<div>
        			<span class="title">주소록</span>&nbsp;
        			<input type="text" size="89%" name="btel" required="required"  class="inputStyle">
        			<input type="button" value="주소록" id="buttonicon" style="float: right;" onclick="location.href='mailAddressForm.html'">
        		</div>
        		<p>        		
        		<div>
        			<span class="title">파일&nbsp;</span>
        		</div>
        		<p>
        		<div>
        			<span class="title">사진&nbsp;</span>
        			<input type="file" name="image" class="inputStyle" style="float: left;">
        		</div>
        		<div>
        		<table class="tableStyle" border="1pt">
					<tr style="height: 30px; ">
						<td style="font-weight: lighter;">
						<div>
		          		<button id="buttonicon" style="margin-left: 7px">
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
	   		   		  	</div>
        				</td>
					</tr>
					<tr>
						<td><textarea rows="15%" cols="90%" name="bcontent"></textarea>
					</tr>
				</table>
			</div>
        </div>
        <p>
		<input type="submit" value="보내기" id="buttonicon" style="font-size: 1em; margin-left: 13pt;">
     	</form>
	</div>
</body>
</html>