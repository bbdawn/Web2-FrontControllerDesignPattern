package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * FrontControllerServletVer1 : doDispatch() 메서드에서 모든 요청을 처리 
 * FrontControllerServletVer2 : doDispatch 메서드가 비대해져 각 요청별로 메서드 정의하는 방식으로 구조를 개선  
 * 									findCarByNo() , registerCar() -> 요청 처리를 별도의 메서드로 분화 
 *  
 * FrontControllerServletVer3 : FrontControllerServlet class 자체가 비대해지므로 
 * 								   개별 요청 처리를 별도의 클래스에서 담당하도록 설계 
 * 								   FindCarByNoController , RegisterCarController 에서 각각의 컨트롤러 로직을 구현   
 */
@WebServlet("/FrontControllerServlet")
public class FrontControllerServletVer3 extends HttpServlet {
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
				FindCarByNoController controller=new FindCarByNoController();
				controller.findCarByNo(request, response);
			}else if(command.equals("registerCar")) {//차량 등록작업 
				RegisterCarController controller=new RegisterCarController();
				controller.registerCar(request, response);
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
