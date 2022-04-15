package org.kosta.myproject.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.myproject.model.MemberDAO;
import org.kosta.myproject.model.MemberVO;

public class FindMemberListByAddressController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 로그인한 사용자만 주소로 회원검색 서비스를 받도록 처리한다 
		// 비로그인 상태에서 접근하면 index.jsp로 redirect하고 검색서비스는 하지 않도록 한다 
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null) {
			System.out.println("**주소로 회원검색서비스는 로그인한 사용자만 가능합니다**");
			return "redirect:index.jsp";
		}		
		
		String address=request.getParameter("address");
		ArrayList<MemberVO> list=MemberDAO.getInstance().findMemberListByAddress(address);
		request.setAttribute("memberList", list);
		return "findbyaddress-result.jsp";
	}
}
