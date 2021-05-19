package com.tagosolution.service.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.google.common.collect.ImmutableMap;
import com.tagoplus.model.common.StringPair;

/**
 * RSA 암호화 유틸리티<br>
 * /common/js/rsa 디렉토리 내 rsa 암호화 처리용 자바스크립트와 함께 사용
 * @author wimy
 *
 */
public class ListUtil {
	
	/**
	 * Created by Mongolian Team
	 * - spring model 바인딩
	 * @param request
	 * @param model
	 * @param sessionName
	 * @param keySize
	 * @throws Exception
	 */
    
	public static final Map<String, String> additionalType = ImmutableMap.<String, String>builder()
		.put("text", "text")
	    .put("select", "select")
	    .put("radio", "radio")
	    .put("checkbox", "checkbox")
	    .put("textarea", "textarea")
	    .put("file", "file")
	    .put("datepicker", "일자(단력)")
	    .put("dtimepick", "년월일시")
	    .put("birthdate", "생년월일")
	    .put("mobileno", "전화번호")
	    .put("address", "주소찾기")
	    .put("email", "이메일")
	    .build();
	
	public static List<StringPair> typeQuickAsk() throws Exception {
		 List<StringPair> pair = new ArrayList<StringPair>();
		 pair.add(new StringPair("이름", "userName"));
		 pair.add(new StringPair("연락처", "contact"));
		 pair.add(new StringPair("이메일", "email"));
		 pair.add(new StringPair("내용", "content"));
		 
		 return pair;
	}
	
	public static List<StringPair> listContentsType() throws Exception {
		 List<StringPair> pair = new ArrayList<StringPair>();
		 pair.add(new StringPair("유형", ""));
		 pair.add(new StringPair("가입약관", "terms"));
		 pair.add(new StringPair("개인정보 보호정책", "privacy"));
		 
		 return pair;
	}
}
