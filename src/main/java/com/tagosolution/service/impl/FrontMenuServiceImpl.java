package com.tagosolution.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.tagosolution.service.model.FrontMenuVO;
import com.tagosolution.service.model.MenuAuthGroupSettingVO;
import com.tagosolution.service.model.MenuAuthoSettingVO;
import com.tagosolution.service.model.search.MenuSettingSearchVO;
import com.tagosolution.service.util.SeqGeneratorUtil;

@Service("frontMenuService")
public class FrontMenuServiceImpl extends BaseServiceImpl {

	public void menuOrderUpdate (MenuSettingSearchVO search, FrontMenuVO vo) throws Exception {
		String iOrdering1 = vo.getSortNum();
		
		List<FrontMenuVO> list = (List<FrontMenuVO>) super.getDAO().selectBySearch("frontMenu.selectOrderingForUpdate", search);
		FrontMenuVO vo2 = new FrontMenuVO();
		List<String> menus = new ArrayList<String>();
		if (list != null && list.size() > 0) {
			String iOrdering2 = list.get(0).getSortNum();
			if(vo.getMenuLevel() != 3){
				for(FrontMenuVO menu : list){
					menus.add(menu.getMenuIdx());	
				}
				vo2.setMenuIds(menus);		
				
			}else{
				vo2.setMenuIdx(list.get(0).getMenuIdx());
			}
			vo2.setSortNum(iOrdering1);
			vo2.setMenuLevel(vo.getMenuLevel());
			
			super.getDAO().update("frontMenu.updateOrdering", vo2);
			List<FrontMenuVO> seclist = new ArrayList<FrontMenuVO>();
			menus = new ArrayList<String>();
			if(vo.getMenuLevel() == 2)
				seclist  = (List<FrontMenuVO>) super.getDAO().selectList("frontMenu.selectOrderingSecondLevel", vo.getMenuIdx());
			else if(vo.getMenuLevel() == 1)
				seclist  = (List<FrontMenuVO>) super.getDAO().selectList("frontMenu.selectByLnb", vo.getMenuIdx());
			for(FrontMenuVO menu : seclist){
				menus.add(menu.getMenuIdx());	
			}
			if(menus.size() == 0){
				menus.add(vo.getMenuIdx());
			}
			vo.setSortNum(iOrdering2);
			vo.setMenuIds(menus);
			super.getDAO().update("frontMenu.updateOrdering", vo);
		}
	}
	
	/**
	 * Menu Setting Merge
	 * @param vo
	 * @throws Exception
	 */
	public void mergeMenu (MenuSettingSearchVO search,FrontMenuVO vo) throws Exception {
		Integer maxLevel = 0;
		String sortNum = "";
		String pid = "";
		if(vo.getMenuIdx().isEmpty()){
			search.setMenuLevel(vo.getMenuLevel());
			maxLevel = (Integer) super.getDAO().getCountBySearch("frontMenu.maxIdBylevel", search);
			sortNum = (String) super.getDAO().selectOne("frontMenu.maxSortNumBylevel", search);
			if(!vo.getParentIdx().isEmpty() && vo.getParentIdx() != null)
				pid = (vo.getMenuLevel() == 2) ? vo.getParentIdx().substring(0, 2) : vo.getParentIdx().substring(0, 4);
			vo.setMenuIdx(SeqGeneratorUtil.genMenuId(search.getMenuLevel(), maxLevel, pid));
			vo.setSortNum(sortNum);
		}else if(!vo.getMenuLevel().equals((short)3)){
			super.getDAO().update("frontMenu.updateChildFlag", vo);
		}
		super.getDAO().insert("frontMenu.merge", vo);
	}
	
	/**
	 * Menu Setting Group Merge
	 * @param vo
	 * @throws Exception
	 */
	public void mergeMenuAutho (MenuSettingSearchVO search,MenuAuthGroupSettingVO vo) throws Exception {
		
		super.getDAO().insert("menuAuthGroup.merge", vo);
		List<MenuAuthoSettingVO> ma = vo.getMenuAuthList();
		if( ma!= null && ma.size() > 0){
            for (MenuAuthoSettingVO v : ma) {
                v.setGroupId(vo.getIdX());
                super.getDAO().insert("menuAutho.merge", v);
            }
        }
	}
	
	/**
	 * Menu Setting Group delete
	 * @param vo
	 * @throws Exception
	 */
	public void deleteMenuAutho (MenuSettingSearchVO search) throws Exception {
		super.getDAO().delete("menuAuthGroup.delete", search);
	}
}
