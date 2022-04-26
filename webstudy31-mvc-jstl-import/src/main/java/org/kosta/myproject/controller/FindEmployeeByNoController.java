package org.kosta.myproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.myproject.model.EmployeeDAO;
import org.kosta.myproject.model.EmployeeVO;

public class FindEmployeeByNoController implements Controller{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		EmployeeVO vo=EmployeeDAO.getInstance().findEmployeeByNo(request.getParameter("empno"));
		//사원이 존재하지 않으면 find-employee-fail.jsp로 응답 (main ui : layout.jsp 를 사용 x ) 
		if(vo==null) {
			return "emp/find-employee-fail.jsp";
		}else {
			request.setAttribute("emp", vo);
			request.setAttribute("url","emp/employee-detail.jsp");
			return "layout.jsp";
		}
	}
}






