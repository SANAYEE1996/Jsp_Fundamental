package kr.or.kpc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.or.kpc.dto.NoticeDto;
import kr.or.kpc.util.ConnLocator;

public class NoticeDao {
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
		boolean success = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ConnLocator.getConnect();
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO notice(n_num, n_writer,n_title,n_content, ");
			sql.append("n_regdate) VALUES(?,?,?,?,NOW())");

			pstmt = con.prepareStatement(sql.toString());
			int index = 1;
			pstmt.setInt(index++, dto.getNum());
			pstmt.setString(index++, dto.getWriter());
			pstmt.setString(index++, dto.getTitle());
			pstmt.setString(index++, dto.getContent());

			pstmt.executeUpdate();
			success = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(con, pstmt , null);
		}

		return success;
	}

	public boolean update(NoticeDto dto) {
		boolean success = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ConnLocator.getConnect();
			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE notice ");
			sql.append("SET n_writer = ?, n_title=?,  ");
			sql.append("n_content = ? ");
			sql.append("WHERE n_num = ? ");

			pstmt = con.prepareStatement(sql.toString());
			int index = 1;
			pstmt.setString(index++, dto.getWriter());
			pstmt.setString(index++, dto.getTitle());
			pstmt.setString(index++, dto.getContent());
			pstmt.setInt(index++, dto.getNum());

			pstmt.executeUpdate();
			success = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(con, pstmt , null);
		}

		return success;
	}

	public boolean delete(int num) {
		boolean success = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ConnLocator.getConnect();
			StringBuilder sql = new StringBuilder();
			sql.append("DELETE FROM notice ");
			sql.append("WHERE n_num = ?");

			pstmt = con.prepareStatement(sql.toString());
			int index = 1;
			pstmt.setInt(index++, num);

			pstmt.executeUpdate();
			success = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(con, pstmt , null);
		}

		return success;
	}

	public ArrayList<NoticeDto> select(int start, int len) {
		ArrayList<NoticeDto> list = new ArrayList<NoticeDto>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ConnLocator.getConnect();

			StringBuilder sql = new StringBuilder();
			sql.append("SELECT n_num, n_writer,n_title, n_content, date_format(n_regdate,'%Y/%m/%d') ");
			sql.append("FROM notice ");
			sql.append("ORDER BY n_regdate DESC ");
			sql.append("LIMIT ?, ? ");

			pstmt = con.prepareStatement(sql.toString());

			int index = 1;
			pstmt.setInt(index++, start);
			pstmt.setInt(index++, len);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				index = 1;
				int num = rs.getInt(index++);
				String writer = rs.getString(index++);
				String title = rs.getString(index++);
				String content = rs.getString(index++);
				String regdate = rs.getString(index++);
				list.add(new NoticeDto(num, writer, title, content, regdate));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}

		return list;
	}
	public int getRows() {
		int resultCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ConnLocator.getConnect();
			
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT COUNT(n_num) ");
			sql.append("FROM notice ");
			
			pstmt = con.prepareStatement(sql.toString());
			
			int index = 1;
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				index = 1;
				resultCount = rs.getInt(index++);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}
		
		return resultCount;
	}
	
	
	
	
	private void close(Connection con, 
			PreparedStatement pstmt, 
			ResultSet rs) {
		try {
			if (con != null)
				con.close();
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int getMaxNum() {
		int resultCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ConnLocator.getConnect();

			StringBuilder sql = new StringBuilder();
			sql.append("SELECT ifnull(MAX(n_num)+1,1) ");
			sql.append("FROM notice ");

			pstmt = con.prepareStatement(sql.toString());

			int index = 1;

			rs = pstmt.executeQuery();
			if (rs.next()) {
				index = 1;
				resultCount = rs.getInt(index++);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}

		return resultCount;
	}
	
	public NoticeDto select(int num) {
		NoticeDto list = null;
		Connection con = ConnLocator.getConnect();
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		try {
			StringBuilder sql = new StringBuilder();
			sql.append("select n_num, n_writer, n_title, n_content, ");
			sql.append("date_format(n_regdate,'%Y/%m/%d %h:%i') ");
			sql.append("from notice ");
			sql.append("where n_num = ?");
			
			pstmt = con.prepareStatement(sql.toString());
			int index = 1;
			pstmt.setInt(index++, num);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				index = 1;
				NoticeDto d = new NoticeDto();
				num = rs.getInt(1);
				d = new NoticeDto(rs.getInt(index++),rs.getString(index++),
						rs.getString(index++),rs.getString(index++),
						rs.getString(index++));
			}
		} catch (SQLException e) {
			System.err.println("DB 연결 실패 : "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		
		return list;
		
	}
}