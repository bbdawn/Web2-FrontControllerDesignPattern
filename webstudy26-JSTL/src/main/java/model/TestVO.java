package model;
// View jsp EL에서 접근 테스트를 위한 클래스 
// EL에서는 get 계열 메서드와 is 계열 메서드만 접근 가능 
public class TestVO {
	public String getInfo() {
		return "태국";
	}
	public int getMoney() {
		return 100;
	}
	public String sendMessage() {
		return "팟타이";
	}
	public boolean isNextGroup() {
		return false;
	}
}
