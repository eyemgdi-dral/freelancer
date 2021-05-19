package com.tagosolution.interceptor;

import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.tagosolution.service.GlobalProperty;
import com.tagosolution.service.impl.SiteServiceImpl;
import com.tagosolution.service.model.SiteVO;

/**
 * 프론트 - 인터셉터
 *  - dispatcher-servlet.xml 참조
 * @author wimy
 *
 */
public class FrontInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(FrontInterceptor.class);
	
	@Resource
	private GlobalProperty _globalProperty;
	
	private GlobalProperty getConfig() {
		return this._globalProperty;
	}
	
	
	@Resource
	private SiteServiceImpl _siteService;
	
	@Autowired
	ApplicationContext _context;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		//현재 action url
		//주의 : jsp:include를 사용할 경우 requestURI는 실제 매핑된 jsp가 나옴
		// 사용 : 관리자 gnb, lnb
		if (request.getRequestURI().indexOf(".jsp") < 0) {
			request.setAttribute("reqURI", request.getRequestURI());
			//logger.debug(">>>>>> interceptor's request.getRequestURI() : {}", request.getRequestURI());
		}
		
//		// 사이트 정보 확인 - 사이트 기본 정보 자동 등록 (슈퍼유저 계정 포함)
//		SiteVO site = _siteService.getCurrentSiteInfo(request);
//		if (site.isNew()) {
//			response.sendRedirect(getConfig().getAdminRoot() + "/common/siteInfoCreate");
//			return false;
//		}
		
		//변경 : 등록되지 않은 사이트 정보로 들어올 경우 사용 불가 처리
		//SiteVO siteVO = _siteService.insertDefault(request);
		SiteVO siteVO = _siteService.getCurrentSiteInfo(request);
		
		if (siteVO != null) {
			if (request.getSession().getAttribute(this.getConfig().getSessionNameForSite()) == null)
				request.getSession().setAttribute(this.getConfig().getSessionNameForSite(), siteVO);
		}
		else {
			response.sendRedirect("/cannotUseSite.jsp");
			return false;
		}
		
		//not인증 14일 이후 관리자 기능 제한
		if (request.getSession().getAttribute(getConfig().getSessionNameForSite()) == null) {
			response.sendRedirect(getConfig().getAdminRoot() + "/common/error/503?str=" + URLEncoder.encode("사이트 정보가 없습니다. 프로그램을 사용할 수 없습니다.", Charset.defaultCharset().displayName()));
			return false;
		}
		
		
		//현재 action url
		//주의 : jsp:include를 사용할 경우, requestURI는 action url이 아닌 실제 매핑된 jsp 경로가 나옴
		String sUrl = request.getRequestURI();
		if (sUrl.indexOf(".jsp") < 0)
			request.setAttribute("reqURI", sUrl);
		
		
		String[] arrSkipUrls = new String[] {"/WEB-INF/jsp/", "/board/", "/main.do","/main", "/pages/", "/form/", "/bbs/","/upload/","/images/","/common/"};
		boolean isSkipUrl = false;
		for (String url : arrSkipUrls) {
			if (sUrl.startsWith(url)) {
				isSkipUrl = true;
				break;
			}				
		}
		
		// 로그인 체크가 필요한 URL
		String[] arrCheckUrls = new String[] {"/mypage/","/member_info"};
		boolean isNeedCheck = false;
		for (String url : arrCheckUrls) {
			if (sUrl.contains(url)) {
				isNeedCheck = true;
				break;
			}
		}
		
		if (isNeedCheck) {
			
			if (request.getSession().getAttribute(this.getConfig().getSessionNameForUser()) == null) {
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().println("<script>alert('" + _context.getMessage("common.need.login", new Object[0], Locale.getDefault()) + "'); location.href = '" + this.getConfig().getFrontMain() + "';</script>");
				response.getWriter().flush();
				return false;
			}
		}

		
		return true;
		
//		try {
//			String rUrl = request.getRequestURI();
//			return true;
//		}
//		catch (Exception e) {
//			// e.printStackTrace();
//			logger.error(this.getClass().getName() + " 인터셉터 오류 : {}", e.getMessage(), e);
//			throw e;
//		}
	}
}
