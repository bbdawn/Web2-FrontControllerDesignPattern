package org.kosta.myproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.myproject.model.EmployeeDAO;

public class FindEmployeeByNoController implements Controller{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("emp", EmployeeDAO.getInstance().findEmployeeByNo(request.getParameter("empno")));
		return "employee-detail.jsp";
	}
}






