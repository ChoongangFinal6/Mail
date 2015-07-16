	$(function(){
		$('#phInfoChk').click(function(){
			var name = $('#name').val();
			var birthdate = $('#birthdate').val();
			
			var gender = $(':radio[name="gender"]:checked').val();
			
			var phone = $('#phone').val();
			
			var sendData = 'name='+name+"&birthdate="+birthdate+"&gender="+gender+"&phone="+phone;

			$.ajaxSetup({
				type:'POST', url:'emInfoChk.do', dataType:'text', success:function(result){
					if(result == 2){
						alert("이미 가입한 회원입니다");
					}else if(result == 1){
						alert("핸드폰 인증이 완료되셨습니다.");
						$('#phInfoChk').css("display", "none");
						$('#phConfirmBtn').css("display", "inline-block");
						$('#phone').attr("disabled", "disabled");
					}else{
						alert("회원정보가 맞지 않습니다.");
					}
				}
			});
			$.ajax({
				data:sendData
			});
		});
		
		var confirm = 0;	
		var count = 0;
		$('#phConfirmBtn').click(function(){
			if(confirm == 0){
				var name = $('#name').val();
				var birthdate = $('#birthdate').val();
				var gender = $('#gender').val();
				var sendData = 'name='+name+"&birthdate="+birthdate+"&gender="+gender;
				$.ajaxSetup({
					type:'POST', url:'emGetCheckNum.do', dataType:'text', success:function(result){
						if(result == 0){
								alert("인증보내기에 실패하셨습니다");
						}else if(result == 1){
							alert("인증번호가 보내졌습니다.");
							$('#phConfirm').removeAttr("disabled");
							$('#phConfirmBtn').val("인증 확인");
							confirm = 1;
							count = setInterval(function(){
								//console.log(count);
							 	$('#confiSec').html(count++); 
							}, 1000);
							if($('#confiSec').text() == '10'){
								clearInterval(count);
								alert("10초");
							}
						}
					}
				});
				$.ajax({
					data:sendData
				});
			}else if(confirm == 1){
				var phConfirm = $('#phConfirm').val();
					var sendData = 'phConfirm='+phConfirm;
				if(phConfirm == "" || phConfirm == null){
					alert("인증번호를 입력하셔야 합니다.");
				}else{
					$.ajaxSetup({
						type:'POST', url:'emPhoneCheck.do', dataType:'text', success:function(result){
							if(result == 1){
								alert("인증에 성공하셨습니다.");
								$('#phConfirm').attr("disabled", "disabled");
								$('#phConfirmBtn').val("인증 완료");
								confirm = 2;
							}else if(result == 0){
								alert("인증번호 입력시간이 초과하였습니다.\n다시 인증번호를 전송해주세요");
								$('#phConfirm').val("");
								$('#phConfirm').attr("disabled", "disabled");
								$('#phConfirmBtn').val("인증 전송");
								confirm = 0;
							}else{
								alert("잘못된 인증번호입니다.\n다시 인증해주세요.");
							}
						}
					});
					$.ajax({
						data:sendData
					});
				}
			}else{}
		});	
		
		$('#id').keyup(function(){
			var id = $('#id').val();
			var sendData = "id=" + id; 
			$.ajaxSetup({
				type:'POST', url:'idChk.do', dataType:'text', success:function(result){
					if(result == 1){
						$('.idChkMsg').css('display', 'block');
					}else{
						$('.idChkMsg').css('display', 'none');
					}
				}
			});
			$.ajax({
				data:sendData
			});
		});
		
		$('#click').click(function(){
			alert($('#confiSec').text());
		});
		
		$('#passChk').keyup(function(){
			if($('#password').val() != $('#passChk').val()){
				$('#passChkMsg').css('display', 'block');
			}else{
				$('#passChkMsg').css('display', 'none');
			}			
		});
		
		$('#joinSubmit').click(function(){
			if($('.idChkMsg').css('display') != "none" || $('#id').val() == ""){
				alert("아이디를 확인해주세요.");
			}else if($('#passChkMsg').css('display') == "block" || $('#password').val() == "" || $('#passChk').val() == ""){
				alert("비밀번호를 확인해주세요.");
			}else if(confirm != 2){
				alert("핸드폰 인증을 해주세요.");
				return false;
			}else{
				$('#phone').removeAttr("disabled");
				return true;
			}
		});
	});