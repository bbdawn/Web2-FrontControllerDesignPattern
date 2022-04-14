package org.kosta.myproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.myproject.model.MemberDAO;
import org.kosta.myproject.model.MemberVO;

public class FindMemberByIdController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id=request.getParameter("id");
		MemberVO vo=MemberDAO.getInstance().findMemberById(id);
		String viewName=null;
		if(vo==null) {
			viewName="findbyid-fail.jsp";
		}else {
			viewName="findbyid-ok.jsp";
			request.setAttribute("memberVO", vo);
		}
		return viewName;
	}

}
