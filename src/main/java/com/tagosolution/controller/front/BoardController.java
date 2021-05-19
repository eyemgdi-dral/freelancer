package com.tagosolution.controller.front;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.tagoplus.model.common.SearchVO;
import com.tagoplus.util.StringUtil;
import com.tagosolution.controller.BaseController;
import com.tagosolution.controller.common.ModuleController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.BoardServiceImpl;
import com.tagosolution.service.model.AdminVO;
import com.tagosolution.service.model.BoardInfoVO;
import com.tagosolution.service.model.BoardMasterVO;
import com.tagosolution.service.model.CommentVO;
import com.tagosolution.service.model.FrontMenuVO;
import com.tagosolution.service.model.MemberInfoVO;
import com.tagosolution.service.model.search.BoardSearchVO;


@Controller
@RequestMapping(value = "/board")
public class BoardController extends BaseController{
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	GeneralDAOImpl _gDao;
	
	@Autowired
	ApplicationContext _context;
	
	@Autowired
	BoardServiceImpl _boardService;
	
	@RequestMapping(value = "/board")
	public String rb(BoardSearchVO search, BindingResult result,String menuid, Model model) throws Exception {
		
		if (StringUtil.isEmpty(search.getMode()))
			search.setMode("list");
		
		FrontMenuVO vo = (FrontMenuVO) _gDao.selectByKey("frontMenu.selectByKey", menuid);
		search.setBcode(vo.getFolderPath());
		search.setMode(search.getMode().toLowerCase());
		model.addAttribute("menuIdx", menuid);
		model.addAttribute("search", search);
		
		return "/front/board/board";
	}
	
	
	/**
	 * ajax - 로그인/코멘트 체크
	 * @param body
	 * @param commentSeq
	 * @param result
	 * @param model
	 * @return 로그인 체크 후 권한 체크
	 * @throws Exception
	 */
	@RequestMapping(value = "/ajax/check_login")
	@ResponseBody
	public Object ajaxCheckLogin(@RequestBody(required = false) String body, Long commentSeq, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", false);
		//check login from user session
		if(super.getUserSession() == null) {
			map.put("success", false);
			map.put("result", 1);
			map.put("message",_context.getMessage("common.need.login", new Object[0], Locale.getDefault()));
			return new Gson().toJson(map);
		}
		String userId = super.getUserSession().getUserId();
		CommentVO cv = (CommentVO) _gDao.selectByKey("boardComment.selectByKey", commentSeq);
		Long bseq = cv.getBoardSeq();
		try {
			MemberInfoVO memberinfo = (MemberInfoVO) _gDao.selectByKey("memberInfo.selectById", userId);
			//get board info from bseq
			BoardSearchVO search = new BoardSearchVO();
			search.setBseq(bseq);
			search.setBcode(cv.getBoardCode());
			BoardInfoVO vo = (BoardInfoVO) _boardService.getDetail(search, true);
			//get board master from bseq
			BoardMasterVO bm = (BoardMasterVO) _gDao.selectByKey("boardMaster.selectByKey", search.getBcode());	
			//get boardMaster check comment auth
			if(bm.getAuthComment() == 0 || bm.getAuthComment() 	>= memberinfo.getGradeLevel() ) {
				if(bm.getCommentLevel() != null && bm.getCommentLevel() >= (cv.gethDepth() + 1)) {
					map.put("success", true);
					map.put("result", cv);
				}else {
					map.put("result", 2);
					map.put("message","게시판 코멘트 레벨은 "+bm.getCommentLevel()+"까지 입니다.");
				}
			}else {
				map.put("result", 3);
				map.put("message","권한이 없습니다.");
			}
		}catch (Exception e) {
			map.put("result", 4);
			map.put("message",super.getMessage("error.pre.msg"));
		}
		return new Gson().toJson(map);
	}
	/**
	 * ajax - 로그인/코멘트 체크
	 * @param body
	 * @param idType
	 * @param id
	 * @param result
	 * @param model
	 * @return 중복되었을 경우 중복된 아이디 유형, 아이디 리턴
	 * @throws Exception
	 */
	@RequestMapping(value = "/ajax/check_edit")
	@ResponseBody
	public Object ajaxCheckEdit(@RequestBody(required = false) String body, Long commentSeq, Long boardSeq, BoardSearchVO search,BindingResult result, Model model, HttpServletRequest request) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", false);
		
		if(super.getUserSession() == null) {
			map.put("success", false);
			map.put("result", 1);
			map.put("message",_context.getMessage("common.need.login", new Object[0], Locale.getDefault()));
			return new Gson().toJson(map);
		}
		
		try {
			String userId = super.getUserSession().getUserId();
			CommentVO cv = (CommentVO) _gDao.selectByKey("boardComment.selectByKey", commentSeq);
			search.setBseq(boardSeq);
			search.setBcode(cv.getBoardCode());
			BoardInfoVO vo = (BoardInfoVO) _boardService.getDetail(search, true);

			if(userId.equals(cv.getRegUser()) && boardSeq == cv.getBoardSeq() && cv.getBoardCode().equals(vo.getBoardCode())) {
				map.put("success", true);
				map.put("result", cv);
			}else {
				map.put("message",super.getMessage("common.noAuth.default"));
			}
			
		}catch (Exception e) {
			logger.error(e.getMessage(), e);
			map.put("message",super.getMessage("error.pre.msg"));
		}
		return new Gson().toJson(map);
	}
	
}
