package com.tagosolution.controller.front;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tagoplus.model.common.AlertModel;
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.model.FrontMenuVO;
import com.tagosolution.service.model.PageVO;
import com.tagosolution.service.model.search.BoardSearchVO;
import com.tagosolution.service.model.search.PageSearchVO;

@Controller
@RequestMapping(value = "/pages")
public class PagesController extends BaseController{
	@Autowired
	GeneralDAOImpl _gDao;
	
	@RequestMapping(value="/page/{menuIdx}")
	public String page (@PathVariable String menuIdx,PageSearchVO search, BindingResult result, Model model)  throws Exception {
		
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
		PageVO vo = (PageVO) _gDao.selectByKey("page.selectByCode", fmo.getFolderPath());
		model.addAttribute("vo",vo);
		model.addAttribute("menuIdx",menuIdx);
		model.addAttribute("search",search);
		BoardSearchVO search2 = new BoardSearchVO();
		model.addAttribute("search2", search2);
		if(vo.getCustomYn().equals("Y")) {
			return "/front/static/"+vo.getPageUrl();
		}else {
			return "/front/pages/page";			
		}
		
	}
}
