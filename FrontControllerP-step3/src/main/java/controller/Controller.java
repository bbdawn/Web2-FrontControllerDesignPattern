package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 *  컨트롤러 로직을 수행하는 개별 컨트롤러를 캡슐화하기 위한 인터페이스 -> 다형성 지원 , 표준화 
 */
public interface Controller {
	public String execute(HttpServletRequest request,HttpServletResponse response) throws Exception;
}
