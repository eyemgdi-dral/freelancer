package com.tagosolution.controller.ajax;

import java.text.DecimalFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang.StringEscapeUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.BoardServiceImpl;
import com.tagosolution.service.impl.ProductServiceImpl;
import com.tagosolution.service.impl.QuickAskServiceImpl;
import com.tagosolution.service.model.AdminVO;
import com.tagosolution.service.model.BoardInfoVO;
import com.tagosolution.service.model.PopupVO;
import com.tagosolution.service.model.PrdVO;
import com.tagosolution.service.model.QuickConsultVO;
import com.tagosolution.service.model.RecentBoardVO;
import com.tagosolution.service.model.RecentPrdVO;
import com.tagosolution.service.model.CommContentsVO;
import com.tagosolution.service.model.search.BoardSearchVO;
import com.tagosolution.service.model.search.PrdSearchVO;
import com.tagoplus.model.common.SearchVO;
import com.tagoplus.util.StringUtil;
import com.tagosolution.controller.BaseController;

/**
 * 공통 ajax 컨트롤러
 * 	- json 요청, 리턴 등의 공통 처리 
 * @author wimy
 *
 */
@RestController
@Controller
public class AjaxController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(AjaxController.class);
	
	@Resource
	GeneralDAOImpl _gDao;
	
	@Resource
	BoardServiceImpl _boardService;
	
	@Resource
	ProductServiceImpl _prdService;
	
	@Resource
	QuickAskServiceImpl _quickAskService;
	
	
	
	
	/**
	 * ajax - 아이디 중복 검사
	 * @param body
	 * @param idType
	 * @param id
	 * @param result
	 * @param model
	 * @return 중복되었을 경우 중복된 아이디 유형, 아이디 리턴
	 * @throws Exception
	 */
	@RequestMapping(value = "/ajax/checkId")
	@ResponseBody
	public Object ajaxCheckId(@RequestBody(required = false) String body, String idType, String id, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		Map<String, Object> map = new HashMap<String, Object>();
		SearchVO search = new SearchVO();
		search.setSiteSeq(super.getSiteSession().getSiteSeq());
		search.setId(id);
		search.setIdType(idType);
		List<AdminVO> list = (List<AdminVO>) _gDao.selectList("admin.selectForCheckId", search);
		
		if (!list.isEmpty())
			map.put("result", list.get(0));
		else
			map.put("result", null);

		//{"result":{"userType":"designer","userID":"","userName":"디자이너"}}
		// 주의 : map 변수를 그대로 리턴해도 가능하지만, null 상태의 멤버 변수까지 모두 출력된다.
		//return map;
		return new Gson().toJson(map);
	}
	
	/**
	 * 
	 * @param body
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ajax/getPopup", method = RequestMethod.POST)
	@ResponseBody
	public Object ajaxGetPopup(@RequestBody(required = false) String body, HttpServletRequest request, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		Map<String, Object> map = new HashMap<String, Object>();
		//PopupSearchVO search = new PopupSearchVO();
		List<PopupVO> list = (List<PopupVO>) _gDao.selectList("popup.selectForMain", null);
		
		map.put("list", list);
		
		//logger.debug("맵 : {}", map);
		//logger.debug("맵2 : {}", new Gson().toJson(map));
		//return map;
		//return new Gson().toJson(map);
		return new Gson().toJson(list);
	}
	
	
	/**
	 * ajax - 메인 - 간편 상담 요청 처리
	 * TODO : 개발중 
	 * @param body
	 * @param idType
	 * @param id
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ajax/quickAskProc", method = RequestMethod.POST)
	@ResponseBody
	public Object ajaxQuickAskProc(@RequestBody(required = false) String body,QuickConsultVO vo, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		String msg;
		 try {
			if(vo.getRegUser() == null){
				vo.setRegUser(vo.getUserName());
				vo.setUseFlag("Y");
			}
			_quickAskService.requestClientMsg(vo);
			msg="ok";
		} catch (Exception e) {
			msg=e.getMessage();
		}
		
		
		return new Gson().toJson(msg);
	}
	
	/**
	 * ajax - 메인게시물 json 
	 * @param body
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ajax/rb.do")
	@ResponseBody
	public Object ajaxRb(@RequestBody(required = false) String body, BoardSearchVO search, BindingResult result, Model model) throws Exception {
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		if (StringUtil.isEmpty(search.getMode()))
			search.setMode("list");
		search.setMode(search.getMode().toLowerCase());
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			RecentBoardVO rbVO = (RecentBoardVO) _gDao.selectByKey("recentBoard.selectByKey", search.getRbseq());
			
			if(rbVO != null){
				//최근 게시물 가져오기
				search.setPageIndex(1);
				search.getPaging().setRecordCount(rbVO.getArticleCount());
				search.setBcode(rbVO.getBoardCode());
				search.setBcseq(rbVO.getBcSeq());
				rbVO.getBoardMasterVO().setPagerRowCount(rbVO.getArticleCount());
				List<BoardInfoVO> list = (List<BoardInfoVO>) _boardService.getList(search, rbVO.getBoardMasterVO());
				
				StringBuffer sb = new StringBuffer();
				
				String sCodingStart = rbVO.getCodingStart();
				sCodingStart = sCodingStart.replace("#{BOARD_TITLE}", rbVO.getBoardMasterVO().getBoardName());
				sCodingStart = sCodingStart.replace("#{LINK_URL}", "/board/board?menuid="+rbVO.getLinkUrl());
				sb.append(sCodingStart);
				for (BoardInfoVO bi : list) {
					String sCodingLoop = rbVO.getCodingLoop();
					
					//링크 : 링크가 빈 문자열일 경우 링크 없앰
					String sLink = "#";
					//이미지 경로
					String sUrl = "#";
					
					//썸네일은 상세가 아니라 다른 사이트로 이동
					if (bi.getBmVO().getBoardTypeFixedCode().equals("001005")) {
						sLink = bi.getLinkUrl();
	
					 }	else if (!StringUtil.isEmpty(rbVO.getLinkUrl())) {						 
						sLink = "javascript:$.Nav('go', '/board/board/" + "', {menuid: '"+ rbVO.getLinkUrl() +"',bseq: '" + bi.getBoardSeq() + "', bcseq: '" + (rbVO.getBcSeq() == 0 ? "" : rbVO.getBcSeq()) + "', rbseq: '', mode: 'view'});"; 
					 
					 }
					
					sCodingLoop = sCodingLoop.replace("#{LINK}", sLink);
					
					//썸네일이나 이미지 게시판일경우 이미지 경로 넣어줌 
					if (bi.getFileVOList().size() > 0 && (bi.getBmVO().getBoardTypeFixedCode().equals("001001") ||bi.getBmVO().getBoardTypeFixedCode().equals("001005") || bi.getBmVO().getBoardTypeFixedCode().equals("001006"))) {
						sUrl = super.getConfig().getUploadPathVirtual() + bi.getFileVOList().get(0).getSaveFilename();
						sCodingLoop = sCodingLoop.replace("#{URL}", sUrl);
					}else {
						sCodingLoop = sCodingLoop.replace("#{URL}", "/images/main/no_image.png");
					}
					
					String sSubject = String.format("<span title=\"%s\">%s</span>"
	//							, bi.getSubject()
								, StringEscapeUtils.escapeHtml(bi.getSubject())
								, bi.getSubject().length() > rbVO.getSubjectCharCount() ? bi.getSubject().substring(0, rbVO.getSubjectCharCount()) + ".." : bi.getSubject()
					);
					sCodingLoop = sCodingLoop.replace("#{SUBJECT}", sSubject);
					
					//뉴 아이콘
					String sNew = "";
					long lPeriod = StringUtil.compareTwoDate(new Date(), bi.getRegDate());
					if (lPeriod <= rbVO.getBoardMasterVO().getNewPeriod())
						sNew = "<img src=\"/images/icon/ic_new_16.png\" class=\"vc_middle\" alt=\"new\" />";
					sCodingLoop = sCodingLoop.replace("#{NEW}", sNew);
					
					//날짜
					String sDate = StringUtil.getDateToString(bi.getRegDate(), "yyyy-MM-dd HH:mm:ss");
					sDate = String.format("<span class=\"dateSns\">%s</span>", sDate);
					sCodingLoop = sCodingLoop.replace("#{DATE}", sDate);
					
					sb.append(sCodingLoop);
				}
				
				sb.append(rbVO.getCodingEnd());
				
				map.put("parsedHtml", sb.toString());
			}
		}
		catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw e;
		}
		
		return map;
	}
	
	/**
	 * ajax - 메인 & 추천 상품 json 
	 * @param body
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ajax/rp.do")
	@ResponseBody
	public Object ajaxRp(@RequestBody(required = false) String body, PrdSearchVO search, BindingResult result, Model model) throws Exception {
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		if (StringUtil.isEmpty(search.getMode()))
			search.setMode("list");
		search.setMode(search.getMode().toLowerCase());
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			RecentPrdVO rpVO = (RecentPrdVO) _gDao.selectByKey("recentPrd.selectByKey", search.getRpseq());
			
			if(rpVO != null){
			//최근 게시물 가져오기
				search.setPageIndex(1);
				search.getPaging().setRecordCount(rpVO.getPrdCount());
				//최근등록
				if (rpVO.getListType().equals("A")) {
					search.setOrderBy("REG_DATE DESC");
				//추천 상품	
				} else if (rpVO.getListType().equals("B")) {
					search.setRecommendyn("Y");
				//메인노출	
				} else if (rpVO.getListType().equals("C")) {
					search.setMainyn("Y");
				}
				
				List<PrdVO> list = (List<PrdVO>) _gDao.selectList("prd.selectList", search);
	
				StringBuffer sb = new StringBuffer();
				
				sb.append(rpVO.getCodingStart());
				
				for (PrdVO pVo : list) {
					String sCodingLoop = rpVO.getCodingLoop();
					
					//링크 : 링크가 빈 문자열일 경우 링크 없앰
					String sLink = "#";
					//이미지 경로
					String sUrl = "#";
	
					if (!StringUtil.isEmpty(rpVO.getLinkUrl())) {						 
						sLink = "javascript:$.Nav('go', '" + rpVO.getLinkUrl() + "', {prdseq: '" + pVo.getPrdSeq() + "', rpseq: '', mode: 'view'});"; 
					}
					
					sCodingLoop = sCodingLoop.replace("#{LINK}", sLink);
					
					//썸네일이나 이미지 게시판일경우 이미지 경로 넣어줌 
					if (pVo.getPrdImageVO().size() > 0) {
						sUrl = super.getConfig().getUploadPathVirtual() + pVo.getPrdImageVO().get(0).getListFilename();
						sCodingLoop = sCodingLoop.replace("#{URL}", sUrl);
					}
					
					String sSubject = String.format("<span title=\"%s\">%s</span>"
								, StringEscapeUtils.escapeHtml(pVo.getPrdName())
								, pVo.getPrdName().length() > rpVO.getSubjectCharCount() ? pVo.getPrdName().substring(0, rpVO.getSubjectCharCount()) + ".." : pVo.getPrdName()
					);
					sCodingLoop = sCodingLoop.replace("#{SUBJECT}", sSubject);
					
					String sSummary = String.format("<span title=\"%s\">%s</span>"
							, StringEscapeUtils.escapeHtml(pVo.getSummary())
							, pVo.getSummary().length() > rpVO.getSummaryCharCount() ? pVo.getSummary().substring(0, rpVO.getSummaryCharCount()) + ".." : pVo.getSummary()
							);
					sCodingLoop = sCodingLoop.replace("#{SUMMARY}", sSummary);
					
					DecimalFormat df = new DecimalFormat("#,###");
					sCodingLoop = sCodingLoop.replace("#{PRICE}", df.format(pVo.getPrice()));
					
					//뉴 아이콘
					String sNew = "";
					long lPeriod = StringUtil.compareTwoDate(new Date(), pVo.getRegDate());
					if (lPeriod <= 2)
						sNew = "<img src=\"/images/icon/ic_new_16.png\" class=\"vc_middle\" alt=\"new\" />";
					sCodingLoop = sCodingLoop.replace("#{NEW}", sNew);
					
					//날짜
					String sDate = StringUtil.getDateToString(pVo.getRegDate(), "yyyy-MM-dd");
					sDate = String.format("<span class=\"dateSns\">%s</span>", sDate);
					sCodingLoop = sCodingLoop.replace("#{DATE}", sDate);
					
					sb.append(sCodingLoop);
				}
				
				sb.append(rpVO.getCodingEnd());
				
				map.put("parsedHtml", sb.toString());
			}
		}
		catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw e;
		}
		
		return map;
	}
	
	/**
	 * ajax - 상품 카테고리 목록 
	 * 		ajax 요청 시 헤더 추가
	 *		xhr.setRequestHeader("apiId", "localhost"); 
	 *		xhr.setRequestHeader("apiKey", "42467d78ffa6777fae84b2fb0ca73452");
	 * @param body
	 * @param lastLevel
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	/*@RequestMapping(value = "/ajax/getCategory")
	@ResponseBody
	public Object ajaxGetCategory(PrdSearchVO search, @RequestParam(required = false) String id, HttpServletRequest request, HttpServletResponse response, BindingResult result, Model model) throws Exception {
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		logger.debug(">>>>>>> search : {}", new Gson().toJson(search));
		logger.debug(">>>>>>> id : {}", id);
		
		List<jsTree> list = _prdService.getCategoryListByJsTree(search);
		
		return list;
	}
	*/
	
	/**
	 * Quick Ask Request
	 * @param body
	 * @param request
	 * @param response
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ajax/term")
	@ResponseBody
	public Object ajaxGetAgree(@RequestBody(required = false) String body, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		List<CommContentsVO> vo = (List<CommContentsVO>) _gDao.selectList("policies.selectMemberRule", null);
		
	
		return new Gson().toJson(vo);
	}
	
	
	/**
	 * ajax - 아이디 중복 검사
	 * @param body
	 * @param idType
	 * @param id
	 * @param result
	 * @param model
	 * @return 중복되었을 경우 중복된 아이디 유형, 아이디 리턴
	 * @throws Exception
	 */
	@RequestMapping(value = "/ajax/checkBoardCode")
	@ResponseBody
	public Object checkBoardCode(@RequestBody(required = false) String body, BoardSearchVO search,String pwd, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("success", false);
		BoardInfoVO selfVO = (BoardInfoVO) _gDao.selectByKey("boardInfo.selectByKey", search.getBseq());
		if(pwd.equals(selfVO.getPwd())) {
			map.put("success", true);
		}
		return new Gson().toJson(map);
	}
	
}

