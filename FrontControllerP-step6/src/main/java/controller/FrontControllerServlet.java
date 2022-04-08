package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *  url-pattern 을 *.do 로 설정해서 .do 로 요청하면 처리하도록 한다 
 */
@WebServlet("*.do")
public class FrontControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doDispatch(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// webstudy20 의 단위테스트를 참고해서 uri 에서 Controller에서 추출한다 
			String uri=request.getRequestURI();
			String contextPath=request.getContextPath();
			String command = uri.substring(contextPath.length()+1, uri.length()-3);
			System.out.println("uri:"+uri);
			System.out.println("contextPath:"+contextPath);
			System.out.println("command:"+command);
			
			String viewPath = null;
			// step3 에서 제기되었던 개별 컨트롤러 객체 생성부를 별도의 HandlerMapping으로
			// 모듈화 했음 -> 이 HandlerMapping을 이용해 개별 컨트롤러 객체 생성을 의뢰하여
			// 상위 Controller 인터페이스 타입으로 반환받는다 
			Controller controller = HandlerMapping.getInstance().create(command);			 

			// 어떤 개별 컨트롤러인지 상관없이 단일한 방식으로 다양한 컨트롤러 객체를 처리할 수 있다
			//-> 다형성 지원
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
			// 서버 오류 발생시에는 클라이언트에게 error.jsp로 리다렉트하여 응답한다 
			response.sendRedirect("error.jsp");
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
