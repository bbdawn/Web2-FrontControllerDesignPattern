package test;

public class TestString2 {
	public static void main(String[] args) {
		String uri="/kosta/RegController.do";
		//RegController 만 나오도록 substring으로 추출 
		System.out.println(uri.substring(7, 20));
		String context="/kosta";
		System.out.println(context.length());//6
		System.out.println(context.length()+1);//7
		System.out.println(uri.length());//23
		System.out.println(uri.length()-3);//20
		System.out.println(uri.substring(context.length()+1, uri.length()-3));// RegController
	}
}
