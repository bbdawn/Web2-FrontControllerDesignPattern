package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MockDAO;
/**
 * 
 * 차등록 컨트롤러 로직을 담당하는 객체 
 *
 */
public class RegisterCarController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String carInfo=request.getParameter("carInfo");
		MockDAO.getInstance().register(carInfo);
		// FrontController Pattern 적용 환경에서는 redirect로 응답하기 위해서 redirect: 을 서두에 추가한다 ( spring 과 동일 ) 
		return "redirect:registercar-result.jsp";
	}
	
}
