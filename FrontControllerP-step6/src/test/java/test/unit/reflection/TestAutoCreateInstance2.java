package test.unit.reflection;
/*
 *  java reflection API 를 이용해 런타임시에 동적으로 객체 생성해보는 연습예제 
 *  두번째 단위테스트 : 클래스명은 client에서 전달되는 command를 이용 
 *  					 팩키지명은 현재 클래스의 패키지를 동적으로 반환받아 이용해서
 *  					 객체를 생성해보는 예제 
 *  					 
 */
public class TestAutoCreateInstance2 {
	public static void main(String[] args) {
		ReflectionService service=new ReflectionService();
		String command="Youtube";
		command="CDPlayer";
		Player player;
		try {
			player = service.create(command);
			player.play();
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
