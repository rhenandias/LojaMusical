package database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class DB {
	
	public static Connection getConnection() {
		try {
			DBConnection db = new DBConnection();
			return db.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static ResultSet executarQuery(String query) {
		try {
			DBConnection db = new DBConnection();
			return db.getConnection().createStatement().executeQuery(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static ResultSet executarQuery(String query, boolean querRetornarID) {
		try {
			DBConnection db = new DBConnection();
			if (!querRetornarID) {
			return db.getConnection().createStatement().executeQuery(query);
			} else {
				Statement st = db.getConnection().createStatement();
				st.executeUpdate(query, Statement.RETURN_GENERATED_KEYS);
				return st.getGeneratedKeys();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	

}
