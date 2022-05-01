package test;

import java.util.ArrayList;
import java.util.HashMap;

import org.kosta.myproject.model.EmployeeDAO;

/**
 * EmployeeDAO 단위 테스트 클래스 
 * @author KOSTA
 */
public class TestEmployeeDAO {
	public static void main(String[] args) {
		try {
			EmployeeDAO dao=EmployeeDAO.getInstance();
			//1. 총사원수 조회 
			//int totalCount=dao.findEmpTotalCount();
			//System.out.println("총사원수:"+totalCount);
			
			//2. 전체사원리스트 ( 사원 + 부서 ) 
			//ArrayList<EmployeeVO> list=dao.findAllEmployeeList();
			//for(EmployeeVO vo:list)
			//	System.out.println(vo.getEmpno()+" "+vo.getEname()+" "+vo.getDepartmentVO().getDname()+" "+vo.getDepartmentVO().getLoc());
			
			//3. 상세사원정보
			//System.out.println(dao.findEmployeeByNo("1"));
			
			//4. 부서별 사원수 통계정보 조회 
			ArrayList<HashMap<String,String>> list=dao.findEmpCountGroupByDept();
			for(int i=0;i<list.size();i++) {
				HashMap<String,String> map=list.get(i);
				System.out.println(map.get("dname")+" "+map.get("loc")+" "+map.get("emp_count"));
			}
		
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}












