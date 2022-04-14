package org.kosta.myproject.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.myproject.model.MemberDAO;
import org.kosta.myproject.model.MemberVO;

public class LoginController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// http request method를 확인해서 POST 방식일때만 로그인 서비스 할 수 있도록 한다 
		// 만약 POST 방식이 아니면 ServletException을 발생시키고(throw) 전파한다(throws)  
		if(request.getMethod().equals("POST")==false)
			throw new ServletException("로그인 서비스는 POST 방식 요청만 가능합니다");
		
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		//id와 password가 일치하지 않으면 null 이 반환, 일치하면 vo가 객체가 반환
		MemberVO vo=MemberDAO.getInstance().login(id, password);
		String viewName=null;
		if(vo==null) {
			viewName="redirect:login-fail.jsp";//redirect 방식으로 이동하기 위해 redirect: 을 명시 
		}else {// id, password가 일치할때 
			viewName="redirect:index.jsp";
			HttpSession session=request.getSession();//기존 세션이 있으면 반환 , 없으면 새로 생성 
			session.setAttribute("mvo", vo);
		}
		return viewName;
	}
}











