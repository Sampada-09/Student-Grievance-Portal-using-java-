package DAO;

import java.sql.*;

import java.util.ArrayList;
import java.util.List;

import entities.Category;
import entities.Complaints;

public class CompDAO {

	private Connection con;



	public CompDAO(Connection con) {

		this.con = con;
	}



	public ArrayList<Category> getAllCategories() {
		ArrayList<Category> list = new ArrayList<>();

		try {
			String query = "SELECT * FROM category_tbl";

			Statement stmt = this.con.createStatement();
			ResultSet set = stmt.executeQuery(query);
			while (set.next()) {
				int id = set.getInt("cat_id");
				String name = set.getString("cat_name");
				String desc = set.getString("description");
				Category category = new Category(id, name, desc);
				list.add(category);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}


	public boolean saveComp(Complaints comp) {
		boolean f = false;

		try {
			String query = "INSERT INTO comp_tbl(user_id, cat_id, comp_description, comp_uploads, admin_id) VALUES (?, ?, ?, ?, ?)";

			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setInt(1, comp.getUser_id());
			stmt.setInt(2, comp.getCat_id());
			stmt.setString(3, comp.getComp_description());
			stmt.setString(4, comp.getComp_uploads());
			stmt.setString(5, comp.getRecipient());
			stmt.executeUpdate();
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Complaints> getAllComp(int adminId) {
	    List<Complaints> list = new ArrayList<>();

	    // Fetch all the complaints

	    try {
	        PreparedStatement stmt;
	        ResultSet set;

	        if (adminId == 1) {
	            // Fetch all complaints for admin ID 1
	            stmt = con.prepareStatement("SELECT * FROM comp_tbl");
	            set = stmt.executeQuery();
	        } else {
	            // Fetch complaints addressed to the specific admin
	            stmt = con.prepareStatement("SELECT * FROM comp_tbl WHERE admin_id = ?");
	            stmt.setInt(1, adminId);
	            set = stmt.executeQuery();
	        }

	        while (set.next()) {
	            int comp_id = set.getInt("comp_id");
	            int cat_id = set.getInt("cat_id");
	            int user_id = set.getInt("user_id");
	            String desc = set.getString("comp_description");
	            String upload = set.getString("comp_uploads");
	            Timestamp rdate = set.getTimestamp("comp_created_at");
	            String status = set.getString("comp_status");
	            String remark = set.getString("comp_remark");
	            String recipient = set.getString("admin_id");

	            Complaints com = new Complaints(comp_id, cat_id, user_id, desc, upload, rdate, status, remark, recipient);
	            list.add(com);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}



	public List<Complaints> getCompbyCatId(int cat_id, int adminId) {
		List<Complaints> list=new ArrayList<Complaints>();

		//fetch complaints by category id
		try {

			PreparedStatement stmt=con.prepareStatement("SELECT * FROM comp_tbl where cat_id=? AND admin_id=?");

			stmt.setInt(1, cat_id);
			stmt.setInt(2, adminId);

			ResultSet set=stmt.executeQuery();

			while (set.next()) {

				int comp_id=set.getInt("comp_id");
				int user_id=set.getInt("user_id");
				String desc=set.getString("comp_description");
				String upload=set.getString("comp_uploads");
				Timestamp rdate=set.getTimestamp("comp_created_at");
				String status=set.getString("comp_status");
				String remark=set.getString("comp_remark");
				String recipient=set.getString("admin_id");

				Complaints com=new Complaints(comp_id, user_id, desc, upload, rdate,status,remark, recipient);

				list.add(com);
			}	

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Complaints getCompbyCompId(int compId) {
		Complaints com = null;
		System.out.print("hello" + compId);

		String query = "SELECT * FROM comp_tbl where comp_id=?";

		try (PreparedStatement stmt = this.con.prepareStatement(query)) {
			stmt.setInt(1, compId);

			ResultSet set = stmt.executeQuery();

			if (set.next()) {
				int comp_id = set.getInt("comp_id");
				int userId = set.getInt("user_id");
				int catId = set.getInt("cat_id");
				String desc = set.getString("comp_description"); // Corrected column name
				String uploads = set.getString("comp_uploads");
				Timestamp submiton = set.getTimestamp("comp_created_at");
				String status = set.getString("comp_status");
				String remark = set.getString("comp_remark");
				String recipient=set.getString("admin_id");

				// Use an existing constructor that matches the parameters
				com = new Complaints(comp_id, userId, catId, desc, uploads, submiton, status, remark,recipient);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.print(com);
		return com;
	}


	public List<Complaints> getCompbyUserId(int userid) {
		List<Complaints> list=new ArrayList<Complaints>();
		//fetch complaints by category id
		try {

			PreparedStatement stmt=con.prepareStatement("SELECT * FROM comp_tbl where user_id=?");
			stmt.setInt(1, userid);

			ResultSet set=stmt.executeQuery();

			while (set.next()) {

				int comp_id=set.getInt("comp_id");
				int cat_id=set.getInt("cat_id");
				int user_id=set.getInt("user_id");

				String desc=set.getString("comp_description");
				String upload=set.getString("comp_uploads");
				Timestamp rdate=set.getTimestamp("comp_created_at");
				String status=set.getString("comp_status");
				String remark=set.getString("comp_remark");
				String recipient=set.getString("admin_id");

				Complaints comp=new Complaints(comp_id, cat_id, user_id, desc, upload, rdate, status, remark, recipient);


				list.add(comp);
			}	

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean updateComp(int compId, String status, String remark) {
		boolean f = false;

		try {
			String query = "UPDATE comp_tbl SET comp_status=?, comp_remark=? WHERE comp_id=?";
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setString(1, status);
			stmt.setString(2, remark);
			stmt.setInt(3, compId);

			int rowsAffected = stmt.executeUpdate();
			if (rowsAffected > 0) {
				f = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return f;
	}
	
	//to fetch pending cases
	public List<Complaints> getStatus(String statusId, int adminId) {
		List<Complaints> list=new ArrayList<Complaints>();

		//fetch complaints by status
		try {

			System.out.print(statusId);
			PreparedStatement stmt=con.prepareStatement("SELECT * FROM comp_tbl where status=? AND admin_id=?");

			stmt.setString(1, statusId);
			stmt.setInt(2, adminId);

			ResultSet set=stmt.executeQuery();

			while (set.next()) {

				int comp_id=set.getInt("comp_id");
				int user_id=set.getInt("user_id");
				String desc=set.getString("comp_description");
				String upload=set.getString("comp_uploads");
				Timestamp rdate=set.getTimestamp("comp_created_at");
				String status=set.getString("comp_status");
				String remark=set.getString("comp_remark");
				String recipient=set.getString("admin_id");

				Complaints com=new Complaints(comp_id, user_id, desc, upload, rdate,status,remark, recipient);

				list.add(com);
			}	

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
