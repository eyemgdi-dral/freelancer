package com.tagosolution.controller.front;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.tagoplus.model.JsonResult;
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.BoardServiceImpl;
import com.tagosolution.service.model.BoardInfoVO;
import com.tagosolution.service.model.BoardMasterVO;
import com.tagosolution.service.model.PrdCategoryVO;
import com.tagosolution.service.model.PrdVO;
import com.tagosolution.service.model.SiteVO;
import com.tagosolution.service.model.search.BoardSearchVO;

/**
 * 프론트 - 메인 컨트롤러
 *  
 * @author wimy
 *
 */
@Controller
public class MainController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Resource
	GeneralDAOImpl _gDao;
		
	@Autowired
	BoardServiceImpl _boardService;
	/**
	 * 메인 페이지
	 * @param site
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/main")
	public String index(SiteVO site, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		
		super.setPageSubTitle("메인", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		BoardSearchVO search = new BoardSearchVO();
		BoardMasterVO bm = (BoardMasterVO) _gDao.selectByKey("boardMaster.selectByKey", "gallery");
		search.getPaging().setPageSize(5);
		int size = bm.getBoardCategoryVO().size();
		if(size>0 && search.getBcseq() == 0) {
			search.setBcseq(bm.getBoardCategoryVO().get(0).getBcSeq());
		}
		@SuppressWarnings("unchecked")
		List<BoardInfoVO> list = (List<BoardInfoVO>) _boardService.getList(search, bm);
		
		model.addAttribute("bm", bm);
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		model.addAttribute("cateList", bm.getBoardCategoryVO());
		
		return "/front/main";
	}
	
	
	@RequestMapping(value = "/mainGallery")
	@ResponseBody
	public Object mainGallery(@RequestBody(required = false) String body, BoardSearchVO search, BindingResult result, Model model) throws Exception {
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			search.setBcode("gallery");
			BoardMasterVO bm = (BoardMasterVO) _gDao.selectByKey("boardMaster.selectByKey", search.getBcode());
			bm.setPagerRowCount((short) 5);
			@SuppressWarnings("unchecked")
			String[] images;
			List<BoardInfoVO> list = (List<BoardInfoVO>) _boardService.getList(search, bm);
			
			map.put("data", list);
			map.put("success", true);
		}
		catch (Exception e) {
			logger.error(e.getMessage(), e);
			map.put("message", e);
			throw e;
		}
		
		return map;
		
	}
	
	
}
