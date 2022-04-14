package org.kosta.myproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateMemberFormController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//로그인 상태일때만 회원정보수정폼을 제공하도록 구현 
		/*
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null)
			return "redirect:index.jsp";		
		*/
		// CheckLoginInterceptor에서 처리하므로 위의 인증체크로직은 필요없음 
		return "redirect:update-form.jsp";
	}
}
