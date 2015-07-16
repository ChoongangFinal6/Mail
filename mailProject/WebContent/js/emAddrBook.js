/**
 * 
 */
$(function(){
	$('#moveRight').click(function(){
		$('#mailWaitDel').children().remove();	
		// 지정한 아이디의 자식 태그들 제거. input type=hidden의 값이 누적되어 초기화로 사용 
		$('#mailWaitData').children().remove();		
		// sendList 배열 수만큼 이하의 작업 수행. 체크한 값의 아이디를 가지고 오기 위해 사용.
		$('span').each(function(index){
			// if문으로 지정 input의 checkbox값이 true인지 확인.
			if($('#sendChk'+index).prop("checked")){	
				// checkbox의 부모인 span의 display값을 none 변경. 보이지 않게 한다.
				$('#sendList'+index).css('display', 'none');	
				// 반대편에 있는 checkbox의 부모인 span의 display값을 기본값으로 변경. 기본값은 block이다.
				$('#getList'+index).css('display', 'inherit');	 
				// checkbox값이 계속 ture로 되어있어 항상 disyplay가 none으로 되어버리기에 false로 변경.
				$('#sendChk'+index).prop('checked', false);	 
				// span의 click이벤트로 변경한 배경색이 그대로 적용되어있으므로 전의 상태로 변경.
				//$('#sendList'+index).css('background-color', 'white');
				$('#sendList'+index).removeClass("checkbox2");
			}
			// getList들의 span 중 보이는 것들만 해당작업을 한다.
			if($('#getList'+index).css('display') == 'block'){
				// checkbox에 있는 value값을 변수로 지정한다.
				var data = $('#getChk'+index).val();	
				// 해당 div에 input type=hidden만들어 getList에 보이는 값들을 넘기기 생성한다. 
				$('#mailWaitData').append(function(){
					var send = "<input type='hidden' name='sendData' value='" + data + "'>";	 
					return send;
				});
			}
		});		
	});
	
	$(".cancelBtn").click(function() {
		self.close();
	});
	
	$('#moveLeft').click(function(){
		$('#mailWaitData').children().remove();		
		$('span').each(function(index){
			if($('#getChk'+index).prop("checked")){		
				$('#sendList'+index).css('display', 'inherit');
				$('#getList'+index).css('display', 'none');
				$('#getChk'+index).prop('checked', false);
				//$('#getList'+index).css('background-color', 'white');
				$('#getList'+index).removeClass("checkbox2");
			}
			if($('#getList'+index).css('display') == 'block'){
				// checkbox에 있는 value값을 변수로 지정한다.
				var data = $('#getChk'+index).val();	
				// 해당 div에 input type=hidden만들어 getList에 보이는 값들을 넘기기 생성한다. 
				$('#mailWaitData').append(function(){
					var send = "<input type='hidden' name='sendData' value='" + data + "'>";	 
					return send;
				});
			}
		});
	});

	// span 클릭이벤트를 위해 만들었다.
	$('span').each(function(index){
		$('#sendList'+index).click(function(){
			// 해당 span이 클릭했을 때 check가 되어있지 않다면 checkbox값을 ture로 바꾸며 배경색 변경. 
			if($('#sendChk'+index).prop("checked") == false){
				$('#sendChk'+index).prop('checked', true);
				//$('#sendList'+index).css('background-color', '#729dd7');
				$('#sendList'+index).addClass("checkbox2");
				// 해당 span이 클릭했을 때 check가 되어있지 있다면 checkbox값을 false로 바꾸며 배경색을 되돌림.
			}else if($('#sendChk'+index).prop("checked")){
				$('#sendChk'+index).prop('checked', false);
				$('#sendList'+index).removeClass("checkbox2");
				//$('#sendList'+index).css('background-color', 'white');
			}
		});
			
		// 위의 클릭이벤트와 같음
		$('#getList'+index).click(function(){
			if($('#getChk'+index).prop("checked") == false){
				$('#getChk'+index).prop('checked', true);				
				//$('#getList'+index).css('background-color', '#729dd7');
				$('#getList'+index).addClass("checkbox2");
			}else if($('#getChk'+index).is(":checked")){
				$('#getChk'+index).prop('checked', false);
				//$('#getList'+index).css('background-color', 'white');
				$('#getList'+index).removeClass("checkbox2");
			}
		});
		
		
	});
	
	$('span').click(function(){
		$('#mailWaitDel').children().remove();	
		$('.sendList').each(function(index){
			//if($('#sendList'+index).css('background-color') == 'rgb(114, 157, 215)'){
			if($('#sendList'+index).attr('class') == 'checkbox2'){
				// checkbox에 있는 value값을 변수로 지정한다.
				var data = $('#getChk'+index).val();
				// 해당 div에 input type=hidden만들어 getList에 보이는 값들을 넘기기 생성한다. 
				$('#mailWaitDel').append(function(){
					var send = "<input type='hidden' id='delData' name='delData' value='" + data + "'>";	 
					return send;
				});
			}
		});
	});	
	
	$('#mailAddAddrBook').click(function(){
		var mailAddr = $('#mailAddr').val();
		var sendData = 'mailAddr='+mailAddr;
		$.ajaxSetup({
			type:'POST', url:'emAddrBookChk.do', dataType:'text', success:function(result){
				if(result == 0){
					alert("이미 존재하는 이메일주소 입니다.");
				}else if(result == 1){
					alert("이메일 형식이 아닙니다. 다시 입력해주세요.");
				}else if(result == 2){
					alert("주소록에 이메일을 추가하셨습니다.");
					location.href="emAddrBook.do";
				}else if(result == 3){
					alert("존재하는 이메일이 아닙니다. 다시 입력해주세요.");
				}else if(result == 4){
					alert("자신의 이메일은 추가할 수 없습니다.");
				}
			}
		});
		$.ajax({
			data:sendData
		});
	});
	
	$('#mailDelAddrBook').click(function(){
		var delData = [];
	    $("input[id='delData']").each(function(i) {
	    	delData.push($(this).val());
	    });
	  /*  var sendData = "";
	    for (var i = 0; i < delData.length; i++) {
	    	if(i == delData.length - 1){
	    		sendData += 'delData='+delData[i];
			}else{
				sendData += 'delData='+delData[i]+'?';
			}
		}*/
	    var sendData = 'delData='+delData;	
		$.ajaxSetup({
			type:'POST', url:'emDelBookChk.do', dataType:'text', success:function(result){
				if(result == 1){
					alert("주소록에 있는 해당 메일을 삭제하였습니다.");
					location.href="emAddrBook.do";
				}else{
					alert("삭제할 이메일을 선택해주세요.");
				}
			}
		});
		$.ajax({
			data:sendData
		});
	});
});