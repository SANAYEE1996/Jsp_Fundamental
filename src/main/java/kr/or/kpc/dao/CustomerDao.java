package kr.or.kpc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import kr.or.kpc.dto.CustomerDto;
import kr.or.kpc.util.ConnLocator;

public class CustomerDao {
	private static CustomerDao single;
	private static int result = 0;

	private CustomerDao() {
	}

	public static CustomerDao getInstance() {
		if (single == null) {
			single = new CustomerDao();
		}
		return single;
	}

	public boolean insert(CustomerDto dto) {
			boolean isSuccess = false;
			
			Connection con = ConnLocator.getConnect();
			PreparedStatement pstmt = null;
			
			try {
				
				Statement stmt = con.createStatement();
				
				StringBuilder sql = new StringBuilder();
				sql.append("INSERT INTO customer values");
				sql.append("(?,?,?,?,?,now())");
				
				int index = 1;
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setInt(index++, dto.getNum());
				pstmt.setString(index++, dto.getEmail());
				pstmt.setString(index++, dto.getPwd());
				pstmt.setString(index++, dto.getName());
				pstmt.setString(index++, dto.getStatus());
				
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
	
	public boolean update(String pwd,String name,String status, int num) {
		boolean isSuccess = false;
		
		Connection con = ConnLocator.getConnect();
		PreparedStatement pstmt = null;
		
		try {
			
			Statement stmt = con.createStatement();
			
			StringBuilder sql = new StringBuilder();
			sql.append("upadate customer set c_pwd = ?, c_name = ?, ");
			sql.append("c_status = ? where c_num = ? ");
			
			int index = 1;
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(index++, pwd);
			pstmt.setString(index++, name);
			pstmt.setString(index++, status);
			pstmt.setInt(index++, num);
			
			
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
	
	public ArrayList<CustomerDto> select(int i,int j){
			ArrayList<CustomerDto> list = new ArrayList<>();
	
			Connection con = ConnLocator.getConnect();
			
			PreparedStatement pstmt = null;
			
			ResultSet rs = null;
			
			try {
				StringBuilder sql = new StringBuilder();
				sql.append("select *");
				sql.append("from customer ");
				sql.append("order by c_num desc ");
				sql.append("limit ?,?");
				
				pstmt = con.prepareStatement(sql.toString());
				int index = 1;
				pstmt.setInt(index++, i);
				pstmt.setInt(index++, j);
				
				rs = pstmt.executeQuery();
				while(rs.next()) {
					index = 1;
					CustomerDto d = new CustomerDto();
					d.setNum(rs.getInt(index++));
					d.setEmail(rs.getString(index++));
					d.setPwd(rs.getString(index++));
					d.setName(rs.getString(index++));
					d.setStatus(rs.getString(index++));
					d.setRegdate(rs.getString(index++));
					
					list.add(d);
				}
			} catch (SQLException e) {
				System.err.println("DB 연결 실패 : "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			
			return list;
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
	
	public int getRows() {
		int resultCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ConnLocator.getConnect();
			
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT COUNT(n_num) ");
			sql.append("FROM customer ");
			
			pstmt = con.prepareStatement(sql.toString());
			
			int index = 1;
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				index = 1;
				resultCount = rs.getInt(index++);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}
		
		return resultCount;
	}
	
	public boolean isExisted(String email) {
		boolean isExisted = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ConnLocator.getConnect();
			
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT c_email ");
			sql.append("from customer ");
			sql.append("where c_email = ? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				isExisted = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}
		return isExisted;
	}
	
	
	public int getMaxNum() {
		int resultCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ConnLocator.getConnect();

			StringBuilder sql = new StringBuilder();
			sql.append("SELECT nvl(MAX(n_num)+1,1) ");
			sql.append("FROM customer");

			pstmt = con.prepareStatement(sql.toString());

			int index = 1;

			rs = pstmt.executeQuery();
			if (rs.next()) {
				index = 1;
				resultCount = rs.getInt(index++);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}

		return resultCount;
	}
	
	public CustomerDto select(int num) {
		CustomerDto dto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ConnLocator.getConnect();

			StringBuilder sql = new StringBuilder();
			sql.append("SELECT c_num,c_email,c_pwd,c_name,c_status, ");
			sql.append("date_format(n_regdate,'%Y/%m/%d %h:%i') ");
			sql.append("FROM customer ");
			sql.append("WHERE n_num = ? ");

			pstmt = con.prepareStatement(sql.toString());

			int index = 1;
			pstmt.setInt(index++, num);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				index = 1;
				num = rs.getInt(index++);
				String email = rs.getString(index++);
				String pwd = rs.getString(index++);
				String name = rs.getString(index++);
				String status = rs.getString(index++);
				String regdate = rs.getString(index++);
				dto = new CustomerDto(num,email,pwd,
						name,status,regdate);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}

		return dto;
	}
	
	public boolean update(CustomerDto dto) {
		boolean success = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ConnLocator.getConnect();
			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE customer ");
			sql.append("SET c_name =?,  ");
			if(dto.getPwd() != null) {
				sql.append("c_pwd = ?, ");
			}
			sql.append("c_status=? ");
			sql.append("WHERE c_num = ? ");

			pstmt = con.prepareStatement(sql.toString());
			int index = 1;
			pstmt.setString(index++, dto.getName());
			if(dto.getPwd() != null) {
				pstmt.setString(index++, dto.getPwd());
			}
			pstmt.setString(index++, dto.getStatus());
			pstmt.setInt(index++, dto.getNum());

			pstmt.executeUpdate();
			success = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return success;
	}
	

}
