package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontControllerServlet
 */
@WebServlet("/FrontControllerServlet")
public class FrontControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doDispatch(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String command = request.getParameter("command");
			String viewPath = null;
			Controller controller = null;
			// 개별 컨트롤러 객체생성 로직 : 컨트롤러가 추가될 때마다 코드 업데이트해야 -> 개선할 대상 ( step4 에서 해보자 )  
			if (command.equals("findCarByNo")) {
				controller = new FindCarByNoController();
			}else if(command.equals("registerCar")) {
				controller=new RegisterCarController();
			}else if(command.equals("findAllCarList")) {
				controller=new FindAllCarListController();
			}
			// 어떤 개별 컨트롤러인지 상관없이 단일한 방식으로 다양한 컨트롤러 객체를 처리할 수 있다 -> 다형성 지원
			// Controller interface 계층구조 형성을 통해
			// 개별 컨트롤러 객체들과 FrontControllerServlet과의 결합도가 낮아진다
			viewPath = controller.execute(request, response);
			if (viewPath.startsWith("redirect:")) { //redirect 방식 제어 이동 
				response.sendRedirect(viewPath.substring(9));
			} else { //forward 방식 제어 이동 
				request.getRequestDispatcher(viewPath).forward(request, response);
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
		request.setCharacterEncoding("utf-8");
		doDispatch(request, response);
	}
}
