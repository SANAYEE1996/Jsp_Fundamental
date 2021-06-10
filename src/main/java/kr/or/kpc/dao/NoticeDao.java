package kr.or.kpc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import kr.or.kpc.dto.NoticeDto;
import kr.or.kpc.util.ConnLocator;

public class NoticeDao {
	public static int result = 0;
	
	private static NoticeDao single;

	private NoticeDao() {
	}

	public static NoticeDao getInstance() {
		if (single == null) {
			single = new NoticeDao();
		}
		return single;
	}
	
	public boolean insert(NoticeDto dto) {
		boolean isSuccess = false;
		
		Connection con = ConnLocator.getConnect();
		PreparedStatement pstmt = null;
		
		try {
			
			Statement stmt = con.createStatement();
			
			StringBuilder sql = new StringBuilder();
			sql.append("insert into notice(n_num,n_writer,n_title,n_content,n_regdate) ");
			sql.append("values(?,?,?,?,NOW())");
			
			int index = 1;
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(index++, dto.getNum());
			pstmt.setString(index++, dto.getWriter());
			pstmt.setString(index++, dto.getTitle());
			pstmt.setString(index++, dto.getContent());
			pstmt.setString(index++, dto.getRegdate());
			
			isSuccess = true;
			result = pstmt.executeUpdate();
			System.out.println("갱신된 행의 개수 : " +result);
			
			stmt.close();
		} catch (SQLException e) {
			System.err.println("데이터베이스 연결 실패 : " +e.getMessage());
			System.err.println(e.getSQLState());
		} finally {
			closer(con, pstmt);
		}
		return isSuccess;
	}

	public boolean update(String content, int num) {
		boolean isSuccess = false;

		Connection con = ConnLocator.getConnect();
		
		PreparedStatement pstmt = null;

		try {
			Statement stmt = con.createStatement();

			StringBuilder sql = new StringBuilder();
			sql.append("update notice set content = ? where num = ?");

			pstmt = con.prepareStatement(sql.toString());
			int index = 1;
			pstmt.setString(index++, content);
			pstmt.setInt(index++, num);
			isSuccess = true;
			
			result = pstmt.executeUpdate();
			System.out.println("갱신된 행의 개수 : " + result);
			
			stmt.close();
		} catch (SQLException e) {
			System.err.println("데이터베이스 연결 실패 : " + e.getMessage());
			System.err.println(e.getSQLState());
		} finally {
			closer(con, pstmt);
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
			sql.append("delete from notice where num = ?");

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
			closer(con, pstmt);
		}
		
		return isSuccess;
	}

	public ArrayList<NoticeDto> select(int i, int j) {
		ArrayList<NoticeDto> list = new ArrayList<>();
		Connection con = ConnLocator.getConnect();
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		try {
			StringBuilder sql = new StringBuilder();
			sql.append("select *");
			sql.append("from notice ");
			sql.append("order by num desc ");
			sql.append("limit ?,?");
			
			pstmt = con.prepareStatement(sql.toString());
			int index = 1;
			pstmt.setInt(index++, i);
			pstmt.setInt(index++, j);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				index = 1;
				NoticeDto d = new NoticeDto();
				d.setNum(rs.getInt(index++));
				d.setWriter(rs.getString(index++));
				d.setTitle(rs.getString(index++));
				d.setContent(rs.getString(index++));
				d.setRegdate(rs.getString(index++));
				list.add(d);
			}
		} catch (SQLException e) {
			System.err.println("DB 연결 실패 : "+e.getMessage());
		} finally {
			closer(con, pstmt, rs);
		}
		
		return list;
	}
	private void closer(Connection con, PreparedStatement pstmt) {
		try {
			if (con != null)
				con.close();
			if (pstmt != null)
				pstmt.close();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}
	private void closer(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(con != null) con.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		}
		catch(SQLException e) {
			System.err.println(e.getMessage());
		}
	}
	
}
