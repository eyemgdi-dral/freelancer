package com.tagosolution.service.model.search;

import com.tagoplus.model.common.SearchVO;

/**
 * 관리자 로그인용 모델
 * @author wimy
 *
 */
public class AdminLoginSearchVO extends SearchVO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4213347468632150496L;

	
	String secureId;
	String securePwd;
	
	
	public String getSecureId() {
		return secureId;
	}
	
	public void setSecureId(String secureId) {
		this.secureId = secureId;
	}
	
	public String getSecurePwd() {
		return securePwd;
	}
	
	public void setSecurePwd(String securePwd) {
		this.securePwd = securePwd;
	}
}
