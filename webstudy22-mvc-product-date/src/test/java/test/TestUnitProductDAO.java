package test;

import java.util.ArrayList;

import org.kosta.myproject.model.ProductDAO;
import org.kosta.myproject.model.ProductVO;

public class TestUnitProductDAO {
	public static void main(String[] args) {
		try {
			ProductDAO dao=ProductDAO.getInstance();
			//System.out.println(dao.findProductById("1"));
			/*
			 * ProductVO vo=new ProductVO("테라","진로",1400); dao.register(vo);
			 * System.out.println("등록완료");
			 */
			// 전체 상품 리스트 조회 테스트 
			ArrayList<ProductVO> list=dao.findAllProductList();
			for(ProductVO vo:list)
				System.out.println(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
