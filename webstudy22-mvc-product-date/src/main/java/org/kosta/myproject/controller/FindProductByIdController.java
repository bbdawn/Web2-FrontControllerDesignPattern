package org.kosta.myproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.myproject.model.ProductDAO;
import org.kosta.myproject.model.ProductVO;

public class FindProductByIdController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id=request.getParameter("productId");
		ProductVO vo=ProductDAO.getInstance().findProductById(id);
		if(vo==null) {
			return "findbyid-fail.jsp";
		}else {
			request.setAttribute("product", vo);
			return "findbyid-ok.jsp";
		}		
	}
}
