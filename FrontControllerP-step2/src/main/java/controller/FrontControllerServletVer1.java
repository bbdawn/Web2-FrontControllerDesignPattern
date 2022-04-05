package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MockDAO;

/**
 * 아래 서블릿 어노테이션은 주석 처리 , 이유는 doDispatch 메서드가 비대해져 각 요청별로 메서드 정의하는 방식으로 구조를 개선 
 * -> FrontControllerServletVer2 를 정의해 적용 
 */
//@WebServlet("/FrontControllerServlet")
public class FrontControllerServletVer1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 모든 클라이언트 요청을 처리하는 메서드
	 * 
	 */
	protected void doDispatch(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// client의 요청을 분석하기 위해 command를 반환받는다
			String command = request.getParameter("command");
			if (command.equals("findCarByNo")) {// 차번호로 검색작업 				
				String carNo = request.getParameter("carNo");
				String car = MockDAO.getInstance().findCarByNo(carNo);
				if (car == null) {
					request.getRequestDispatcher("findcar-fail.jsp").forward(request, response);
				} else {
					request.setAttribute("car", car);
					request.getRequestDispatcher("findcar-ok.jsp").forward(request, response);
				}
			}else if(command.equals("registerCar")) {//차량 등록작업 
				String carInfo=request.getParameter("carInfo");
				MockDAO.getInstance().register(carInfo);
				response.sendRedirect("registercar-result.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doDispatch(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// post 방식 인코딩 처리 ( http request body의 정보를 한글처리 )
		request.setCharacterEncoding("utf-8");
		doDispatch(request, response);
	}
}
