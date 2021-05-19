package com.tagosolution.interceptor;

import java.net.InetAddress;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.tagoplus.util.Encrypt;
import com.tagoplus.util.StringUtil;

public class AjaxInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(AjaxInterceptor.class);
	
	public static final String AJAX_AUTHORIZED = "_attr_ajax_authorized";
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		InetAddress inet= InetAddress.getLocalHost();
		//logger.debug(">>>>>>>>>>>> " + inet.getHostAddress() + " : " + request.getRemoteAddr());
		
		request.setAttribute(AJAX_AUTHORIZED, false);
		
		if (request.getRemoteAddr().equals("127.0.0.1") || inet.getHostAddress().equals(request.getRemoteAddr())) {
			request.setAttribute(AJAX_AUTHORIZED, true);
		}
		
		if (!(boolean) request.getAttribute(AJAX_AUTHORIZED)) {
			
			String sApiId = StringUtil.getString(request.getHeader("apiId"));
			String sApiKey = StringUtil.getString(request.getHeader("apiKey"));
			
			String sDecrypted = Encrypt.decryptAES(sApiKey);
			// logger.debug("sDecrypted : {}, {}", sApiKey, sDecrypted);
			
			if (!StringUtil.isEmpty(sApiId) && sApiId.equals(sDecrypted)) {
				request.setAttribute(AJAX_AUTHORIZED, true);
			}
		}
		
		return super.preHandle(request, response, handler);
	}
}
