package test;
/**
 * FrontControllerServlet에서 redirect 처리를 위한 단위테스트 
 * @author KOSTA
 *
 */
public class TestUnitRedirect {
	public static void main(String[] args) {
		String viewPath="redirect:registercar-result.jsp";
		//개별 컨트롤러가 리턴한 viewPath가 redirect: 로 시작하는 지 알수있다
		System.out.println(viewPath.startsWith("redirect:")); 
		//viewPath에서 redirect: 을 제외한 문자열을 추출 
		System.out.println("redirect:".length());// redirect: 은 9자의 문자로 구성되어 있다 
		// String substring(beginIndex) test 
		String data="abcdefg";
		System.out.println(data.substring(3));// index가 0부터 시작, 3은 d , 즉 index 3 을 포함한 이후 문자열을 추출 
		System.out.println(viewPath.substring(9));// redirect: 9자 이고 , index는 0부터 시작되므로 9를 명시하면 index 9부터 이후 문자열을 추출 
	}
}
