package org.kosta.myproject.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.myproject.model.MemberDAO;
import org.kosta.myproject.model.MemberVO;

public class UpdateMemberController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//post 방식만 회원정보 수정되도록 처리 
		if(request.getMethod().equals("POST")==false)
			throw new ServletException("회원정보수정은 POST방식 요청만 지원합니다");
		//비로그인 상태일 경우에는 index 로 리다이렉트시킨다 
		/*
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null)
			return "redirect:index.jsp";
		*/
		// 위의 인증체크로직은 CheckLoginInterceptor에서 처리하므로 주석처리 
		//회원정보수정 
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		String address=request.getParameter("address");
		String birthday=request.getParameter("birthday");
		MemberVO vo=new MemberVO(id,password,name,address,birthday,null);
		MemberDAO.getInstance().update(vo);// db에 회원정보 수정 
		HttpSession session=request.getSession(false);
		session.setAttribute("mvo", vo);//session에 회원정보 수정 
		return "redirect:update-result.jsp";
	}
}













