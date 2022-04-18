package org.kosta.myproject.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.sql.DataSource;

public class EmployeeDAO {
	private static EmployeeDAO instance=new EmployeeDAO();
	private DataSource dataSource;
	private EmployeeDAO() {
		this.dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static EmployeeDAO getInstance() {
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
	public int findEmpTotalCount() throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int totalCount=0;
		try {
			con=dataSource.getConnection();
			String sql="SELECT COUNT(*) FROM mvc_employee";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
				totalCount=rs.getInt(1);
		}finally {
			closeAll(rs, pstmt, con);
		}
		return totalCount;
	}
	public ArrayList<EmployeeVO> findAllEmployeeList() throws SQLException {
		ArrayList<EmployeeVO> list=new ArrayList<EmployeeVO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=dataSource.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append("SELECT e.empno,e.ename,d.dname,d.loc ");
			sql.append("FROM mvc_employee e,mvc_department d ");
			sql.append("WHERE e.deptno=d.deptno");
			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DepartmentVO dvo=new DepartmentVO(rs.getString("dname"),rs.getString("loc"));
				list.add(new EmployeeVO(rs.getInt("empno"),rs.getString("ename"), dvo));
			}
		}finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}
	public EmployeeVO findEmployeeByNo(String empno) throws SQLException{
		EmployeeVO evo=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=dataSource.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append("SELECT e.empno,e.ename,e.sal,d.deptno,d.dname,d.loc,d.tel ");
			sql.append("FROM	 mvc_employee e,mvc_department d ");
			sql.append("WHERE e.deptno=d.deptno AND e.empno=?");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, empno);
			rs=pstmt.executeQuery();
			if(rs.next()) {
			 DepartmentVO dvo=
					 new DepartmentVO(rs.getInt("deptno"),rs.getString("dname"),rs.getString("loc"),rs.getString("tel"));
			 evo=new EmployeeVO(rs.getInt("empno"),rs.getString("ename"),rs.getInt("sal"),dvo); 
			}
		}finally {
			closeAll(rs, pstmt, con);
		}
		return evo;
	}
	public ArrayList<HashMap<String, String>> findEmpCountGroupByDept() throws SQLException {
		ArrayList<HashMap<String, String>> list=new ArrayList<HashMap<String, String>>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=dataSource.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append("SELECT d.dname,d.loc,NVL(g.emp_count,0) AS emp_count ");
			sql.append("FROM ( ");
			sql.append("SELECT deptno,count(*) as emp_count ");
			sql.append("FROM mvc_employee ");
			sql.append("GROUP BY deptno) g ");
			sql.append("RIGHT OUTER JOIN  mvc_department d  ON g.deptno=d.deptno");
			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				HashMap<String,String> map=new HashMap<String,String>();
				map.put("dname", rs.getString("dname"));
				map.put("loc", rs.getString("loc"));
				map.put("emp_count", rs.getString("emp_count"));
				list.add(map);
			}
		}finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}
}



































