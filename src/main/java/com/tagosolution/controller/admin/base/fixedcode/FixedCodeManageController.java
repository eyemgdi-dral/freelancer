package com.tagosolution.controller.admin.base.fixedcode;





import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;


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

import com.tagosolution.controller.BaseController;

import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.AdminServiceImpl;
import com.tagosolution.service.impl.FixedCodeServiceImpl;
import com.tagosolution.service.model.FixedCodeVO;
import com.tagosolution.service.model.search.BoardSearchVO;
import com.tagosolution.service.model.search.FixedCodeSearchVO;


/**
 * Fixed Code Controller
 * @author G.Tenger
 *
 */
@Controller
@RequestMapping(value = "#{globals['url.admin.root']}/base/fixedcodemanage")
public class FixedCodeManageController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(FixedCodeManageController.class);
	
	@Resource
	GeneralDAOImpl _gDao;
	
	@Resource
	FixedCodeServiceImpl _fixedCodeService;
	
	
	/**
	 * Fixed Code List
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public String fixedcodelist(FixedCodeSearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("환경설정  &gt; 게시판 &gt; 게시판 설정", model);
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
	     
		List<FixedCodeVO> list = (List<FixedCodeVO>) _gDao.selectList("fixedCode.selectList", search);
		
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		return super.getConfig().getAdminRoot() + "/base/fixedcodemanage/list/list";
	}
	
	/**
	 * Fixed Code Detail
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/writelist")
	public String listWrite(FixedCodeSearchVO search, BindingResult result, Model model) throws Exception {
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		FixedCodeVO vo = (FixedCodeVO) _gDao.selectOne("fixedCode.selectByKey",search);
		
		model.addAttribute("vo", vo);
		model.addAttribute("search", search);
		return super.getConfig().getAdminRoot() + "/base/fixedcodemanage/list/write";
	}
	
	/**
	 * Fixed Code Save
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list_proc")
	public String listProc(FixedCodeVO vo, FixedCodeSearchVO search, BindingResult result, Model model) throws Exception {
		
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
		
		try {
			if (search.getStatus().equals("d")) {
				search.setcCode(vo.getCodeCode());
				_fixedCodeService.deleteCode(search);
				am.setMessage("삭제되었습니다.");
			} else {
				_fixedCodeService.insertCode(vo);
				am.setMessage("저장되었습니다.");
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage("처리 중 오류가 발생했습니다.\\n" + e.getMessage());
		}
		
				am.setScript("$.Nav('go', './list', {codeId:''});");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	
	
	@RequestMapping(value = "/ajax/check_cCode", method = RequestMethod.POST)
	@ResponseBody
	public Object ajaxCheckcCode(@RequestBody(required = false) String body, String id, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		Map<String, Object> map = new HashMap<String, Object>();
		FixedCodeSearchVO search = new FixedCodeSearchVO();
		search.setId(id);
		int iCount = (int) _gDao.selectOne("fixedCode.totalCount", search);
		
		if (iCount > 0)
			map.put("result", id);	
		else
			map.put("result", null);
		
		return new Gson().toJson(map);
	}
}
