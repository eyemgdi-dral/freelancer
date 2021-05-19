<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%@ include file="/WEB-INF/include/front_start_html.jsp"%>

<%-- 
	프론트 - 팝업
--%>

 <div class="layer_pop">
 
 	<div class="pop_tit height5"></div>
	<div class="pop_cons" style="height: ${pVo.verticalSize}px;">
		${pVo.body }
	</div><!-- pop_cons-->
	<div class="" style="bottom:0; text-align:right; padding: 8px;">
		<div class="" style="">
			<a class="popday" href="javascript:closePopupNotToday();" style="">오늘 하루동안 보지 않기</a>
		</div>
	</div>
</div><!-- layer_pop-->

<script type="text/javascript">
function closePopupNotToday(seq) {
	$('#popup' + seq).hide(function() {
		var expired = getDateByjQueryDateFormat('1d');
		SetCookie('${COOKIE_POPUP_PREFIX}' + seq, 'Y', null, null, expired);
	});
}
</script>
<%@ include file="/WEB-INF/include/front_end_html.jsp"%>