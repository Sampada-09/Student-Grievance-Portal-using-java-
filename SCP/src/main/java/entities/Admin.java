package entities;

public class Admin {

	
	private int id;
	private String name;
	private String designation;
	private String email;
	private String password;
	
	
	
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Admin(String name, String designation, String email,String password) {
		super();
		this.name = name;
		this.designation = designation;
		this.email=email;
		this.password=password;
	}
	public Admin(int id, String name, String designation, String email,String password) {
		super();
		this.id = id;
		this.name = name;
		this.designation = designation;
		this.email=email;
		this.password=password;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
}
