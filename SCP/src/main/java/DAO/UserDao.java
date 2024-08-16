package DAO;


import java.sql.*;

import entities.User;
public class UserDao {
	private Connection con;
	
	public UserDao(Connection con) {
		this.con=con;
	}
	
	//method to insert user to reg_tbl
	public boolean saveUser(User user) {
		boolean f=false;
				try {

					String query="INSERT INTO reg_tbl( name, email, password, rollno) values (?,?,?,?)";
					 
				
					PreparedStatement stmt = this.con.prepareStatement(query);
					stmt.setString(1, user.getFullname());
					stmt.setString(2, user.getEmail());	
					stmt.setString(3, user.getPassword());
					stmt.setString(4, user.getRollno());
					
					stmt.executeUpdate();
					f=true;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				
				}
				catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return f;
			
	}
	
	//method to get user by email and password
	public User getUserByEmailPassword(String email, String password) {
		User user = null;
		
		try {
			
			
			String query="SELECT * FROM reg_tbl where email=? and password=?";
			
			
			PreparedStatement stmt=con.prepareStatement(query);
			
			
			stmt.setString(1, email);
			stmt.setString(2, password);
			
			ResultSet result=stmt.executeQuery();
			
			
			if(result.next()) {
				 user=new User();
				
				 
				 String name = result.getString("name");
				//set to user obj
				user.setFullname(result.getString("name"));
				user.setId(result.getInt("id"));
				user.setEmail(result.getString("email"));
				user.setRollno(result.getString("rollno"));
				user.setPassword(result.getString("password"));
				user.setRdatetime(result.getTimestamp("rdatetime"));
				user.setProfile(result.getString("profile"));
							}
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		return user;
		
	}
	
	
	//method to update the editted fields in u_profile
	public boolean updateUser(User user) {
		
		boolean f=false;
		try {
			System.out.print(user);
			String query="UPDATE reg_tbl SET name=?, email=?, password=?, profile=? where id=?";
			
			PreparedStatement stmt=con.prepareStatement(query);
			stmt.setString(1, user.getFullname());
			stmt.setString(2, user.getEmail());
			stmt.setString(3, user.getPassword());
			stmt.setString(4, user.getProfile());
			stmt.setInt(5, user.getId());
			
			stmt.executeUpdate();
			f =true;
			
			
		} catch (Exception e) {
		e.printStackTrace();	
		}
		return f;
	}
	

}
