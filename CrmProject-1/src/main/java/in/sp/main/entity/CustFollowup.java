package in.sp.main.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="customer_folloup_date")
public class CustFollowup {
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Id
    private int id;
	@Column(name="phone_no")
	private String phoneno;
	@Column(name="followup_date")
	private String followupdate;
	public int getId() {
		return id;
	}
	
	
	public void setId(int id) {
		this.id = id;
	}
	public String getPhoneno() {
		return phoneno;
	}
	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}
	public String getFollowupdate() {
		return followupdate;
	}
	public void setFollowupdate(String followupdate) {
		this.followupdate = followupdate;
	}
	

}
