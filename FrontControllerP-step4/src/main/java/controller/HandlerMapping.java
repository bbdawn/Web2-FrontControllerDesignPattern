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
}








