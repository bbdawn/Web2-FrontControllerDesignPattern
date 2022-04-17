package org.kosta.myproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FindMemberController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// find-result.jsp는 member 디렉토리 하위에 존재한다 
		return "member/find-result.jsp";
	}
}
