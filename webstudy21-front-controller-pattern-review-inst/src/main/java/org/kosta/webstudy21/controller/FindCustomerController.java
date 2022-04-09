package org.kosta.webstudy21.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.webstudy21.model.MockDAO;

public class FindCustomerController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String customerId=request.getParameter("customerId");
		String customer=MockDAO.getInstance().findCustomer(customerId);
		String viewName=null;
		if(customer==null) {
			viewName="find-fail.jsp";
		}else {
			viewName="find-ok.jsp";
			request.setAttribute("customer", customer);
		}
		return viewName;
	}

}
