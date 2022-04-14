package org.kosta.myproject.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class MemberDAO {
	private static MemberDAO instance=new MemberDAO();
	private DataSource dataSource;
	private MemberDAO() {
		this.dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static MemberDAO getInstance() {
		return instance;
	}
	public void closeAll(PreparedStatement pstmt,Connection con) throws SQLException{
		if(pstmt!=null)
			pstmt.close();
		if(con!=null)
			con.close(); // 컨넥션을 컨넥션풀에 반납한다 
	}
	public void closeAll(ResultSet rs,PreparedStatement pstmt,Connection con) throws SQLException{
		if(rs!=null)
			rs.close();
		closeAll(pstmt, con);
	}
	public void unitTest() throws SQLException {
		System.out.println(dataSource.getConnection());
	}
	
	public MemberVO findMemberById(String id) throws SQLException{
		MemberVO vo=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=dataSource.getConnection();//dbcp로부터 컨넥션을 빌려온다 
			StringBuilder sql=new StringBuilder("SELECT id,name,address, ");
			sql.append("TO_CHAR(birthday,'YYYY-MM-DD'),TO_CHAR(regdate,'YYYY-MM-DD HH24:MM:SS') ");
			sql.append("FROM mvc_member WHERE id=?");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next())
				vo=new MemberVO(rs.getString(1),null,rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5));
		}finally {
			closeAll(rs, pstmt, con);
		}
		return vo;
	}
	// SELECT name,address,TO_CHAR(birthday,'YYYY-MM-DD') FROM mvc_member WHERE id='java' AND password='a'
	public MemberVO login(String id,String password) throws SQLException{
		MemberVO vo=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=dataSource.getConnection();//컨넥션을 dbcp로부터 빌려온다 
			String sql="SELECT name,address,TO_CHAR(birthday,'YYYY-MM-DD') FROM mvc_member WHERE id=? AND password=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs=pstmt.executeQuery();
			if(rs.next())
				vo=new MemberVO(id,password,rs.getString(1),rs.getString(2),rs.getString(3),null);
		}finally {
			closeAll(rs, pstmt, con);//컨넥션을 dbcp로 반납한다 
		}
		return vo;
	}
	
	public ArrayList<MemberVO> findMemberListByAddress(String address) throws SQLException{
		ArrayList<MemberVO> list=new ArrayList<MemberVO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=dataSource.getConnection();
			String sql=
				"SELECT id,name,TO_CHAR(birthday,'YYYY-MM-DD') FROM mvc_member WHERE address=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, address);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberVO vo=new MemberVO();
				vo.setId(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setBirthday(rs.getString(3));
				list.add(vo);
			}
		}finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}
	public void update(MemberVO memberVO) throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=dataSource.getConnection();
			String sql="UPDATE mvc_member SET password=?,name=?,address=?,birthday=TO_DATE(?,'YYYY-MM-DD') WHERE id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, memberVO.getPassword());
			pstmt.setString(2, memberVO.getName());
			pstmt.setString(3, memberVO.getAddress());
			pstmt.setString(4, memberVO.getBirthday());
			pstmt.setString(5, memberVO.getId());
			pstmt.executeUpdate();
		}finally {
			closeAll(pstmt, con);
		}
	}
	public void register(MemberVO vo) throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=dataSource.getConnection();
			String sql="INSERT INTO mvc_member(id,password,name,address,birthday,regdate) VALUES(?,?,?,?,TO_DATE(?,'YYYY-MM-DD'),SYSDATE)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getAddress());
			pstmt.setString(5, vo.getBirthday());
			pstmt.executeUpdate();
		}finally {
			closeAll(pstmt, con);
		}
	}
	public boolean checkId(String id) throws SQLException {
		boolean result=false;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=dataSource.getConnection();
			String sql="SELECT COUNT(*) FROM mvc_member WHERE id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			// 존재하면 true, 존재하지 않으면 false 
			if(rs.next()&&rs.getInt(1)==1)
				result=true;
		}finally {
			closeAll(rs, pstmt, con);
		}
		return result;
	}
}























