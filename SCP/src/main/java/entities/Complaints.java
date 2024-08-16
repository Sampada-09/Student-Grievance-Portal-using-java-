package entities;

import java.sql.Timestamp;

public class Complaints {

    private int comp_id;
    private int user_id;
    private int cat_id;
    private String comp_description;
    private String comp_uploads;
    private Timestamp created_at;
    private String comp_status;
    private String comp_remark;
    private String recipient;

    public Complaints() {
        super();
    }

    public Complaints(int user_id, int cat_id, String comp_description, String comp_uploads, String recipient) {
        super();
        this.user_id = user_id;
        this.cat_id = cat_id;
        this.comp_description = comp_description;
        this.comp_uploads = comp_uploads;
        this.recipient = recipient;
    }

    public Complaints(int comp_id, int user_id, int cat_id, String comp_description, String comp_uploads,
            Timestamp created_at, String comp_status, String comp_remark, String recipient) {
        super();
        this.comp_id = comp_id;
        this.user_id = user_id;
        this.cat_id = cat_id;
        this.comp_description = comp_description;
        this.comp_uploads = comp_uploads;
        this.created_at = created_at;
        this.comp_status = comp_status;
        this.comp_remark = comp_remark;
        this.recipient = recipient;
    }

	public Complaints(int comp_id, int user_id, String comp_description, String comp_uploads, Timestamp created_at,
			String comp_status, String comp_remark, String recipient) {
		super();
		this.comp_id = comp_id;
		this.user_id = user_id;
		this.comp_description = comp_description;
		this.comp_uploads = comp_uploads;
		this.created_at = created_at;
		this.comp_status = comp_status;
		this.comp_remark = comp_remark;
		this.recipient = recipient;
	}

	public int getComp_id() {
		return comp_id;
	}

	public void setComp_id(int comp_id) {
		this.comp_id = comp_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getCat_id() {
		return cat_id;
	}

	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}

	public String getComp_description() {
		return comp_description;
	}

	public void setComp_description(String comp_description) {
		this.comp_description = comp_description;
	}

	public String getComp_uploads() {
		return comp_uploads;
	}

	public void setComp_uploads(String comp_uploads) {
		this.comp_uploads = comp_uploads;
	}

	public Timestamp getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}

	public String getComp_status() {
		return comp_status;
	}

	public void setComp_status(String comp_status) {
		this.comp_status = comp_status;
	}

	public String getComp_remark() {
		return comp_remark;
	}

	public void setComp_remark(String comp_remark) {
		this.comp_remark = comp_remark;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

    // Getters and setters
    
}
