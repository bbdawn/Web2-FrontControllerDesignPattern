package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MockDAO;
/*
 *  차검색 컨트롤러 로직을 담당하는 개별 컨트롤러 객체 
 */
public class FindCarByNoController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewPath=null;
		String carNo=request.getParameter("carNo");
		String carInfo=MockDAO.getInstance().findCarByNo(carNo);
		if(carInfo==null) {
			viewPath="findcar-fail.jsp";
		}else {
			viewPath="findcar-ok.jsp";
			request.setAttribute("car", carInfo);
		}
		return viewPath;
	}
	
}
