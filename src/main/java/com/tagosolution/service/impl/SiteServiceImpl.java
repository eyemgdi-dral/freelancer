package com.tagosolution.service.impl;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tagoplus.model.common.BaseFileVO;
import com.tagoplus.service.SiteService;
import com.tagoplus.util.Encrypt;
import com.tagoplus.util.MimeUtil;
import com.tagoplus.util.StringUtil;
import com.tagoplus.util.UploadFile;
import com.tagosolution.service.UploadSubDir;
import com.tagosolution.service.model.SiteVO;

/**
 * 사이트 정보 서비스 
 * 		- 인터페이스 내 메서드 두 개 : 예제 참고용
 * @author wimy
 *
 */
@Service("siteService")
public class SiteServiceImpl extends BaseServiceImpl implements SiteService {
	
	private static final Logger logger = LoggerFactory.getLogger(SiteServiceImpl.class);
	
	@Autowired
	private UploadFile _upload;
	
	/**
	 * 현재 사이트 url 기준 사이트 정보 한 건 가져오기
	 * - 현재 사이트 정보가 없을 경우 server 기준으로 한 건 등록
	 * - SiteVO.isNew() == true일 경우 신규 사이트 정보 등록된 상태 => 인터셉터에서 신규 사이트 정보 등록 처리 안내 페이지로 이동
	 */
	@Override
	public SiteVO getCurrentSiteInfo(HttpServletRequest request) throws Exception {
		
		//프론트 URL일 경우 세션에 담긴 정보 그대로 사용
		//TODO : 프론트 개발 후  테스트 필요
		if (request.getSession().getAttribute(super.getConfig().getSessionNameForSite()) != null && request.getContextPath().indexOf(super.getConfig().getAdminRoot()) < 0)
			return (SiteVO) request.getSession().getAttribute(super.getConfig().getSessionNameForSite());
		
		SiteVO siteVO = (SiteVO) getDAO().selectOne("site.selectByServerName", request.getServerName());
		//사이트 정보 한 건 저장 판단
		if (siteVO == null) {
			
//			//String sNewPassword = StringUtil.getRandomValue(GenType.Number, 4);
//			String sNewPassword = "1234";
//			String sSuId = "superuser";
//			
//			SiteVO vo = new SiteVO();
//			//사이트 정보 기본 정보 자동 등록
//			vo.setSiteDomain(request.getServerName());
//			vo.setSiteName("[임시등록]" + vo.getSiteDomain());
//			vo.setSiteCertKey("");
//			vo.setSuId(sSuId);
//			vo.setSuPwd(Encrypt.SHA256Hash(sNewPassword));
//			int iAffectedRows = getDAO().insert("site.insertDefault", (SiteVO)vo);
//			logger.warn(">>>>>>>> A new server registered. : {}, site_seq : {}, affectedRows : {}", request.getServerName(), vo.getSiteSeq(), iAffectedRows);
//			
//			siteVO = new SiteVO();
//			siteVO.setNew(true);
//			siteVO.setSuId(vo.getSuId());
//			siteVO.setSuPwd(sNewPassword);
//			siteVO.setSiteDomain(vo.getSiteDomain());
//			siteVO.setSiteName(vo.getSiteName());
//
//			logger.info(">>>>> Site Information sessioned.");
		}
		else {
			//Short level = 1;
			//if (siteVO.getUseMenusVO().isEmpty())
			//	siteVO.setUseMenusVO((List<MenuSettingVO>) getDAO().selectList("menuSetting.selectByKey", level));
				//siteVO.setUseMenusVO( (List<FixedCodeVO>)getDAO().selectList("fixedCode.selectByArray", siteVO) );
			
			if (siteVO.getSiteCertKey().equals(Encrypt.SHA256HashHex(request.getServerName())))
				siteVO.setCertified(true);
			
			request.getSession().setAttribute(getConfig().getSessionNameForSite(), siteVO);
		}
		
		
		
		return siteVO; 
	}
	
