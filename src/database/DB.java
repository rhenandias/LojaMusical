package database;

import java.sql.Connection;
import java.sql.ResultSet;

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

}
