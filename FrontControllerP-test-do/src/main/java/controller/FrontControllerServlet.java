package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @WebServlet 의 url-pattern 을 *.do로 설정하여 .do로 요청하면 
 * FrontControllerServlet 이 동작되도록 한다
 */
@WebServlet("*.do")
public class FrontControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doDispatch(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			System.out.println("URI:"+request.getRequestURI());
			/*
			 	/webstudy20-front-controller-do-test/RegisterCarController.do
				/webstudy20-front-controller-do-test/FindCarController.do
			 */
			System.out.println("contextPath:"+request.getContextPath());//웹어플리케이션명을 반환 
			// /webstudy20-front-controller-do-test
			// 위 두 메서드를 테스트 해보면  getRequestURI() 정보에서 getContextPath()+"/" 정보와 .do를 제외하면 컨트롤러명이 추출
			// test.TestString class에서 단위 테스트 해본다 
			
			// URI 에서 contextPath+"/" 와 ".do" 를 제외한 컨트롤러명을 추출 
			String uri=request.getRequestURI();
			String contextPath=request.getContextPath();
			System.out.println(uri.substring(contextPath.length()+1, uri.length()-3));
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
