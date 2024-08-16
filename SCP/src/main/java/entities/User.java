package entities;

import java.sql.Timestamp;

public class User {



	private String profile;
	private String name;
	private String email;
	private String rollno;
	private String password;
	private int id;
	private Timestamp rdatetime;

	public User() {
	}




	public User(String name, String email, String rollno, String password) {
		super();
		this.name = name;
		this.email = email;
		this.rollno = rollno;
		this.password = password;
	}







	public User(String name, String email, String rollno, String password, int id, Timestamp rdatetime) {
		super();
		this.name = name;
		this.email = email;
		this.rollno = rollno;
		this.password = password;
		this.id = id;
		this.rdatetime = rdatetime;
	}







	public String getFullname() {
		return name;
	}
	public void setFullname(String fullname) {
		this.name = fullname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRollno() {
		return rollno;
	}
	public void setRollno(String rollno) {
		this.rollno = rollno;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Timestamp getRdatetime() {
		return rdatetime;
	}
	public void setRdatetime(Timestamp timestamp) {
		this.rdatetime = timestamp;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}


	


}
