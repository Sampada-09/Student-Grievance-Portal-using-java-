package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import entities.Admin;

public class AdminDAO {
private Connection con;
	
	
	
	public AdminDAO(Connection con) {
	super();
	this.con = con;
}



	//method to get user by email and password
	public Admin getAdminByEmailPassword(String email, String password) {
		Admin ad = null;
		
		try {
			
			
			String query="SELECT * FROM admin_tbl where email=? and password=?";
			
			
			PreparedStatement stmt=con.prepareStatement(query);
			
			
			stmt.setString(1, email);
			stmt.setString(2, password);
			
			ResultSet result=stmt.executeQuery();
			
			
			if(result.next()) {
				 ad=new Admin();
				
				 
				 String name = result.getString("name");
				//set to user obj
				 ad.setId(result.getInt("adminId"));
				 ad.setName(result.getString("name"));
				 ad.setEmail(result.getString("email"));
				 ad.setDesignation(result.getString("designation"));
				 ad.setPassword(result.getString("password"));
				
							}
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		return ad;
		
	}
}
