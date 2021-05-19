package com.tagosolution.controller.front;

import java.net.InetAddress;
import java.security.PrivateKey;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tagoplus.model.common.AlertModel;
import com.tagoplus.util.Encrypt;
import com.tagoplus.util.RSAUtil;
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.LoginServiceImpl;
import com.tagosolution.service.impl.MemberServiceImpl;
import com.tagosolution.service.model.BaseCMomeyVO;
import com.tagosolution.service.model.HistoryLoginVO;
import com.tagosolution.service.model.MemberCMomeyVO;
import com.tagosolution.service.model.MemberInfoVO;
import com.tagosolution.service.model.MemberSettingVO;
import com.tagosolution.service.model.SiteVO;
import com.tagosolution.service.model.search.AdminLoginSearchVO;
import com.tagosolution.service.model.search.MemberSearchVO;
import com.tagoplus.util.GoogleAPIAuth;

@Controller
public class LoginController extends BaseController{
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	private String _RSA_KEY_ATTR = "_RSA_PK";

	@Autowired
	GeneralDAOImpl _gDao;
	
	@Resource
	MemberServiceImpl _memberService;
	
	@Resource 
	LoginServiceImpl _loginService;
	
	/**
	 * 로그인 페이지
	 * 	- RSA 암호화 처리
	 * @param site
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/login")
	public String login(SiteVO site, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		super.setPageSubTitle("로그인", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		try {
			RSAUtil rsa = new RSAUtil();
			rsa.generateRSA(request, model, _RSA_KEY_ATTR);
			MemberSettingVO set = (MemberSettingVO) _gDao.selectOne("memberSetting.selectBySns",  super.getSiteSession().getSiteSeq());
			model.addAttribute("set", set);
		}
		catch (Exception e) {
			AlertModel am = new AlertModel(e.getMessage(), super.getConfig().getFrontLoginURL(), null);
			model.addAttribute("alert", am);
			return super.getConfig().getViewAlert();
		}
		
		return "/front/login/login";
	}
	
	
	/**
	 * 로그인 처리
	 * 	- RSA 암호화 처리
	 * @param search
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/request_secure_login")
	public String requestSecureLogin(AdminLoginSearchVO search, BindingResult result, Model model, HttpServletRequest request) {
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		try {
			PrivateKey privateKey = (PrivateKey)request.getSession().getAttribute(_RSA_KEY_ATTR);
			request.getSession().removeAttribute(_RSA_KEY_ATTR);
			RSAUtil rsa = new RSAUtil();
			
			String userId = rsa.decryptRsa(privateKey, search.getSecureId());
			String userPassword = rsa.decryptRsa(privateKey, search.getSecurePwd());
			
			boolean hasAccount =  false;
			MemberInfoVO memVo= (MemberInfoVO) _gDao.selectByKey("memberInfo.selectById", userId);
			if (memVo != null) {
				if (memVo.getUserPwd().equals(Encrypt.SHA256Hash(userPassword))) {
					hasAccount = true;
				}
			}
			
			if (hasAccount) {
				super.getSession().setAttribute(super.getConfig().getSessionNameForUser(), memVo);				
				_loginService.insertLoginUserCounter(memVo);
				return "redirect:" + super.getConfig().getFrontMain();
			}
			else {
				AlertModel am = new AlertModel("아이디나 비밀번호가 올바르지 않습니다.", super.getConfig().getFrontLoginURL(), null);
				model.addAttribute("alert", am);
				return super.getConfig().getViewAlert();
				
			}
		}
		catch (Exception e) {
			logger.error(e.getMessage(), e);
			AlertModel am = new AlertModel(e.getMessage(), super.getConfig().getFrontLoginURL(), null);
			model.addAttribute("alert", am);
			return super.getConfig().getViewAlert();
		}
	}
	
	@RequestMapping(value = "/{social}/request_sns_login")
	public String requestSnsApiLogin(MemberSearchVO search, BindingResult result, Model model, HttpServletRequest request, @PathVariable String social) {
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		try {
			MemberInfoVO mem = new MemberInfoVO();
			String accessToken = request.getParameter("access_token");
			switch(social){
				case "fb" :
					mem = _memberService.getFbProfileInfo(accessToken);
					break;
				case "google" :
					mem = GoogleAPIAuth.getGoogleProfileInfo(accessToken);
					break;
				case "kakao" :
					mem = _memberService.getKakaoProfileInfo(accessToken);
					break;
				case "naver" :
					mem = _memberService.getNaverProfileInfo(accessToken);
					break;
				default:
					break;
				
			}
			
			MemberInfoVO memVo = (MemberInfoVO) _gDao.selectByKey("memberInfo.selectById", mem.getUserId());
			if (memVo == null) {
				mem.setPassword("");
				_memberService.insertMemberInfo(null,search, mem);
			}
			MemberSettingVO Memsett = (MemberSettingVO) _gDao.selectByKey("memberSetting.selectByUrls", super.getSiteSession().getSiteSeq());
			super.getSession().setAttribute(super.getConfig().getSessionNameForUser(), (memVo != null) ? memVo : mem);
			return "redirect:"+ Memsett.getMemInfoUrl() +"?id=" + super.getUserSession().getUserId();
			
		}
		catch (Exception e) {
			logger.error(e.getMessage(), e);
			AlertModel am = new AlertModel(e.getMessage(), super.getConfig().getFrontLoginURL(), null);
			model.addAttribute("alert", am);
			return super.getConfig().getViewAlert();
		}
	}

	/**
	 * 로그아웃
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/logout")
	public String logout(Model model, HttpServletRequest request) throws Exception {
		MemberSettingVO Memsett = (MemberSettingVO) _gDao.selectByKey("memberSetting.selectByUrls", super.getSiteSession().getSiteSeq());
		String LogoutURL = (Memsett.getMemLogoutUrl() == null) ? super.getConfig().getFrontLoginURL() : Memsett.getMemLogoutUrl();
		super.getSession().invalidate();
		return "redirect:" + LogoutURL;
	}
}
