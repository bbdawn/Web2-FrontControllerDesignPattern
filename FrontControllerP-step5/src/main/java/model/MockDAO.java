package model;

import java.util.ArrayList;

// Mock : 가짜 , 테스트를 위해 모조 DAO를 작성 
public class MockDAO {
	private static MockDAO instance=new MockDAO();
	private MockDAO() {}
	public static MockDAO getInstance() {
		return instance;
	}
	public String findCarByNo(String carNo) throws Exception{
		String car=null;
		if(carNo.equals("1234"))
			car="캐스퍼 검정";
		return car;
	}
	public void register(String carInfo) throws Exception{
		System.out.println("db에 "+carInfo+" 차량정보 등록");
	}
	public ArrayList<String> findAllCarList() throws Exception{
		ArrayList<String> list=new ArrayList<String>();
		list.add("소나타");
		list.add("아우디");
		list.add("아반떼");
		return list;
	}
	public void updateCar(String carInfo) throws Exception{
		System.out.println("db에 "+carInfo+" 차량정보 수정");
	}
	public void deleteCar(String carNo) throws Exception{
		System.out.println("db에 "+carNo+" 차번호의 차량정보 삭제");
	}
}


























