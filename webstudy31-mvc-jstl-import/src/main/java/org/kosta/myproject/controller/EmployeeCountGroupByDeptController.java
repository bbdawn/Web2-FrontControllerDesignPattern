package org.kosta.myproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.myproject.model.EmployeeDAO;

public class EmployeeCountGroupByDeptController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("groupList",EmployeeDAO.getInstance().findEmpCountGroupByDept());
		request.setAttribute("url", "emp/employee-count-dept.jsp");
		return "layout.jsp";
	}
}






