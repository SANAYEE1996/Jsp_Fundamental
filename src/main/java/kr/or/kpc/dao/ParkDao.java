package kr.or.kpc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import kr.or.kpc.dto.ParkDto;
import kr.or.kpc.util.ConnLocator;

public class ParkDao {
	public static int result = 0;
	
	private static ParkDao single;

	private ParkDao() {
	}

	public static ParkDao getInstance() {
		if (single == null) {
			single = new ParkDao();
		}
		return single;
	}
	
	public ArrayList<ParkDto> resall() {
		ArrayList<ParkDto> list = new ArrayList<>();
		Connection con = ConnLocator.getConnect();
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		try {
			StringBuilder sql = new StringBuilder();
			sql.append("select pname,lan,len ");
			sql.append("from park");
			
			pstmt = con.prepareStatement(sql.toString());
			int index = 1;
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				index = 1;
				ParkDto d = new ParkDto();
				d.setPname(rs.getString(index++));
				d.setLan(rs.getDouble(index++));
				d.setLen(rs.getDouble(index++));
				list.add(d);
			}
		} catch (SQLException e) {
			System.err.println("DB 연결 실패 : "+e.getMessage());
		} finally {
			closer(con, pstmt, rs);
		}
		
		return list;
	}
	
	public ArrayList<ParkDto> res(String address) {
		ArrayList<ParkDto> list = new ArrayList<>();
		Connection con = ConnLocator.getConnect();
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		try {
			StringBuilder sql = new StringBuilder();
			sql.append("select lan,len");
			sql.append("from park ");
			sql.append("WHERE paddr LIKE '%?%'");
			
			pstmt = con.prepareStatement(sql.toString());
			int index = 1;
			pstmt.setString(index++, address);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				index = 1;
				ParkDto d = new ParkDto();
				d.setPname(rs.getString(index++));
				d.setLan(rs.getDouble(index++));
				d.setLen(rs.getDouble(index++));
				list.add(d);
			}
		} catch (SQLException e) {
			System.err.println("DB 연결 실패 : "+e.getMessage());
		} finally {
			closer(con, pstmt, rs);
		}
		
		return list;
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
