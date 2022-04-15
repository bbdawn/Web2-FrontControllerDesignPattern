package org.kosta.myproject.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equals("POST")==false)
			throw new ServletException("로그아웃 서비스는 POST방식만 가능합니다");
		HttpSession session=request.getSession(false);//기존 세션이 있으면 반환, 없으면 null을 반환 
		if(session!=null)
			session.invalidate();//세션을 무효화시킨다 
		return "redirect:index.jsp";
	}
}
