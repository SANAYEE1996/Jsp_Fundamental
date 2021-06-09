package kr.or.kpc.util;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnLocator {
	public static Connection getConnect() {
		DataSource ds = null;
		Connection con = null;
		
		try {
			Context context = new InitialContext();
			//jdbc/kpc -> context/xml 참조
			ds = (DataSource) context.lookup("java:comp/env/jdbc/kpc");
			//connectionPool에 만들어진 connection 객체를 반환
			con = ds.getConnection();
		}catch(NamingException e) {
			System.err.println(e.getMessage());
		} catch(SQLException e) {
			System.err.println(e.getMessage());
		}
		
		return con;
	}
}
