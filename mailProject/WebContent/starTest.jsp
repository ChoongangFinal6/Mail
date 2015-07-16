<!-- 드래그한 부분 저장 및 삭제, 저장한 부분 보여주기 샘플 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
        var storedSelections = [];

        function StoreSelection () {
            if (window.getSelection) {
                var currSelection = window.getSelection ();
                for (var i = 0; i < currSelection.rangeCount; i++) {
                    storedSelections.push (currSelection.getRangeAt (i));
                }
                currSelection.removeAllRanges ();
            } else {
                alert ("Your browser does not support this example!");
            }
        }

        function ClearStoredSelections () {
            storedSelections.splice (0, storedSelections.length);
        }

        function ShowStoredSelections () {
            if (window.getSelection) {
                var currSelection = window.getSelection ();
                currSelection.removeAllRanges ();
                for (var i = 0; i < storedSelections.length; i++) {
                    currSelection.addRange (storedSelections[i]);
                }
            } else {
                alert ("Your browser does not support this example!");
            }
        }
    </script>
</head>
<body>
    Select some content on this page and use the buttons below.<br /><br />
    <button onclick="StoreSelection ();">Store the selection</button>
    <button onclick="ClearStoredSelections ();">Clear stored selections</button>
    <button onclick="ShowStoredSelections ();">Show stored selections</button>
    <br /><br />
    <div>Some text for selection</div>
    <div><b>Some bold text for selection.</b></div>
</body>
</html>