package test.unit.reflection;

public class ReflectionService {
	public Player create(String command) throws InstantiationException, IllegalAccessException, ClassNotFoundException {
		Player player=null;
		//현재 실행중인 클래스의 패키지명을 동적으로 반환받는다 
		String packageInfo=this.getClass().getPackage().getName();
		System.out.println("현재 실행중인 서비스의 팩키지 정보:"+packageInfo);
		player=(Player) Class.forName(packageInfo+"."+command).newInstance();
		return player;
	}
}
