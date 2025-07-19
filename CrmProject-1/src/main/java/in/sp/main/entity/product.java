package in.sp.main.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class product {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
  private int id;
	
  private String coursename;
  private String syllabus;
  private String originalprice;
  private String discountedprice;
  private String coursevalidity;
  private String courseimage;
  private String trainersname;
  private String trainersdetails;
  private String trainersimage;
  private String otherdetails;
  
public String getOtherdetails() {
	return otherdetails;
}
public void setOtherdetails(String otherdetails) {
	this.otherdetails = otherdetails;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getCoursename() {
	return coursename;
}
public void setCoursename(String coursename) {
	this.coursename = coursename;
}
public String getSyllabus() {
	return syllabus;
}
public void setSyllabus(String syllabus) {
	this.syllabus = syllabus;
}
public String getOriginalprice() {
	return originalprice;
}
public void setOriginalprice(String originalprice) {
	this.originalprice = originalprice;
}
public String getDiscountedprice() {
	return discountedprice;
}
public void setDiscountedprice(String discountedprice) {
	this.discountedprice = discountedprice;
}
public String getCoursevalidity() {
	return coursevalidity;
}
public void setCoursevalidity(String coursevalidity) {
	this.coursevalidity = coursevalidity;
}
public String getCourseimage() {
	return courseimage;
}
public void setCourseimage(String courseimage) {
	this.courseimage = courseimage;
}
public String getTrainersname() {
	return trainersname;
}
public void setTrainersname(String trainersname) {
	this.trainersname = trainersname;
}
public String getTrainersdetails() {
	return trainersdetails;
}
public void setTrainersdetails(String trainersdetails) {
	this.trainersdetails = trainersdetails;
}
public String getTrainersimage() {
	return trainersimage;
}
public void setTrainersimage(String trainersimage) {
	this.trainersimage = trainersimage;
}
  
  
  
 
}
