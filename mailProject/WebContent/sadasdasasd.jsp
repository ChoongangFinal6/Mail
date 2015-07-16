<!-- bold 초기작업 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#console {
	width: 300px;
	height: 20px;
	border: 1px solid #ccc;
}
</style>
<script type="text/javascript" src="./js/jquery.js"></script>
<script type="text/javascript">
	var chk = 0;
    var storedSelections = [];
    var currSelection;
	$(function(){
		$('#textarea').mouseup(function(){
			if (window.getSelection) {
				storedSelections.splice(0, storedSelections.length);
				currSelection = window.getSelection();
	            /* for (var i = 0; i < currSelection.rangeCount; i++) {
	                storedSelections.push(currSelection.getRangeAt (i));
	            }  */
	            chk = 1;
	        } else {
	            alert ("Your browser does not support this example!");
	        }
		});
		$('#b').click(function(){
			if(currSelection != null && currSelection != ""){
				document.getElementById("textarea").innerHTML = "<b>" + currSelection + "</b>";
			}
		});
		$('#textarea').hover(function(){
			if(chk == 0){
				chk = 1;
			}else{
				chk = 0;
			}
		});
		$('#body').click(function(){
			if(storedSelections != null && storedSelections != ""){
				if(chk == 0){
					storedSelections.splice(0, storedSelections.length);
					currSelection.removeAllRanges();
				}
			}
		});
		$("#textarea").val("textarea");
		// alert($("#textarea").html());
	});
	
</script>
</head>
<body id="body">
<input type="hidden" value="" id="imsi">
	<form name="fm">
	<p>abcdefghijklmnopqrstuvwxyz</p>
	<p>마우스로 드래그해서 선택한 글 나오기</p>
	sadkasjdaskjdaskj
	<!-- <div id="console"></div><p> -->
	<br>
	<input type="button" id="b" value="B">
	<br>
	<div contenteditable="true" id="textarea"
		style="width: 500px; height: 100px; border: 1px solid cyan;">가나다라마바사</div>
	</form>
</body>
</html>