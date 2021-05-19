package com.tagosolution.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.tagosolution.service.model.FixedCodeVO;
import com.tagosolution.service.model.search.FixedCodeSearchVO;

@Service("fixedCodeService")
public class FixedCodeServiceImpl extends BaseServiceImpl{
	private static final Logger logger = LoggerFactory.getLogger(PopupServiceImpl.class);

	
	/* 공통코드 등록 */
	public void insertCode(FixedCodeVO vo) throws Exception {
		super.getDAO().insert("fixedCode.insert", vo);
	}
	
	/* 공통코드 삭제 */
	public void deleteCode(FixedCodeSearchVO search) throws Exception {
		
		super.getDAO().insert("fixedCode.deleteByKey", search.getcCode());
	}
	
}
