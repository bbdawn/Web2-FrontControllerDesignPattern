package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MockDAO;

public class FindAllCarListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<String> list=MockDAO.getInstance().findAllCarList();
		request.setAttribute("carList", list);
		return "findcar-list.jsp";
	}
}
