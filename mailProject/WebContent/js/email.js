	$(function(){
		$('.emNoChk').click(function(){
			$('#waitDel').children().remove();	
			$('.emNoChk').each(function(index){
				if($('#emNoChk'+index).prop("checked")){
					// checkbox에 있는 value값을 변수로 지정한다.
					var data = $(this).val();
					// 해당 div에 input type=hidden만들어 getList에 보이는 값들을 넘기기 생성한다. 
					$('#waitDel').append(function(){
						var send = "<input type='hidden' id='delData' name='delData' value='" + data + "'>";	 
						return send;
					});
				}
			});
		});	
		
		$('#emMailGetDel').click(function(){
			var delData = [];
		    $("input[id='delData']").each(function(i) {
		    	delData.push($(this).val());
		    });
		    var sendData = 'delData='+delData;	
			$.ajaxSetup({
				type:'POST', url:'emMailGetDel.do', dataType:'text', success:function(result){
					if(result > 0){
						alert("삭제에 성공하셨습니다.");
						location.href="emMailMain.do";
					}else{
						alert("삭제할 이메일을 선택해주세요.");
					}
				}
			});
			$.ajax({
				data:sendData
			});
		});
		
		$('#emMailSendDel').click(function(){
			var delData = [];
		    $("input[id='delData']").each(function(i) {
		    	delData.push($(this).val());
		    });
		    var sendData = 'delData='+delData;	
			$.ajaxSetup({
				type:'POST', 
				url:'emMailSendDel.do', 
				dataType:'text', 
				success : function(result){
					if(result > 0){
						alert("삭제에 성공하셨습니다.");
						location.href="emMailSendView.do";
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


$(function() {
	$("#logout").click(function() {
		location.href="emLogout.do";
	});
	// 로그아웃 버튼
	
	$(".mailham").click(function() {
		location.href="emMailMain.do";
	});
	
	$("#num").change(function () {
		alert("123");
	});
});

function cntplus() {
	cnt++;
}
// 사진 몇장 등록 되었는지 확인하기 위한 변수

$(function() {
	$("#write").click(function() {
		location.href="emMailWrite.do";
	});
	$("#getmail").click(function() {
		location.href="emMailMain.do";
	});
	$("#sendmemail").click(function() {
		location.href="emMailSendView.do";
	});
	$("#noreadmail").click(function() {
		location.href="emMailNotRead.do";
	});
});
// 사이드 메뉴 버튼

$(function() {
	$("#saveaddr").click(function() {
		window.open("emAddrBook.do", "search",
		"width=485,height=370,scrollbars=yes,resizeable=no,left=300,top=150", "");		
	});
});
// 주소록 버튼

$(function() {	
	$("#color").click(function() {	
		var range = window.getSelection().getRangeAt(0);
		var selectionContents = range.extractContents();
		var span = document.createElement("span");
		span.style.color = "red";
		span.style.backgroundColor = "orange";		
		span.appendChild(selectionContents);
		range.insertNode(span);		
	});
	// 컬러 설정
	
	$("#size").click(function() {			
		var range = window.getSelection().getRangeAt(0);
		var selectionContents = range.extractContents();
		var span = document.createElement("span");
		span.style.fontSize = "40px";		
		span.appendChild(selectionContents);
		range.insertNode(span);		
	});
	// 폰트 사이즈 조절
	
	$("#style").click(function() {
		var range = window.getSelection().getRangeAt(0);
		var selectionContents = range.extractContents();
		var span = document.createElement("span");
		span.style.fontFamily = "arial";		  		   
		span.appendChild(selectionContents);
		range.insertNode(span);		
	});
	// 다른 글꼴 적용

	$("#bold").click(function() {		
		var range = window.getSelection().getRangeAt(0);
		var selectionContents = range.extractContents();
		var font = document.createElement("font");
		font.style.fontWeight = "bold";
		font.appendChild(selectionContents);
		range.insertNode(font);		
	});
	// 굵게 설정
});
// 폰트 스타일 버튼
	
$(function() {
	$("#container").click(function() {		
		var $container = $("#container").text();			
		if($container=="" || $container==null) {				
			document.getElementById("container").insertAdjacentHTML('afterbegin',"&nbsp");				
		}
	});		
}); 
// 내용 칸에 아무것도 적지 않고 이미지 넣을시에 작동

$(function() {
	$(document).mousedown(function() {
		$("#trash").droppable({	      
			accept: ".ui-wrapper",	 
			hoverClass: "ui-state-active",
			drop: function( event, ui ) {	  			
				deleteImage( ui.draggable );
			}
		});
		// 휴지통에 이미지 드랍하면 작동
	});

	var recycle_icon = "<a href='link/to/recycle/script/when/we/have/js/off' title='Recycle this image' class='ui-icon ui-icon-refresh'>Recycle image</a>";
	// 복구 아이콘
	function deleteImage( $item ) {		    	
		$item.fadeOut(function() {
			cnt--;
			var $list = $( "ul", "#trash" ).length ?
					$( "ul", "#trash" ) : $( "<ul class='gallery ui-helper-reset'/>" ).appendTo( "#trash" );	          
					/*$item.append( recycle_icon ).appendTo( $list ).fadeIn(function() {	        	  
						$item.animate({ width: "50px", height: "60px"})
						.find( "img" ).animate({width: "40px" , height: "36px" });     	          
					});*/
		});
	}
	// 이미지 삭제

	$(function() {		
		$("#container").droppable({	      
			accept: ".ui-wrapper"		
		});
		// 내용 칸 안에서 이미지 드랍할 경우 작동
	});
}); 
// 마우스 누르는 순간 작동

var cnt = 0;	// 이미지 아이디에 사용함.
$(function() {
	$("#upload").click(function() {
		if(cnt > 1) {
			alert("사진을 추가할 수 없습니다.");			
		} else {			
			window.open("upload.do?cnt="+cnt, "search",
			"width=385,height=370,scrollbars=yes,resizeable=no,left=300,top=150");		
		}					
	});				
});
// 업로드 버튼
	
$(function() {
	$("#send").click(function() {	
		$('#sendText').append(function() {		 	
			var text = $('#container').html();				
			var sendText = "<input type='hidden' name='sendText' value= '" + text+ "'>";
			return sendText;
		});	
		
		$('#sendAddr').append(function() {		 	
			var addr = $('#toAddress').html();				
			var sendAddr = "<input type='hidden' name='sendAddr' value= '" + addr+ "'>";
			return sendAddr;
		});
		
		$('#sendTitle').append(function() {		 	
			var title = $('#title').html();				
			var sendTitle = "<input type='hidden' name='sendTitle' value= '" + title+ "'>";
			return sendTitle;
		});
		$("#frm").submit();
	});
}); 
// 전송 버튼 : 내용을 input 값에 적용하여 전송한다.
	
var width, width2, width3;
var height, height2, height3; 		
$(function() {
	$(document).mouseover(function() {	
		$("#resizable"+cnt).resizable({ 
			ghost: true,  // 마우스를 끌어다 놓기전에 크기를 확인할 수 있다.
			aspectRatio: 16 / 9,  // 비율 고정.			
			resize : function(event, ui) {
				height = $(this).css("height");
				height2 = height.replace("px", "");				
				height3 = height2/2;						
				
				width = $(this).css("width");
				width2 = width.replace("px", "");				
				width3 = width2/2;			
			}
		});
		// 이미지 사이즈 설정
		
		$(".ui-wrapper").draggable({
			//helper: "clone",  // 기존 위치가 보임   
			revert: "invalid", // when not dropped, the item will revert back to its initial position
			opacity: 0.35,			
			drag : function(event, ui) {				
				height = $(this).css("height");
				height2 = height.replace("px", "");				
				height3 = height2/2;						
				
				width = $(this).css("width");
				width2 = width.replace("px", "");				
				width3 = width2/2;			
				$( this ).draggable( "option", "cursorAt", { left: width3, top: height3 } );
			}		
		}); 	 
		// 이미지 이동 가능하게 설정

		$(".ui-wrapper").attr({ 
			contenteditable: false
		});
		// 이미지를 생성하였을때 이미지에 글자 적을 수 있게 하는것 방지		
		
		$( "ul.gallery > div" ).click(function( event ) {		
			var $item = $( this ),
			$target = $( event.target );

			if ( $target.is( "a.ui-icon-trash" ) ) {
				deleteImage( $item );
			} else if ( $target.is( "a.ui-icon-zoomin" ) ) {
				viewLargerImage( $target );
			} else if ( $target.is( "a.ui-icon-refresh" ) ) {
				recycleImage( $item );
			}
			return false;
		});
		// 복구 아이콘 기능
		
		function recycleImage( $item ) {
			$item.fadeOut(function() {
				$item
				.find( "a.ui-icon-refresh" )	          
				.remove()
				.end()			         
				.find( "img" )			       
				.animate({ width: "40px", height: "36px" })			       
				.end()			          
				.appendTo( "#container" )
				.fadeIn();
			});
		}	
		// 이미지 복구 기능
	});		
});	
// 항상 적용되게 하기 위해서 마우스를 움직이면 작동하게 설정