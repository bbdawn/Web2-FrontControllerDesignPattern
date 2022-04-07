package test.unit.reflection;
/*
 *  java reflection API 를 이용해 런타임시에 동적으로 객체 생성해보는 연습예제 
 */
public class TestAutoCreateInstance {
	public static void main(String[] args) {
		Player player=null;
		String classInfo="test.unit.reflection.Youtube";
		String classInfo2="test.unit.reflection.CDPlayer";
		try {
			//런타임시에 Class.forName() 으로 클래스를 로딩하고 newInstance()로 객체를 동적으로 생성한다  
			player=(Player) Class.forName(classInfo).newInstance();
			player.play();
			player=(Player)Class.forName(classInfo2).newInstance();
			player.play();
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {			
			e.printStackTrace();
		}
	}
}
