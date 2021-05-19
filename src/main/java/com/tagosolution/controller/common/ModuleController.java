package com.tagosolution.controller.common;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.tagoplus.model.JsonResult;
import com.tagoplus.model.common.AlertModel;
import com.tagoplus.model.common.SearchVO;
import com.tagoplus.util.Encrypt;
import com.tagoplus.util.GenType;
import com.tagoplus.util.RSAUtil;
import com.tagoplus.util.StringUtil;
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.BoardServiceImpl;
import com.tagosolution.service.impl.MemberServiceImpl;
import com.tagosolution.service.impl.PopupServiceImpl;
import com.tagosolution.service.impl.SiteMetaServiceImpl;
import com.tagosolution.service.model.BannerInfoVO;
import com.tagosolution.service.model.BannerMasterVO;
import com.tagosolution.service.model.BaseCMomeyVO;
import com.tagosolution.service.model.CommentVO;
import com.tagosolution.service.model.BoardInfoVO;
import com.tagosolution.service.model.BoardMasterVO;
import com.tagosolution.service.model.FileVO;
import com.tagosolution.service.model.FormInfoVO;
import com.tagosolution.service.model.FormVO;
import com.tagosolution.service.model.FrontMenuVO;
import com.tagosolution.service.model.MemberCMomeyVO;
import com.tagosolution.service.model.MemberCompanyVO;
import com.tagosolution.service.model.MemberInfoVO;
import com.tagosolution.service.model.MemberSettingVO;
import com.tagosolution.service.model.PageVO;
import com.tagosolution.service.model.PopupVO;
import com.tagosolution.service.model.PrdCategoryVO;
import com.tagosolution.service.model.PrdImageVO;
import com.tagosolution.service.model.PrdVO;
import com.tagosolution.service.model.SiteApiVO;
import com.tagosolution.service.model.SiteMetaVO;
import com.tagosolution.service.model.SiteVO;
import com.tagosolution.service.model.search.BannerSearchVO;
import com.tagosolution.service.model.search.BoardSearchVO;
import com.tagosolution.service.model.search.FormmailSearchVO;
import com.tagosolution.service.model.search.MemberSearchVO;
import com.tagosolution.service.model.search.MenuSettingSearchVO;
import com.tagosolution.service.model.search.PageSearchVO;
import com.tagosolution.service.model.search.PrdSearchVO;

/**
 * 모듈 컨트롤러
 * @author kky
 *
 */
