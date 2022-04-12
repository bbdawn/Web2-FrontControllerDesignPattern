package org.kosta.webstudy17.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.webstudy17.model.MemberDAO;

/**
 * Servlet implementation class CheckIdServlet
 */
@WebServlet("/CheckIdServlet")
public class CheckIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		try {
			boolean result=MemberDAO.getInstance().checkId(id);
			String location=null;
			if(result) { // 아이디가 존재하면 사용불가 팝업으로 이동 
				location="check-id-fail.jsp";
			}else {// 아이디가 존재하지 않으면 사용가능 팝업으로 이동 
				location="check-id-ok.jsp";
			}
			request.getRequestDispatcher(location).forward(request, response);
		} catch (SQLException e) {			
			e.printStackTrace();
		}
	}
}













