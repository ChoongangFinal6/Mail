	$(function(){		
		var submitChk = 0;
		$('#id').keyup(function(){
			var id = $('#id').val();
			var password = $('#password').val();
			var sendData = "id=" + id + "&password=" + password;
			
			$.ajaxSetup({
				type:'POST', url:'emLoginChk.do', dataType:'text', success:function(result){
					submitChk=result;
				}
			});
			$.ajax({
				data:sendData
			});
		});
		
		$('#password').keyup(function(){
			var id = $('#id').val();
			var password = $('#password').val();
			var sendData = "id=" + id + "&password=" + password;
			
			$.ajaxSetup({
				type:'POST', url:'emLoginChk.do', dataType:'text', success:function(result){
					submitChk=result;
				}
			});
			$.ajax({
				data:sendData
			});
		});
		
		$('#submit').click(function(){
			if(submitChk == 1){
				alert("비밀번호가 틀리셨습니다");
				return false;
			}else if(submitChk == 2){
				return true;
			}else{
				alert("존재하지 않는 아이디입니다.")
				return false;
			}
		});
	});
	var cnt = 0;
	function reset(){
		if(cnt > 2){
			location.replace("");
			cnt++;
			history.go(1);
		}
	}