@Controller
@RequestMapping(value = "/module")
public class ModuleController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(ModuleController.class);
	
	@Autowired
	GeneralDAOImpl _gDao;
	
	@Autowired
	BoardServiceImpl _boardService;
	
	@Autowired
	PopupServiceImpl _popupService;
	
	@Autowired
	MemberServiceImpl _memberService;
	
	@Autowired
	SiteMetaServiceImpl _siteMetaService;
	
	public static final String BANNER_MASTER_CODE_MAIN = "mainBanner";
	
	/**
	 * 페이지 권한 체크 모듈
	 * @param level : 접근 가능 레벨
	 * @param msg : 권한 없을 경우 메시지
	 * @param ru : 권한 없을 경우 리턴 url
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/check_auth")
	public String checkAuth(String level, String msg, String ru, Model model) throws Exception {
		
		if (StringUtil.isEmpty(msg))
			msg = super.getMessage("common.noAuth.default");
		
		if (StringUtil.isEmpty(ru))
			ru = super.getMessage("common.noAuth.redirect");
		
		AlertModel am = new AlertModel();
		
		if (StringUtil.isEmpty(level)) {
			am.setMessage("페이지 접근권한 모듈의 level 파라미터가 설정되지 않았습니다.\\n메인 페이지로 이동합니다.");
			am.setHref("/");
			model.addAttribute("alert", am);
		}
		else {
			short lvl = Short.parseShort(level); 
			MemberInfoVO mvo = super.getUserSession();
			
			if (mvo == null) {
				if (lvl > 0) {
					am.setMessage(msg);
					am.setHref(ru);
					model.addAttribute("alert", am);
				}
			}
			else {
				if (mvo.getGradeLevel() > lvl) {
					am.setMessage(msg);
					am.setHref(ru);
					model.addAttribute("alert", am);
				}
			}
		}
		
		return "/front/module/check_auth";
	}
	
	/**
	 * 팝업 모듈 UI
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/popup")
	public String getPopup(Model model) throws Exception {
		return "/front/module/popup";
	}
	
	/**
	 * 배너 모듈 UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/banner")
	public String getBanner(BannerSearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		BannerMasterVO bm = (BannerMasterVO) _gDao.selectByKey("bannerMaster.selectByKey", search.getBseq());
		search.setTableName("banner");
		search.setOrderBy("ORDERING");
		List<BannerInfoVO> list = (List<BannerInfoVO>) _gDao.selectBySearch("bannerInfo.selectList", search, "totalCount");
		
		
		model.addAttribute("list", list);
		model.addAttribute("bm", bm);
		model.addAttribute("search", search);
		
		if(StringUtils.equals(bm.getMasterCode(), BANNER_MASTER_CODE_MAIN) ) {
			return "/front/module/mainbanner";
		}
		return "/front/module/banner";
	}
	
	/**
	 * 페이지 모듈 UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/page")
	public String getPage(PageSearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		PageVO vo = (PageVO) _gDao.selectByKey("page.selectByKey", search.getPseq());
		
		model.addAttribute("vo", vo);
		model.addAttribute("search", search);
		
		return "/front/module/page";
	}
	
	/**
	 * 폼메일 모듈 UI
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/form")
	public String form(FormmailSearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		List<FormInfoVO> list = (List<FormInfoVO>) _gDao.selectList("formInfo.selectByForm", search.getFseq());
		FormVO vo = (FormVO) _gDao.selectByKey("form.selectByKey", search.getFseq());
		
		if (!list.isEmpty()) {
			for (FormInfoVO f : list) {
				List<String> listString = new ArrayList<String>();
				String[] sArr = f.getDetailName().split("\\¤", f.getDetailCount());
				for (String s : sArr)
					listString.add(s);
				f.setDetailNameArray(listString);
			}
		}
		//logger.debug("리스트 : {}", new Gson().toJson(list));
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		
		return "/front/module/form";
	}
	/**
	 * 메뉴
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/menu")
	public String menu(MenuSettingSearchVO search, BindingResult result, Model model) throws Exception {
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		search.setMenuLevel((short) 1);
		List<FrontMenuVO> list = (List<FrontMenuVO>) _gDao.selectList("frontMenu.selectList", search);
		search.setMenuLevel((short) 2);
		List<FrontMenuVO> childList = (List<FrontMenuVO>) _gDao.selectList("frontMenu.selectList", search);
		if (!list.isEmpty()) {
			for (FrontMenuVO menu : list) {
				Boolean hasChild = false;
				int childCount = (int) _gDao.selectByKey("frontMenu.selectChildren", menu.getMenuIdx());
				if(childCount > 0) {
					hasChild = true;					
				}
				menu.setHasChild(hasChild);
			}
		}
		model.addAttribute("list", list);
		model.addAttribute("childList", childList);
		model.addAttribute("search", search);
		
		return "/front/module/menu";
	}
	/**
	 * 메뉴
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/submenu")
	public String submenu(MenuSettingSearchVO search, BindingResult result, Model model) throws Exception {
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		FrontMenuVO vo = (FrontMenuVO) _gDao.selectByKey("frontMenu.selectByKey", search.getMenuIdx());
		FrontMenuVO parent = (FrontMenuVO) _gDao.selectByKey("frontMenu.selectByKey", vo.getParentIdx());
		MenuSettingSearchVO search2 = new MenuSettingSearchVO();
		search2.setParentIdx(vo.getParentIdx());
		if(StringUtils.isEmpty(vo.getParentIdx())) {
			search2.setMenuLevel((short) 1);
		}else {
			search2.setMenuLevel((short) 2);
		}
		List<FrontMenuVO> list = (List<FrontMenuVO>) _gDao.selectList("frontMenu.selectList", search2);
		model.addAttribute("list",list);
		model.addAttribute("vo",vo);
		model.addAttribute("parent",parent);
		return "/front/module/submenu";
	}

	/**
	 * 게시판 모듈 - 레이아웃
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/board")
	public String board(BoardSearchVO search, BindingResult result, Model model) throws Exception {
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		if (StringUtil.isEmpty(search.getMode()))
			search.setMode("list");
		search.setMode(search.getMode().toLowerCase());
		
		model.addAttribute("search", search);
		
		return "/front/module/board";
	}
	
	/**
	 * 게시판 모듈 - 리스트
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/bbs/list")
	public String bbsList(BoardSearchVO search, BindingResult result, Model model) throws Exception {
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		if (StringUtil.isEmpty(search.getMode()))
			search.setMode("list");
		search.setMode(search.getMode().toLowerCase());
		
	
		BoardMasterVO bm = (BoardMasterVO) _gDao.selectByKey("boardMaster.selectByKey", search.getBcode());
		//set active tab to first if exist
//		int size = bm.getBoardCategoryVO().size();
//		if(size>0 && search.getBcseq() == 0) {
//			search.setBcseq(bm.getBoardCategoryVO().get(0).getBcSeq());
//		}
		if(bm != null){
			//게시판 사용 여부
			if (bm.getUseYn().equals("N")) {
				AlertModel am = new AlertModel();
				am.setMessage("사용 되지 않는 게시판 입니다.");
				am.setScript("location.href= history.back();");
				model.addAttribute("alert", am);
				return super.getConfig().getViewAlert();
			}
					
			List<BoardInfoVO> list = (List<BoardInfoVO>) _boardService.getList(search, bm);
					
			//필터링
			if (bm.getFilteringYn().equals("Y") && list != null) {
				String[] filters = bm.getFilter().split(",");
				for (BoardInfoVO bVo : list) {
					for (String sFilter : filters) {
						bVo.setSubject(bVo.getSubject().replaceAll(sFilter, "*"));
					}
				}
			}		
			if (!list.isEmpty()) {
				for (BoardInfoVO bVo : list) {
					Boolean sNew = false;
					Boolean isHot = false;
					long lPeriod = StringUtil.compareTwoDate(new Date(), bVo.getRegDate());
					if (lPeriod <= bm.getNewPeriod())
						sNew = true;
					if(bVo.getReadCount() > bm.getHotCount())
						isHot = true;
					bVo.setIsNew(sNew);
					bVo.setIsHot(isHot);
					if(!StringUtil.isEmpty(bVo.getBody())) {
						String body = bVo.getBody().replaceAll("\\<[^>]*>","");
						bVo.setBody(body);						
					}
					Object cnt = _gDao.selectByKey("admin.selectByKey",bVo.getRegUser());
					if(super.getSiteSession().getSuId().equals(bVo.getRegUser()) || cnt != null) {
						bVo.setRegUserIsAdmin(true);
					}else {
						bVo.setRegUserIsAdmin(false);						
					}
				}
			}
			model.addAttribute("bm", bm);
			model.addAttribute("list", list);
			model.addAttribute("listBCs", bm.getBoardCategoryVO());
			model.addAttribute("search", search);
					
			//권한 체크 0:전체
			if (bm.getAuthList() == 0 || (super.getUserSession() != null && bm.getAuthList() >= super.getUserSession().getGradeLevel())) {
				if(bm.getCssPrefix().equals("default") || StringUtils.isEmpty(bm.getCssPrefix())) {
					return "/front/module/bbs/list";
				}
				return "/front/module/bbs/custom_list";
			
			} else {
				AlertModel am = new AlertModel();
				am.setMessage(bm.getNoAuthMsg());
					
				if (bm.getNoAuthRedirect() == null || "".equals(bm.getNoAuthRedirect())) {
					am.setScript("location.href= history.back();");
					
				} else {				
					am.setScript("location.href= '" + bm.getNoAuthRedirect() + "';");
				}
				
				model.addAttribute("alert", am);
				return super.getConfig().getViewAlert();
			}	
		}else{
			model.addAttribute("pageBody", "사용 되지 않는 게시판 입니다.");
		}
		return "/front/module/message";
	}
	
	/**
	 * 게시판 모듈 - 상세보기
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/bbs/view")
	public String bbsView(BoardSearchVO search, BindingResult result, Model model) throws Exception {
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		BoardMasterVO bm = (BoardMasterVO) _gDao.selectByKey("boardMaster.selectByKey", search.getBcode());
		
		//게시판 사용 여부
		if (bm.getUseYn().equals("N")) {
			AlertModel am = new AlertModel();
			am.setMessage("사용 되지 않는 게시판 입니다.");
			am.setScript("location.href= history.back();");
			model.addAttribute("alert", am);
			return super.getConfig().getViewAlert();
		}
		
		
		BoardInfoVO vo = (BoardInfoVO) _boardService.getDetail(search, true);
		Object cnt = _gDao.selectByKey("admin.selectByKey",vo.getRegUser());
		if(super.getSiteSession().getSuId().equals(vo.getRegUser()) || cnt != null) {
			vo.setRegUserIsAdmin(true);
		}else {
			vo.setRegUserIsAdmin(false);						
		}

		if (bm.getShowListYn().equals("Y")) {
			List<BoardInfoVO> list = (List<BoardInfoVO>) _boardService.getList(search, bm);			
			model.addAttribute("list", list);
			model.addAttribute("listBCs", bm.getBoardCategoryVO());
		}
		
		//필터링
		if (bm.getFilteringYn().equals("Y") && vo != null) {
			String[] filters = bm.getFilter().split(",");
			for (String sFilter : filters) {
				vo.setBody(vo.getBody().replaceAll(sFilter, "*"));
				vo.setSubject(vo.getSubject().replaceAll(sFilter, "*"));
				if (vo.getAnswer() != null)
					vo.setAnswer(vo.getAnswer().replaceAll(sFilter, "*"));
			}
		}
		
		if(bm.getCommentYn().equals("Y")){
			List<CommentVO> clist = (List<CommentVO>)_boardService.getCommentList(search);
			if(!bm.getFilter().isEmpty()){
				String[] filters = bm.getFilter().split(",");
				for(CommentVO c : clist){
					for(String sFilter : filters){
						c.setBody(c.getBody().replaceAll(sFilter, "*"));
					}
				}
			}
			model.addAttribute("clist", clist);
		}
		
		model.addAttribute("bm", bm);
		model.addAttribute("vo", vo);
		model.addAttribute("listBCs", bm.getBoardCategoryVO());
		model.addAttribute("search", search);

		//권한 체크 0:전체
		if (bm.getAuthView() == 0 || (super.getUserSession() != null && bm.getAuthView() >= super.getUserSession().getGradeLevel())) {
			return "/front/module/bbs/view";
		
		} else {
			AlertModel am = new AlertModel();
			am.setMessage(bm.getNoAuthMsg());
				
			if (bm.getNoAuthRedirect() == null || "".equals(bm.getNoAuthRedirect())) {
				am.setScript("location.href= history.back();");
				
			} else {				
				am.setScript("location.href= '" + bm.getNoAuthRedirect() + "';");
			}
			
			model.addAttribute("alert", am);
			return super.getConfig().getViewAlert();
		}
	}

	/**
	 * 게시판 모듈 - 등록/수정
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/bbs/write")
	public String bbsWrite(BoardSearchVO search, BindingResult result, Model model) throws Exception {
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
	
		BoardMasterVO bm = (BoardMasterVO) _gDao.selectByKey("boardMaster.selectByKey", search.getBcode());
		
		//게시판 사용 여부
		if (bm.getUseYn().equals("N")) {
			AlertModel am = new AlertModel();
			am.setMessage("사용 되지 않는 게시판 입니다.");
			am.setScript("location.href= history.back();");
			model.addAttribute("alert", am);
			return super.getConfig().getViewAlert();
		}
		
		BoardInfoVO vo = (BoardInfoVO) _boardService.getDetail(search, false);
		
		model.addAttribute("bm", bm);
		model.addAttribute("vo", vo);
		model.addAttribute("listBCs", bm.getBoardCategoryVO());
		model.addAttribute("search", search);
			
		//권한 체크 0:전체
		if (bm.getAuthWrite() == 0 || (super.getUserSession() != null && bm.getAuthWrite() >= super.getUserSession().getGradeLevel())) {
			return "/front/module/bbs/write";
		
		} else {
			AlertModel am = new AlertModel();
			am.setMessage(bm.getNoAuthMsg());
			am.setScript("location.href= history.back();");
			model.addAttribute("alert", am);
			return super.getConfig().getViewAlert();
		}
	}

	/**
	 * 게시판 모듈 - 등록/수정 - 처리
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/bbs/proc")
	public String bbsProc(BoardSearchVO search, BoardInfoVO vo, BindingResult result, Model model, HttpServletRequest request) throws Exception {

		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();

		try {
			
			//답변 등록
			if (search.getStatus().equals("a")) {
				_boardService.updateBoardAnswer(vo);
				
			//삭제 처리 use_yn = n 처리	
			} else if (search.getStatus().equals("d")) {
				_boardService.delete(search);
				
			} else {
				vo.setBoardCode(search.getBcode());
				vo.setBoardSeq(search.getBseq());
				vo.setIpAddr(request.getRemoteAddr());
				/*
				 * vo.setUserName(super.getUserSession().getUserName());
				 * vo.setNickname(super.getUserSession().getNickname());
				 * vo.setRegUser(super.getUserSession().getUserId());
				 */
				
				_boardService.insert(search, vo);
			}
			
			am.setMessage("저장 되었습니다.");
		
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage("처리중 오류가 발생하였습니다. \\n" + e.getMessage());
		}
		
		String sReferer = request.getHeader("referer");
		
		int iIndexOf = 0;
		for (int i = 0; i < 3; i++) {
			iIndexOf = sReferer.indexOf("/", iIndexOf + 1);
		}
		
		String sRefererJsp = ((sReferer.indexOf("?") > -1) ? sReferer.substring(iIndexOf, sReferer.indexOf("?")) : sReferer.substring(iIndexOf));
		String menuid = request.getParameter("menuid");
		if (search.getStatus().equals("d")) {
			am.setScript("location.href = '" + sRefererJsp + "?mode=list';");
		} else {
			am.setScript("location.href = '" + sRefererJsp + "?menuid="+menuid+"&bseq=" + vo.getBoardSeq() + "&mode=view';");
		}
		
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * 게시판 모듈 - 등록/수정 - 처리
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/comment/sublist")
	public String commentTreeList(BoardSearchVO search, BindingResult result, Model model) throws Exception {
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		BoardMasterVO bm = (BoardMasterVO) _gDao.selectByKey("boardMaster.selectByKey", search.getBcode());
		
		List<CommentVO> clist = (List<CommentVO>)_gDao.selectBySearch("boardComment.selectPeriod", search);
		
		if(bm.getCommentYn().equals("Y") && !bm.getFilter().isEmpty()){
			String[] filters = bm.getFilter().split(",");
			for(CommentVO c : clist){
				for(String sFilter : filters){
					c.setBody(c.getBody().replaceAll(sFilter, "*"));
				}
			}
		}
		
		model.addAttribute("bm", bm);
		model.addAttribute("search", search);
		model.addAttribute("list", clist);
		//권한 체크 0:전체
		return "/front/module/bbs/tree";
		
	}
	
	@RequestMapping(value = "/comment/subtest")
	@ResponseBody
	public String commenttest(@RequestBody(required = false)String body, Long bseq,String bcode,BoardSearchVO search, BindingResult result, Model model) throws Exception {
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", false);
		try {
			BoardMasterVO bm = (BoardMasterVO) _gDao.selectByKey("boardMaster.selectByKey", bcode);
			search.setBseq(bseq);
			List<CommentVO> clist = (List<CommentVO>)_gDao.selectBySearch("boardComment.selectPeriod", search);
			
			if(bm.getCommentYn().equals("Y") && !bm.getFilter().isEmpty()){
				String[] filters = bm.getFilter().split(",");
				for(CommentVO c : clist){
					for(String sFilter : filters){
						c.setBody(c.getBody().replaceAll(sFilter, "*"));
					}
				}
			}
			map.put("success", true);
			map.put("bm", bm);
			map.put("list", clist);
		}catch (Exception e) {
			logger.error(e.getMessage(), e);
			map.put("message", e.getMessage());
		}
		
		//권한 체크 0:전체
		return new Gson().toJson(map);
		
	}
	
	@RequestMapping(value = "/comment/proc.do")
	@ResponseBody
	public Object ajaxCheckId(@RequestBody(required = false) String body,BoardSearchVO search, CommentVO vo, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		Map<String, Object> map = new HashMap<String, Object>();
		BoardMasterVO bm = (BoardMasterVO) _gDao.selectByKey("boardMaster.selectByKey", search.getBcode());
		try {
			if (search.getStatus().equals("d")) {
				Integer affectedCnt = _gDao.delete("boardComment.delete", vo);
				map.put("result", affectedCnt);
			} else {
				if(!search.getStatus().equals("u")){
					search.setMaxLevel(search.getMaxLevel() + 1);
					if(super.getSiteSession().getPointYn().equals("Y") && (bm.getPointComment() > 0  && search.getMaxLevel() <= bm.getCommentLevel() && (bm.getAuthComment().equals((short) 0) || bm.getAuthComment() >= super.getUserSession().getGradeLevel()))){
						MemberCMomeyVO cmomey = new MemberCMomeyVO();
						BaseCMomeyVO cmoney = (BaseCMomeyVO) _gDao.selectByKey("baseCMomey.selectByKey", super.getSiteSession().getSiteSeq());
						cmomey.setcMoney(cmoney.getCommentCMomey());
						cmomey.setUserId(super.getUserSession().getUserID());
						cmomey.setSummary("COMMENT");
						cmomey.setOrderUid(0);
						_gDao.insert("memberCmomey.merge", cmomey);
					}
				}
				if(search.getMaxLevel() <= bm.getCommentLevel() && (bm.getAuthComment().equals((short) 0) || bm.getAuthComment() >= super.getUserSession().getGradeLevel())){
					vo.setIpAddr(request.getRemoteAddr());
					vo.setUserName(super.getUserSession().getUserName());
					vo.setNickName(super.getUserSession().getNickname());
					vo.setRegUser(super.getUserSession().getUserId());
					vo.setDisplayYn("Y");
					_gDao.insert("boardComment.merge", vo);
					
					CommentVO voc = (CommentVO) _gDao.selectByKey("boardComment.selectByKey", vo.getCommentSeq());
					map.put("result", voc);
				} else 
					map.put("message", "Sorry, Max comment level count exceeded!");
			}
			
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		
			
		map.put("maxLevel", search.getMaxLevel());
		//{"result":{"userType":"designer","userID":"","userName":"디자이너"}}
		// 주의 : map 변수를 그대로 리턴해도 가능하지만, null 상태의 멤버 변수까지 모두 출력된다.
		//return map;
		return new Gson().toJson(map);
	}
	
	@RequestMapping(value = "/comment/save.do", method = RequestMethod.POST)
	@ResponseBody
	public Object ajaxCommProc(@RequestBody(required = false) String body,BoardSearchVO search, CommentVO vo, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		if(vo == null || vo.getBoardCode() == null){
			vo = new Gson().fromJson(body, CommentVO.class);
		}
		CommentVO parent = new CommentVO();
		if(vo.getParentSeq() != 0) {
			parent = (CommentVO) _gDao.selectByKey("boardComment.selectByKey", vo.getParentSeq());	
			search.setMaxLevel(parent.gethDepth()+1);
			vo.sethDepth(parent.gethDepth()+1);
		}else {
			search.setMaxLevel(1);
			vo.sethDepth(1);
		}
		
		if(vo.getCommentSeq() != null && super.getUserSession().getUserId().equals(vo.getRegUser())) {
			search.setStatus("u");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		BoardMasterVO bm = (BoardMasterVO) _gDao.selectByKey("boardMaster.selectByKey", vo.getBoardCode());
		try {
			if(!search.getStatus().equals("u")) {
				if(super.getSiteSession().getPointYn().equals("Y") && (bm.getPointComment() > 0  && search.getMaxLevel() <= bm.getCommentLevel() && (bm.getAuthComment().equals((short) 0) || bm.getAuthComment() >= super.getUserSession().getGradeLevel()))){
					MemberCMomeyVO cmomey = new MemberCMomeyVO();
					BaseCMomeyVO cmoney = (BaseCMomeyVO) _gDao.selectByKey("baseCMomey.selectByKey", super.getSiteSession().getSiteSeq());
					cmomey.setcMoney(cmoney.getCommentCMomey());
					cmomey.setUserId(super.getUserSession().getUserID());
					cmomey.setSummary("COMMENT");
					cmomey.setOrderUid(0);
					_gDao.insert("memberCmomey.merge", cmomey);
				}
				
			}
			if(search.getMaxLevel() <= bm.getCommentLevel() && (bm.getAuthComment().equals((short) 0) || bm.getAuthComment() >= super.getUserSession().getGradeLevel())){
				vo.setIpAddr(request.getRemoteAddr());
				vo.setUserName(super.getUserSession().getUserName());
				vo.setNickName(super.getUserSession().getNickname());
				vo.setRegUser(super.getUserSession().getUserId());
				vo.setDisplayYn("Y");
				int affectedRow = _gDao.insert("boardComment.merge", vo);
				CommentVO voc = (CommentVO) _gDao.selectByKey("boardComment.selectByKey", vo.getCommentSeq());
				if(affectedRow == 1) {
					map.put("message", super.getMessage("success.insert"));
				}else if(affectedRow == 2) {
					map.put("message", super.getMessage("success.update"));
				}
				map.put("result", voc);
				map.put("success", true);
			} else {
				map.put("message", "Sorry, Max comment level count exceeded!");		
				map.put("success", false);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		
	
		//{"result":{"userType":"designer","userID":"","userName":"디자이너"}}
		// 주의 : map 변수를 그대로 리턴해도 가능하지만, null 상태의 멤버 변수까지 모두 출력된다.
		//return map;
		return new Gson().toJson(map);
	}
	@RequestMapping(value = "/comment/delete.do", method = RequestMethod.POST)
	@ResponseBody
	public Object ajaxCommDelete(@RequestBody(required = false) String body,Long commentSeq ,BoardSearchVO search, CommentVO vo, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", false);
		if(super.getUserSession() == null) {
			map.put("message",super.getMessage("common.need.login"));
			return new Gson().toJson(map);
		}
		
		
		try {
			CommentVO voc = (CommentVO) _gDao.selectByKey("boardComment.selectByKey", commentSeq);
			if(super.getUserSession().getUserId().equals(voc.getRegUser())) {
				Integer affectedCnt = _gDao.delete("boardComment.delete", voc);
				map.put("success", true);
				map.put("result", voc.getCommentSeq());
				map.put("message", super.getMessage("success.delete"));
			}else {
				map.put("message",super.getMessage("common.noAuth.default"));
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			map.put("message",e.getMessage());
		}
		
		return new Gson().toJson(map);
	}

	/**
	 * 제품 모듈 - 레이아웃
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/product")
	public String product(PrdSearchVO search, BindingResult result, Model model) throws Exception {

		if (result.hasErrors())
			return super.setBindingResult(result, model);

		if (StringUtil.isEmpty(search.getMode()))
			search.setMode("list");
		search.setMode(search.getMode().toLowerCase());

		model.addAttribute("search", search);

		return "/front/module/product";
	}

	/**
	 * 상품 모듈 - 리스트
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/prd/list")
	public String prdList(PrdSearchVO search, PrdVO vo, BindingResult result, Model model) throws Exception {
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		search.setCateIdx(vo.getCategory1());
		search.setRecordCount(12);
		search.setOrderBy("ORDERING");
		List<PrdVO> list = (List<PrdVO>) _gDao.selectBySearch("prd.selectList", search);
		int iCount = (int) _gDao.selectByKey("prd.selectTotalCount", search);

		model.addAttribute("category", vo.getCategory1());
		model.addAttribute("count", iCount);
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		return "/front/module/prd/list";
	}

	/**
	 * 상품 모듈 - 상세보기
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/prd/view")
	public String prdView(PrdSearchVO search, BindingResult result, Model model) throws Exception {
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);

		PrdVO vo = (PrdVO) _gDao.selectByKey("prd.selectByKey", search.getPrdseq());

		search.setTableName("TS_PRD");
		search.setRefSeq(String.valueOf(search.getPrdseq()));
		List<FileVO> fileList = (List<FileVO>) _gDao.selectList("file.selectByRefSeq", search);

		model.addAttribute("category", vo.getCategory1());
		model.addAttribute("fileList", fileList);
		model.addAttribute("vo", vo);
		model.addAttribute("search",search);
		return "/front/module/prd/view";
	}

	 /**
	  * 상품 모듈 - 상세보기 - 메인이미지 변경 
	  * @param body
	  * @param search
	  * @param result
	  * @param model
	  * @return
	  * @throws Exception
	  */
	@RequestMapping(value = "/prd/ajax_img_change")
	@ResponseBody
	public Object ajaxImgChange(@RequestBody(required = false) String body, PrdSearchVO search, BindingResult result, Model model) throws Exception {

		if (result.hasErrors())
			return super.setBindingResult(result, model);

		PrdImageVO imgVo = new PrdImageVO();
		if (search.getPrdimgseq() > 0) {
			imgVo = (PrdImageVO) _gDao.selectByKey("prdImage.selectByKey", search.getPrdimgseq());
		}

		return new Gson().toJson(imgVo.getLargeFilename());
	}
	
	/**
	 * 메인게시물 모듈 - 레이아웃
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/rb")
	public String rb(BoardSearchVO search, BindingResult result, Model model) throws Exception {
		
		if (StringUtil.isEmpty(search.getMode()))
			search.setMode("list");
		search.setMode(search.getMode().toLowerCase());
		
		model.addAttribute("search", search);
		
		return "/front/module/rb";
	}
	
	/**
	 * 메인 & 추천 상품 모듈 - 레이아웃
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/rp")
	public String rp(PrdSearchVO search, BindingResult result, Model model) throws Exception {
		
		if (StringUtil.isEmpty(search.getMode()))
			search.setMode("list");
		search.setMode(search.getMode().toLowerCase());
		
		model.addAttribute("search", search);
		
		return "/front/module/rp";
	}
	
	/**
	 *	레프트 메뉴 모듈 - 레이아웃
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/lnb_prd")
	public String lnb(PrdSearchVO search, String category1, BindingResult result, Model model) throws Exception {
		
		if (StringUtil.isEmpty(search.getMode()))
			search.setMode("list");
		
		String local = search.getCateIdx();

		List<PrdVO> list = (List<PrdVO>) _gDao.selectList("prd.selectByCateCode", search.getCateIdx()); 
		String categoryName = "";
		String categoryCode = "";

		if (list.size() > 0) {
			categoryName = list.get(0).getCategoryName();
			categoryCode = list.get(0).getCategory1();

		} else {
			PrdCategoryVO vo = (PrdCategoryVO) _gDao.selectOne("prdCategory.selectByKey", search.getCateIdx());
			if(vo != null){
				categoryName = vo.getCateName();
				categoryCode = vo.getCateIdx();
			}
			
		}
		
		if (category1 == null) {
			PrdVO vo = (PrdVO) _gDao.selectByKey("prd.selectByKey", search.getPrdseq());
			category1 = (vo.getCategory1());
		}
		
		model.addAttribute("categoryName", categoryName);
		model.addAttribute("category", category1);
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		return "/front/module/lnb_prd";
	}

	
	/**
	 * 팝업창 오픈
	 * @param vo
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/open_popup.do")
	public String openPopup(PopupVO vo, BindingResult result, Model model) throws Exception {
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);

		PopupVO pVo = (PopupVO) _gDao.selectOne("popup.selectByKey", vo.getPopupSeq());
		
		model.addAttribute("pVo", pVo);
		return "/front/popup/popup";		
	}
	
	
	/**
	 * SNS SHARE
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/sns_share")
	public String getSnsShare(SearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		Byte bt = 1;
		SiteApiVO set = (SiteApiVO) _gDao.selectByKey("siteApi.selectByKey", (super.getSiteSession() != null) ? super.getSiteSession().getSiteSeq() : bt);
		
		model.addAttribute("set", set);
		model.addAttribute("search", search);
		
		return "/front/module/sns_share";
		
	}
	
	/**
	 * GOOGLE ANALYCIS ACCESS CONNECT
	 * @param 
	 * @param 
	 * @param 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/connect")
	public String googleAnalyticsConnect(SearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		Byte bt = 1;
		SiteApiVO vo = (SiteApiVO) _gDao.selectByKey("siteApi.selectByKey", (super.getSiteSession() != null) ? super.getSiteSession().getSiteSeq() : bt);
		
		model.addAttribute("vo", vo);
		model.addAttribute("search", search);
		
		return "/front/module/connect";
		
	}
	
	/**
	 * SNS SHARE
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/findidpw")
	public String getFindUserId(SearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
//		SiteApiVO set = (SiteApiVO) _gDao.selectByKey("siteApi.selectByKey", (super.getSiteSession() != null) ? super.getSiteSession().getSiteSeq().intValue() : 1);
//		
//		model.addAttribute("set", set);
		model.addAttribute("search", search);
		
		return "/front/module/findidpw";
		
	}
	
	/**
	 * Find By User name and Email
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/findid_proc")
	public String pwdChangeProc (MemberSearchVO search, MemberInfoVO vo, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
				
		try {
			MemberInfoVO mVo = (MemberInfoVO) _gDao.selectByKey("memberInfo.selectByForgotId", search);
			if(mVo != null){
				switch(search.getStatus()){
					case "id":
						search.setEmails(mVo.getEmail());
						search.setSubject("Forgot ID");
						search.setBody("This is your ID: " + mVo.getUserId());
						break;
					case "pass":
						String newpassword = StringUtil.getRandomValue(GenType.LowerCaseAndNumber, 10);
						search.setEmails(mVo.getEmail());
						mVo.setPassword(Encrypt.SHA256Hash(newpassword));
						_gDao.insert("memberInfo.updateByKeySelective", mVo);
						search.setSubject("Forgot Password");
						search.setBody("<p>This is your ID: " + mVo.getUserId() + "</p><br/><p>This is your new password: " + newpassword +"</p>");
						break;
					default:
						break;
				}
				_memberService.sendTestMailer(search);
				am.setMessage("메일 발송 완료.");
			}else
				am.setMessage("사용자를 찾을 수 없음.");
			
		} catch (Exception e) {
			logger.debug(e.getMessage(), e);
			am.setMessage("처리중 오류가 발생하였습니다. \\n" + e.getMessage());
		}
		
		String sReferer = request.getHeader("referer");
		am.setScript("location.href = '" + sReferer + "'");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	@RequestMapping(value="/join")
	public String getJoinPage(MemberSearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		/*if(!search.getIsAgreed()){
			return "/front/module/agree";
		}*/
		
		MemberInfoVO vo = (MemberInfoVO) _gDao.selectByKey("memberInfo.selectById", search.getId());
		Byte bt = 1;
		MemberSettingVO configVO = (MemberSettingVO) _gDao.selectByKey("memberSetting.selectByKey", (super.getSiteSession() != null ) ? super.getSiteSession().getSiteSeq() : bt);	
		
		model.addAttribute("vo", vo);
		model.addAttribute("configVO", configVO);
		model.addAttribute("search", search);
		return "/front/module/join";
		
	}
	
	@RequestMapping(value="/agree")
	public String getAgreePage(MemberSearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		return "/front/module/agree";
		
	}
	
	@RequestMapping(value="/login")
	public String getLoginPage(SiteVO site, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		try {
			RSAUtil rsa = new RSAUtil();
			rsa.generateRSA(request, model, "_RSA_PK");
			MemberSettingVO set = (MemberSettingVO) _gDao.selectOne("memberSetting.selectBySns",  super.getSiteSession().getSiteSeq());
			model.addAttribute("set", set);
		}
		catch (Exception e) {
			AlertModel am = new AlertModel(e.getMessage(), super.getConfig().getFrontLoginURL(), null);
			model.addAttribute("alert", am);
			return super.getConfig().getViewAlert();
		}
		return "/front/module/login";
		
	}
	
	@RequestMapping(value="/findid")
	public String getFindId(SearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		model.addAttribute("search", search);
		
		return "/front/module/findid";
		
	}
	
	@RequestMapping(value="/findpw")
	public String getFindPw(SearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		model.addAttribute("search", search);
		
		return "/front/module/findpw";
		
	}
	
	@RequestMapping(value="/member_edit")
	public String getMemberEditPage(MemberSearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		search.setId(super.getUserSession().getUserId());
		MemberInfoVO vo = (MemberInfoVO) _gDao.selectByKey("memberInfo.selectById", search.getId());
		MemberCompanyVO voc = (MemberCompanyVO) _gDao.selectByKey("memberCompany.selectById", search.getId());	
		Byte bt = 1;
		MemberSettingVO configVO = (MemberSettingVO) _gDao.selectByKey("memberSetting.selectByKey", (super.getSiteSession() != null ) ? super.getSiteSession().getSiteSeq() : bt);	
		
		model.addAttribute("vo", vo);
		model.addAttribute("voc", voc);
		model.addAttribute("configVO", configVO);
		model.addAttribute("search", search);
		return "/front/module/member_edit";
		
	}
	
	@RequestMapping(value="/withdrawal")
	public String getWidthDrawal(SearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		model.addAttribute("search", search);
		
		return "/front/module/withdrawal";
		
	}
	
	@RequestMapping(value="/loginbox")
	public String getLoginBox(SearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		model.addAttribute("search", search);
		
		return "/front/module/loginbox";
		
	}
	
	@RequestMapping(value="/toplogin")
	public String getTopLogin(SearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		MemberSettingVO setting = (MemberSettingVO) _gDao.selectOne("memberSetting.selectForImages", (super.getSiteSession() != null) ? super.getSiteSession().getSiteSeq() : 1);
		
		MemberSettingVO setting1 = (MemberSettingVO) _gDao.selectOne("memberSetting.selectByUrls", (super.getSiteSession() != null) ? super.getSiteSession().getSiteSeq() : 1);
		
		model.addAttribute("search", search);
		model.addAttribute("setting", setting);
		model.addAttribute("setting1", setting1);
		return "/front/module/toplogin";
		
	}
	
	@RequestMapping(value="/topjoin")
	public String getTopJoin(SearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		MemberSettingVO setting = (MemberSettingVO) _gDao.selectOne("memberSetting.selectForImages", (super.getSiteSession() != null) ? super.getSiteSession().getSiteSeq() : 1);
		
		MemberSettingVO setting1 = (MemberSettingVO) _gDao.selectOne("memberSetting.selectByUrls", (super.getSiteSession() != null) ? super.getSiteSession().getSiteSeq() : 1);
		
		model.addAttribute("search", search);
		model.addAttribute("setting", setting);
		model.addAttribute("setting1", setting1);
		return "/front/module/topjoin";
		
	}
	
	/**
	 * module - site meta 
	 * @param search
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/siteMeta")
	public String getSiteMeta(SearchVO search, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		//logger.debug(">>>>>>>>>>>>> javax.servlet.forward.request_uri : {}", request.getAttribute("javax.servlet.forward.request_uri"));
		
		//for action url
		String sPathInfo = StringUtil.getString(request.getAttribute("javax.servlet.forward.request_uri"));
		
		//for servlet page
		if (StringUtil.isEmpty(sPathInfo))
			sPathInfo = request.getRequestURI();
		
		SiteMetaVO vo = _siteMetaService.getDetail(sPathInfo);
		model.addAttribute("vo", vo);
		
		return "/front/module/sitemeta";
	}
}
