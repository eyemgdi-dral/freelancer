package com.tagosolution.controller.front;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tagoplus.model.common.AlertModel;
import com.tagosolution.controller.BaseController;
import com.tagosolution.controller.admin.formmail.list.FormmailListController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.FormmailServiceImpl;
import com.tagosolution.service.model.FormInfoVO;
import com.tagosolution.service.model.FormVO;
import com.tagosolution.service.model.FormValueVO;
import com.tagosolution.service.model.FrontMenuVO;
import com.tagosolution.service.model.PageVO;
import com.tagosolution.service.model.search.FormmailSearchVO;
@Controller
@RequestMapping(value = "/form")
public class FormController extends BaseController{
	private static final Logger logger = LoggerFactory.getLogger(FormmailListController.class);

	@Resource
	FormmailServiceImpl _formmailService;
	
	@Autowired
	GeneralDAOImpl _gDao;
	
	@RequestMapping(value="/view/{menuIdx}")
	public String page (@PathVariable String menuIdx,FormmailSearchVO search, BindingResult result, Model model)  throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);


		FrontMenuVO fmo = (FrontMenuVO) _gDao.selectByKey("frontMenu.selectByKey", menuIdx);

		if(fmo == null) {
			AlertModel am = new AlertModel();
			am.setMessage("잘못된 접속입니다.");
			am.setScript("location.href= history.back();");
			model.addAttribute("alert", am);
			return super.getConfig().getViewAlert();
		}
		FormVO vo = (FormVO) _gDao.selectByKey("form.selectByCode", fmo.getFolderPath());
		List<FormInfoVO> list = (List<FormInfoVO>) _gDao.selectList("formInfo.selectByForm", vo.getFormSeq());
		
		if (!list.isEmpty()) {
			for (FormInfoVO f : list) {
				List<String> listString = new ArrayList<String>();
				String[] sArr = f.getDetailName().split("\\¤", f.getDetailCount());
				for (String s : sArr)
					listString.add(s);
				f.setDetailNameArray(listString);
			}
		}
		model.addAttribute("vo",vo);
		model.addAttribute("list",list);
		model.addAttribute("search", search);
		model.addAttribute("menuIdx",menuIdx);
		return "/front/form/view";

	}
	
	/**
	 * 폼메일관리 작성내용 등록
	 * @param search
	 * @param vo
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/valueProc")
	public String valueProc(FormmailSearchVO search, FormValueVO vo, BindingResult result, Model model) throws Exception {
		if(result.hasErrors())
			return super.setBindingResult(result, model);
		AlertModel am = new AlertModel();
		if(super.getUserSession() != null) {
			search.setUser(super.getUserSession().getUserId());			
		}
		
		try {
			_formmailService.insertFormValue(search, vo);
			am.setMessage("견적 의뢰가 완료되었습니다. 빠른 시간 내에 답변 드리도록 하겠습니다.");
			
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			am.setMessage(super.getMessage("error.pre.msg") + "\\n" + e.getMessage());
		}
		String menuid = search.getMenuId();
		am.setScript("$.Nav('go', '/form/view/"+menuid+"');");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
}

