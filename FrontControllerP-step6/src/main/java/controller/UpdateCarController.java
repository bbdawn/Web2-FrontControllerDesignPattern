package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MockDAO;

public class UpdateCarController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String carInfo=request.getParameter("carInfo");
		MockDAO.getInstance().updateCar(carInfo);
		return "redirect:updatecar-result.jsp";// redirect 방식으로 응답하기 위해 redirect: 을 추가 
	}
}
