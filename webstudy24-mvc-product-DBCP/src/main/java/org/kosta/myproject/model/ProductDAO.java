package org.kosta.myproject.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;
/*
 *  DAO 에서 Database Connection Pool 을 이용하기 위해 DataSourceManager로부터 DataSource를 반환받는다 
 */
public class ProductDAO {
	private static ProductDAO instance=new ProductDAO();
	private DataSource dataSource;
	private ProductDAO() {
		dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static ProductDAO getInstance() {
		return instance;
	}
	public void closeAll(PreparedStatement pstmt,Connection con) throws SQLException {
		if(pstmt!=null)
			pstmt.close();
		if(con!=null)
			con.close();// 컨넥션을 dbcp 로 반납한다 
	}
	public void closeAll(ResultSet rs,PreparedStatement pstmt,Connection con) throws SQLException{
		if(rs!=null)
			rs.close();
		closeAll(pstmt, con);
	}
	
	
	public ProductVO findProductById(String id) throws SQLException{
		ProductVO vo=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=dataSource.getConnection();//dbcp로부터 컨넥션을 빌려온다
			String sql="SELECT id,name,maker,price,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') FROM mvc_product WHERE id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next())
				vo=new ProductVO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5));
		}finally {
			closeAll(rs, pstmt, con);
		}
		return vo;
	}
	public void register(ProductVO vo) throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=dataSource.getConnection();//dbcp로부터 컨넥션을 빌려온다 
			String sql=
			"INSERT INTO mvc_product(id,name,maker,price,regdate) VALUES(mvc_product_seq.nextval,?,?,?,sysdate)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getMaker());
			pstmt.setInt(3, vo.getPrice());
			pstmt.executeUpdate();
		}finally {
			closeAll(pstmt, con);
		}
	}
	public ArrayList<ProductVO> findAllProductList() throws SQLException{
		ArrayList<ProductVO> list=new ArrayList<ProductVO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=dataSource.getConnection();//dbcp로부터 컨넥션을 빌려온다 
			String sql=
		     "SELECT id,name,TO_CHAR(regdate,'YYYY.MM.DD') FROM mvc_product ORDER BY id DESC";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(new ProductVO(rs.getInt(1),rs.getString(2),rs.getString(3)));
			}
		}finally {
			closeAll(rs, pstmt, con);
		}		
		return list;
	}
}
















