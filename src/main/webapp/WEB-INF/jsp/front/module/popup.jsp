<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%--
		팝업생성
 --%>

<script id="popupTmpl" type="text/x-jquery-tmpl">

	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
     		<div class="modal-header">
        		<h5 class="modal-title">\${subject} </h5>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
     			</button>
      		</div>
			<div class="modal-body">
{{html body}}
			</div>
      		<div class="modal-footer">
        		<a onclick="javascript:closePopupNotToday(\${popupSeq});"  class="btn-link mr-auto text-sm font-weight-400">오늘 하루동안 보지 않기</a>
        		<button type="button"class="btn btn-secondary" data-dismiss="modal">닫기</button>
      		</div>
    	</div>
  	</div>
</script>
<script type="text/javascript">
	$(function() {
		getPopup();
	});
	
	//TODO : 팝업 레이아웃 수정 필요, 테스트 필요
	function getPopup() {
		
		$.ajax({
			url : '/ajax/getPopup.do',
			type : 'post',
			data : {
					popupSeq : '${pVo.popupSeq}' 
				},
			dataType : 'json',
			success : function(data) {
				
				$(data).each(function(i, el) {
					if (GetCookie('${COOKIE_POPUP_PREFIX}' + el.popupSeq) == 'Y')
						return true;
					if (el.popupType == 'L') {
						var $layer = $('<div id="popup'+ el.popupSeq +'" class="modal fade popup'+ el.popupSeq +'" data-backdrop="static" data-keyboard="false">');
						el.body = el.body.replace(/<\!--.*?-->/g, "")
						$('#popupTmpl').tmpl(el).appendTo($layer);
						$(document.body).append($layer);
						console.log(el)
						$('.pop').find('img').each(function(){
							$(this).load(function(){
								var iWidth = this.naturalWidth;
								var iHeight = this.naturalHeight;
								if (iWidth > el.horizontalSize) {
									while (iWidth > el.horizontalSize) {
										iWidth = iWidth * 0.875;
										iHeight = iHeight * 0.875;
									}
									$(this).width(iWidth).height(iHeight);									
								}
							});
						});
						$('#popup'+el.popupSeq).modal()
						var text = $('#popup'+el.popupSeq).find(".modal-body").text()
						$('#popup'+el.popupSeq).find(".modal-body").html($(text))
					}
					else if (el.popupType == 'W') {
						//오늘 하루동안 보지 않기 길이 미포함 처리 + 30
						popUpWin('/module/open_popup.do?popupSeq='+el.popupSeq, 'popup'+ el.popupSeq, el.horizontalSize, el.verticalSize + 30, el.positionX, el.positionY, "auto", "yes", false);							
					}
					
				});

				$('.drag').draggable();
			},
			error : function(data) {
				alert("error ajax :\n" + data.responseText);
			}
		});
	}

	function closePopup(seq) {
		$('#popup' + seq).hide('fade');
	}

	function closePopupNotToday(seq) {
		$('#popup' + seq).hide(function() {
			var expired = getDateByjQueryDateFormat('1d');
			SetCookie('${COOKIE_POPUP_PREFIX}' + seq, 'Y', null, null, expired);
		});
	}
</script>