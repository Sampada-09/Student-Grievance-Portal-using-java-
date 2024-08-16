package entities;

public class Category {

	private int cat_id;
	private String cat_name;
	private String cat_description;
	
	
	public Category() {
		
	}
	public Category(String cat_name, String cat_description) {
		super();
		this.cat_name = cat_name;
		this.cat_description = cat_description;
	}
	public Category(int cat_id, String cat_name, String cat_description) {
		super();
		this.cat_id = cat_id;
		this.cat_name = cat_name;
		this.cat_description = cat_description;
	}
	
	public int getId() {
		return cat_id;
	}
	public void setId(int id) {
		this.cat_id = id;
	}
	public String getName() {
		return cat_name;
	}
	public void setName(String name) {
		this.cat_name = name;
	}
	public String getDescription() {
		return cat_description;
	}
	public void setDescription(String description) {
		this.cat_description = description;
	}
	
	
	
}
