package test;

import org.kosta.myproject.model.MemberDAO;

// 단위 테스트 클래스 
public class TestMemberDAO {
	public static void main(String[] args) {
		MemberDAO dao=MemberDAO.getInstance();
		try {
			//1. 아이디로 회원검색 테스트 
			//System.out.println(dao.findMemberById("java"));
			//System.out.println(dao.findMemberById("java2"));
			//2. 로그인 
			//System.out.println(dao.login("java", "a"));//로그인 ok 
			//System.out.println(dao.login("java", "b"));//로그인 fail 
			//3. 주소로 회원검색
			//ArrayList<MemberVO> list=dao.findMemberListByAddress("용인");
			//for(MemberVO vo:list)
			//	System.out.println(vo);
			//4. 회원수정테스트 
			//dao.update(new MemberVO("queen","c","프레드","판교","1980-01-01",null));
			//System.out.println(dao.findMemberById("queen"));
			//5. 회원가입테스트
			//dao.register(new MemberVO("test2","a","테스트","오리","2000-02-02",null));
			//System.out.println(dao.findMemberById("test2"));
			//6. 아이디 중복확인 
			System.out.println(dao.checkId("java"));
			System.out.println(dao.checkId("dinner"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}