	/**
	 * 사이트 정보 업데이트
	 *  - 업데이트 후 세션 정보 업데이트
	 * @param vo
	 * @param request
	 * @throws Exception
	 */
	public int update(SiteVO vo, HttpServletRequest request) throws Exception {
		
		int iAffectedRows = 0;
		vo.setModDate(new Date());
		MimeUtil mu = new MimeUtil();
		boolean isEnableFile = mu.isEnableMimeTypes(vo.getUploadFile(), "image/");
		if (!isEnableFile)
			throw new Exception("지원되지 않는 형식의 파일입니다. 업로드할 수 없습니다.");
		SiteVO site = (SiteVO) super.getDAO().selectByKey("site.selectByKey", vo.getSiteSeq());
		List<BaseFileVO> files = _upload.saveFiles(vo.getUploadFile(), null, UploadSubDir.SUB_DIR_SITE);
		int idx = 0;
		
		//프론트 헤더 이미지
		if (!files.isEmpty() && files.get(idx).getSize() > 0) {
			vo.setLogoImageHead(files.get(idx).getFullPathName());
			
			if (!StringUtil.isEmpty(site.getLogoImageHead())) {
				String sPath = super.getServletContext().getRealPath(super.getConfig().getUploadPathVirtual()) + site.getLogoImageHead();
				File file = new File(sPath);
				if (file.exists())
					file.delete();
			}
		}
		idx ++;
		//프론트 푸터 이미지
		if (!files.isEmpty() && files.get(idx).getSize() > 0) {
			vo.setLogoImageFoot(files.get(idx).getFullPathName());
			
			if (!StringUtil.isEmpty(site.getLogoImageFoot())) {
				String sPath = super.getServletContext().getRealPath(super.getConfig().getUploadPathVirtual()) + site.getLogoImageFoot();
				File file = new File(sPath);
				if (file.exists())
					file.delete();
			}
		}
		idx ++;
		//관리자 헤더 이미지
		if (!files.isEmpty() && files.get(idx).getSize() > 0) {
			vo.setAdminTitleUrl(files.get(idx).getFullPathName());
			
			if (!StringUtil.isEmpty(site.getAdminTitleUrl())) {
				String sPath = super.getServletContext().getRealPath(super.getConfig().getUploadPathVirtual()) + site.getAdminTitleUrl();
				File file = new File(sPath);
				if (file.exists())
					file.delete();
			}
		}
		iAffectedRows = super.getDAO().update("site.updateByKeySelective", vo);
		//세션 업데이트
		SiteVO svo = (SiteVO) super.getDAO().selectByKey("site.selectByKey", vo.getSiteSeq());
		svo.setCertified(true);
		request.getSession().removeAttribute(getConfig().getSessionNameForSite());
		request.getSession().setAttribute(getConfig().getSessionNameForSite(), svo);
		
		return iAffectedRows;
	}

	public void upateSiteSession(SiteVO vo) {
		super.getSession().setAttribute(super.getConfig().getSessionNameForSite(), vo);
	}
	
	/**
	 * 사이트 정보에 대한 기본값을 등록합니다.<br>
	 * 서버 이름(도메인)이 등록 기준값입니다. 해당 서버 이름이 있을 경우 추가 등록하지 않습니다.<br>
	 * 사이트 이름은 기본적으로 서버 이름이 들어갑니다.
	 * @param request
	 * @return SiteVO
	 * @throws Exception
	 */
	public SiteVO insertDefault(HttpServletRequest request) throws Exception {
		
		SiteVO siteVO = (SiteVO) super.getDAO().selectOne("site.selectByServerName", request.getServerName());

		if (siteVO == null) {
			SiteVO vo = new SiteVO();
			vo.setSiteDomain(request.getServerName());
			vo.setSiteName("[임시등록] " + request.getServerName());
			
			super.getDAO().insert("site.insertSelective", vo);
			
			logger.info("[프로그램 신규 설치] ServerName: {}, remote IP: {}", request.getServerName(), request.getRemoteAddr());
			
			siteVO = (SiteVO) super.getDAO().selectOne("site.selectByServerName", request.getServerName());
		}
		
		return siteVO;
	}
}
