package test;

public class TestString {
	public static void main(String[] args) {
		String str="/a/b.do";
		// substring() 은 beginIndex 부터 endIndex 앞 문자열까지 추출 , index는 0부터 시작 
		System.out.println(str.substring(3, 4));// b 만 나오도록 beginIndex, endIndex를 명시해본다 
		String context="/a";
		int beginIndex=context.length()+1;
		int endIndex=str.length()-3;
		System.out.println(str.substring(beginIndex,endIndex));//beginIndex 3부터 endIndex 4 앞까지 추출 
	}
}
