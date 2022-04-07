package controller;

/*
 *  실제 컨트롤러 로직을 담당하는 컨트롤러를 연결하기 위해 
 *  개별 컨트롤러 객체 생성을 전담하는 객체 ( Factory ) 
 */
public class HandlerMapping {
	private static HandlerMapping instance = new HandlerMapping();

	private HandlerMapping() {
	}

	public static HandlerMapping getInstance() {
		return instance;
	}
	/*
	 *  java reflection 을 이용해 런타임시에 동적으로 객체를 자동 생성하도록 구현 , 아래 이전 버전 메서드와는 달리 
	 *  개별 컨트롤러가 추가,수정,삭제되더라도 별도의 코드 작업은 필요없다 -> 결합도를 낮추어 생산성 및 유지보수성 향상시킨다 
	 */
	public Controller create(String command) throws InstantiationException, IllegalAccessException, ClassNotFoundException {
		Controller controller = null;
		//현재 팩키지 정보를 받아온다 
		/*
		String packageInfo=this.getClass().getPackage().getName();
		String classInfo=packageInfo+"."+command;
		*/
		// 위 코드 패키지와 클래스 정보 문자열을 만드는 두 라인을 StringBuilder를 이용해 만들어 본다 
		// String : 불변, 변경시 새로 생성 , StringBuilder : 가변 , 변경시 자체가 변경 
		String classInfo=new StringBuilder(this.getClass().getPackage().getName()).append(".").append(command).toString();
		//동적으로 객체를 생성한다 
		controller=(Controller)Class.forName(classInfo).newInstance();
		return controller;
	}
	/*	이전 버전 코드 - 컨트롤러 추가 또는 변경 또는 삭제될 때에는 아래의 코드 부분이 함께 변경 -> 결합도가 높은 상태 
	public Controller create(String command) {
		Controller controller = null;
		if (command.equals("findCarByNo")) {
			controller = new FindCarByNoController();
		} else if (command.equals("registerCar")) {
			controller = new RegisterCarController();
		} else if (command.equals("findAllCarList")) {
			controller = new FindAllCarListController();
		} else if(command.equals("updateCar")) {
			controller=new UpdateCarController();
		}
		return controller;
	}
	*/
}








