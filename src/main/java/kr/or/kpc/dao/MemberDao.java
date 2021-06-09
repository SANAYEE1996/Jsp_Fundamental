package kr.or.kpc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import kr.or.kpc.dto.MemberDto;
import kr.or.kpc.util.ConnLocator;

public class MemberDao {
	
	public static int result = 0;
	
	private static MemberDao single;
	
	private MemberDao() {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			System.out.println("드라이브 로드 성공!!");
		} catch (ClassNotFoundException e) {
			System.err.println("드라이버 로드 실패 : " +e.getMessage());
		}
	}
	public static MemberDao getInstance() {
		if (single == null) {
			single = new MemberDao();
		}
		return single;
	}
	
	public boolean insert(MemberDto dto) {
		boolean isSuccess = false;
		
		Connection con = ConnLocator.getConnect();
		PreparedStatement pstmt = null;
		
		try {
			
			Statement stmt = con.createStatement();
			
			StringBuilder sql = new StringBuilder();
			sql.append("insert into member(num, name, addr, sex) ");
			sql.append("values(?,?,?,?)");
			
			int index = 1;
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(index++, dto.getNum());
			pstmt.setString(index++, dto.getName());
			pstmt.setString(index++, dto.getAddr());
			pstmt.setString(index++, dto.getSex());
			
			isSuccess = true;
			result = pstmt.executeUpdate();
			System.out.println("갱신된 행의 개수 : " +result);
			
			stmt.close();
		} catch (SQLException e) {
			System.err.println("데이터베이스 연결 실패 : " +e.getMessage());
			System.err.println(e.getSQLState());
		} finally {
			try {
				if(con != null) con.close(); // 반납
				if(pstmt != null) pstmt.close();
			} catch (SQLException e) {
				System.err.println(e.getMessage());
			}
		}
		return isSuccess;
	}

	public boolean update(String addr, int num) {
		boolean isSuccess = false;

		Connection con = ConnLocator.getConnect();
		
		PreparedStatement pstmt = null;

		try {
			Statement stmt = con.createStatement();

			StringBuilder sql = new StringBuilder();
			sql.append("update member set addr = ? where num = ?");

			pstmt = con.prepareStatement(sql.toString());
			int index = 1;
			pstmt.setString(index++, addr);
			pstmt.setInt(index++, num);
			isSuccess = true;
			
			result = pstmt.executeUpdate();
			System.out.println("갱신된 행의 개수 : " + result);
			
			stmt.close();
		} catch (SQLException e) {
			System.err.println("데이터베이스 연결 실패 : " + e.getMessage());
			System.err.println(e.getSQLState());
		} finally {
			try {
				if (con != null)
					con.close();
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				System.err.println(e.getMessage());
			}
		}
		
		return isSuccess;
	}

	public boolean delete(int num) {
		boolean isSuccess = false;
		
		Connection con = ConnLocator.getConnect();
		
		PreparedStatement pstmt = null;
		
		try {
			Statement stmt = con.createStatement();

			StringBuilder sql = new StringBuilder();
			sql.append("delete from member where num = ?");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			System.out.println("갱신된 행의 개수 : " + result);
			
			isSuccess = true;
			
			stmt.close();
		} catch (SQLException e) {
			System.err.println("데이터베이스 연결 실패 : " + e.getMessage());
			System.err.println(e.getSQLState());
		} finally {
			try {
				if (con != null)
					con.close();
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				System.err.println(e.getMessage());
			}
		}
		
		return isSuccess;
	}

	public ArrayList<MemberDto> select(int i, int j) {
		ArrayList<MemberDto> list = new ArrayList<>();
		Connection con = ConnLocator.getConnect();
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		try {
			StringBuilder sql = new StringBuilder();
			sql.append("select num,name,addr,sex ");
			sql.append("from member ");
			sql.append("order by num desc ");
			sql.append("limit ?,?");
			
			pstmt = con.prepareStatement(sql.toString());
			int index = 1;
			pstmt.setInt(index++, i);
			pstmt.setInt(index++, j);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				index = 1;
				MemberDto d = new MemberDto();
				d.setNum(rs.getInt(index++));
				d.setName(rs.getString(index++));
				d.setAddr(rs.getString(index++));
				d.setSex(rs.getString(index++));
				list.add(d);
			}
		} catch (SQLException e) {
			System.err.println("DB 연결 실패 : "+e.getMessage());
		} finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			}
			catch(SQLException e) {
				System.err.println(e.getMessage());
			}
			
		}
		
		return list;
	}

}
