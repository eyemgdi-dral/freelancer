package com.tagosolution.controller.front;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tagoplus.model.common.AlertModel;
import com.tagoplus.util.Encrypt;
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.MemberServiceImpl;
import com.tagosolution.service.model.BoardInfoVO;
import com.tagosolution.service.model.MemberCompanyVO;
import com.tagosolution.service.model.MemberInfoVO;
import com.tagosolution.service.model.search.BoardSearchVO;
import com.tagosolution.service.model.search.MemberSearchVO;

/**
 * 회원 컨트롤러 
 * @author lhg
 *
 */
@Controller
@RequestMapping(value = "/mypage")
public class MyPageController extends BaseController{

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Resource
	GeneralDAOImpl _gDao;
	
	@Resource
	MemberServiceImpl _memberService;

	/**
	 * 회원가입 or 마이페이지 - 등록  & 수정 ui
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/member_write.do")
	public String memberWrite (MemberSearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		MemberInfoVO vo = (MemberInfoVO) _gDao.selectByKey("memberInfo.selectById", search.getId());	
		MemberCompanyVO voc = (MemberCompanyVO) _gDao.selectByKey("memberCompany.selectById", search.getId());	
//		MemberSettingVO configVO = (MemberSettingVO) _gDao.selectByKey("memberSetting.selectByKey", super.getSiteSession().getSiteSeq().intValue());	
		
		model.addAttribute("vo", vo);
		model.addAttribute("voc", voc);
//		model.addAttribute("configVO", configVO);
		model.addAttribute("search", search);
		return "/front/mypage/member_write";
	}
	
	/**
	 * 회원가입 - 등록 & 수정 처리
	 * @param search
	 * @param vo
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/member_proc.do")
	public String memberProc (MemberCompanyVO voc, MemberSearchVO search, MemberInfoVO vo, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();

		try {
			_memberService.insertMemberInfo(voc, search, vo);
			
			am.setMessage("처리 되었습니다.");
		} catch (Exception e) {
			logger.debug(e.getMessage(), e);
			am.setMessage("처리 중 오류가 발생하였습니다. \\n" + e.getMessage());
		}

		//수정시
		if (search.getMseq() > 0) {
			am.setScript("$.Nav('go', '/');");

		//회원가입시	
		} else {
			am.setScript("$.Nav('go', '/login');");
		}
		
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
		
	/**
	 * 마이페이지 - 솔루션 주문내역
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/solution_buy_list.do")
	public String solutionBuyList (MemberSearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		/*주문내역 테이블 없음*/
		
		model.addAttribute("search", search);
		return "/front/mypage/solution_buy_list";
	}
	
	/**
	 * 마이페이지 - 상담 내역
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/consulting_list.do")
	public String consultingList (BoardSearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		//임시 상담
		search.setId(super.getUserSession().getUserId());
		search.setBcode("consulting");
		List<BoardInfoVO> list = (List<BoardInfoVO>) _gDao.selectBySearch("boardInfo.selectList", search); 

		model.addAttribute("list", list);
		model.addAttribute("search", search);
		return "/front/mypage/consulting_list";
	}
	
	/**
	 * 마이페이지 - 비밀번호 수정 ui
	 * @param search
	 * @param vo
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/pwd_change.do")
	public String pwdChange (MemberSearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		model.addAttribute("search", search);
		return "/front/mypage/pwd_change";
	}
	
	/**
	 * 마이페이지 - 비밀번호 수정 - 처린
	 * @param search
	 * @param vo
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/pwd_change_proc.do")
	public String pwdChangeProc (MemberSearchVO search, MemberInfoVO vo, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		AlertModel am = new AlertModel();
				
		try {
			
			MemberInfoVO mVo = (MemberInfoVO) _gDao.selectByKey("memberInfo.selectById", search.getId());
			if (mVo.getUserPwd().equals(Encrypt.SHA256Hash(search.getBeforePwd()))) {
				_memberService.insertMemberInfo(null, search, vo);
				am.setMessage("처리 되었습니다.");
			} else {
				am.setMessage("기존 비밀번호가 틀렸습니다.");
			}
			
		} catch (Exception e) {
			logger.debug(e.getMessage(), e);
			am.setMessage("처리중 오류가 발생하였습니다. \\n" + e.getMessage());
		}

		am.setScript("$.Nav('go', './pwd_change.do', {id : '" + search.getId() + "'});");
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * 마이페이지 - 회원탈퇴 ui		
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/withdrawal.do")
	public String withdrawal (MemberSearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);		
		
		model.addAttribute("search", search);
		return "/front/mypage/withdrawal";
	}
	
	/**
	 * 마이페이지 - 회원탈퇴 처리
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/withdrawal_proc.do")
	public String withdrawalProc (MemberSearchVO search, MemberInfoVO vo, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);		

		AlertModel am = new AlertModel();

		boolean isPwdCheck = false;

		try {
			MemberInfoVO mVo = (MemberInfoVO) _gDao.selectByKey("memberInfo.selectById", super.getUserSession().getUserId());			
			if (mVo.getUserPwd().equals(Encrypt.SHA256Hash(vo.getUserPwd()))) {
				vo.setUserId(super.getUserSession().getUserId());
				vo.setMemberSeq(super.getUserSession().getMemberSeq());	
					
				
				
				
				_memberService.deleteOwner(vo);
				am.setMessage("처리 되었습니다.");
				isPwdCheck = true;
				

			} else {
				am.setMessage("기존 비밀번호가 틀렸습니다.");
			}
		} catch (Exception e) {
			logger.debug(e.getMessage(), e);
			am.setMessage("처리 중 오류가 발생하였습니다. \\n" + e.getMessage());
		}
		
		if (isPwdCheck) {
			am.setScript("$.Nav('go', '" + super.getConfig().getFrontLoginURL() + "', null, null, true);");
			super.getSession().invalidate();
		} else {
			am.setScript("$.Nav('go', './withdrawal.do');");
		}
		model.addAttribute("alert", am);
		return super.getConfig().getViewAlert();
	}
	
	/**
	 * 마이페이지 - Member Point		
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/mem_point.do")
	public String memberPoint (MemberSearchVO search, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);		
		
		model.addAttribute("search", search);
		return "/front/mypage/mem_point";
	}

}