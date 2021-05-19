/**
 * 
 */
package com.tagosolution.controller.admin.frontmenu;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.tagoplus.model.common.AlertModel;
import com.tagoplus.model.common.SearchVO;
import com.tagosolution.controller.BaseController;
import com.tagosolution.controller.admin.config.sitemeta.SiteMetaController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.FrontMenuServiceImpl;
import com.tagosolution.service.impl.MenuSettingServiceImpl;
import com.tagosolution.service.model.BoardMasterVO;
import com.tagosolution.service.model.FixedCodeVO;
import com.tagosolution.service.model.FormVO;
import com.tagosolution.service.model.FrontMenuVO;
import com.tagosolution.service.model.MenuSettingVO;
import com.tagosolution.service.model.PageVO;
import com.tagosolution.service.model.search.MenuSettingSearchVO;
import com.tagosolution.service.model.search.PageSearchVO;

/**
 * @author Ambo
 *
 */
@Controller
@RequestMapping(value = "#{globals['url.admin.root']}/frontmenu")
public class FrontMenuController extends BaseController  {
	
	private static final Logger logger = LoggerFactory.getLogger(SiteMetaController.class);
	@Resource
	GeneralDAOImpl _gDao;
	
	@Resource
	FrontMenuServiceImpl _frontMenuSettingService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/list")
	public String FrontMenuList(MenuSettingSearchVO search, BindingResult result, Model model) throws Exception {
		
		super.setPageSubTitle("환경설정  &gt; 게시판 &gt; 게시판 설정", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		List<FrontMenuVO>list = (List<FrontMenuVO>) _gDao.selectList("frontMenu.selectList", search);
		List<FrontMenuVO>childList = (List<FrontMenuVO>) _gDao.selectList("frontMenu.mainmenu", search);
		List<FixedCodeVO> listMenuType = (List<FixedCodeVO>) _gDao.selectList("fixedCode.selectByGroup", "007");
		List<PageVO> pageList = (List<PageVO>) _gDao.selectList("page.selectForUse", null);
		List<BoardMasterVO> boardList = (List<BoardMasterVO>) _gDao.selectList("boardMaster.selectTotalList", null);
		List<FormVO> formList = (List<FormVO>) _gDao.selectBySearch("form.selectListForm", search);
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
		model.addAttribute("childList", new Gson().toJson(childList));
		model.addAttribute("pageList", pageList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("formList", formList);
		model.addAttribute("listMenuType", listMenuType);
		model.addAttribute("search", search);
		
		return super.getConfig().getAdminRoot() + "/menu/list";
	}
	
	/**
	 * Menu Setting Save
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/menu_proc")
	public String MenuProc(FrontMenuVO vo, MenuSettingSearchVO search, BindingResult result, Model model) throws Exception {
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		AlertModel am = new AlertModel();
		
	    try {
			vo.setRegUser(super.getAdminSession().getAdminId());
			vo.setModUser(super.getAdminSession().getAdminId());
			_frontMenuSettingService.mergeMenu(search, vo);
			am.setMessage("저장 완료");
		}
		catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		am.setScript("$.Nav('go', './list');");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * 페이지관리 - 리스트
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/ajax/list_pages")
	@ResponseBody
	public Object PageList(@RequestBody(required = false) String body,String parentIdx, HttpServletRequest request, BindingResult result, Model model) throws Exception {
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		MenuSettingSearchVO search = new MenuSettingSearchVO();
		
		List<PageVO> list = (List<PageVO>) _gDao.selectList("page.selectForAjax", null);
		
		return new Gson().toJson(list);
	}
	
}
