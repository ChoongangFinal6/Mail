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
   var textarea = document.getElementById("textarea");
   var currSelection;
   var full;
   var testArr = [];
   $(function() {
      $('#textarea').mouseup(function() {
         if (window.getSelection) {
            storedSelections.splice(0, storedSelections.length);
            currSelection = window.getSelection(); 
            for (var i = 0; i < currSelection.rangeCount; i++) {
               storedSelections.push(currSelection.getRangeAt(i));               
            }
            
            //alert($("#textarea").html());
            //alert($("#textarea").html().rangeCount);   
            
            $("#textarea").val("textarea");
            var test = $("#textarea").html().toString(); 
            testArr.push(test);
            
            //alert(full);         

            chk = 1;
         } else {
            alert("Your browser does not support this example!");
         }
      });

      $('#b').click(
            function() {
               if (storedSelections != null && storedSelections != "") {
                  alert(storedSelections);
                  storedSelections.splice(0, storedSelections.length,
                        "<br>" + storedSelections + "<br>");
                  alert(storedSelections);
               }
            });

      $('#textarea').hover(function() {
         if (chk == 0) {
            chk = 1;
         } else {
            chk = 0;
         }
      });

      $('#body').click(function() {
         if (chk == 0) {
            storedSelections.splice(0, storedSelections.length);
            currSelection.removeAllRanges();
            
         }
      });
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
      <br> <input type="button" id="b" value="B"> <br>
      <div name="textarea" id="textarea" contenteditable="true"
         style="width: 500px; height: 400px; border: 1px solid cyan;">가나다라마바사</div>
   </form>
</body>
</html>