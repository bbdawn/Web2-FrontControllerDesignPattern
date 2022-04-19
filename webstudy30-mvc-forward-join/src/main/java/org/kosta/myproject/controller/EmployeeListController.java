package org.kosta.myproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.myproject.model.EmployeeDAO;

public class EmployeeListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("employeeList", EmployeeDAO.getInstance().findAllEmployeeList());
		return "employee-list.jsp";
	}
}
