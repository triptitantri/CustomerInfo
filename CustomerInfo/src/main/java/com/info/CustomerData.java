package com.info;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="CUSTOMER")
public class CustomerData {
	
  @Id
  @GeneratedValue(strategy= GenerationType.IDENTITY)
  @Column(name="ID", nullable = false)
  private int id;
  
   
  @Column(name="NAME", nullable = false)
  private String name;
  
  @Column(name="MailID", nullable = false)
  private String mail;

  @Column(name="Address", nullable = false)
  private String address;
  
  @Column(name="Phone", nullable = false)
  private String phone;
  
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
  
  public String getPhone() {
	    return phone;
	  }
	  
  public void setphone(String phone) {
	    this.phone = phone;
	  }
	  
  public String getMail() {
	    return mail;
	  }
	  
	  public void setMail(String mail) {
	    this.mail = mail;
	  }
	  
	  public String getAddress() {
		    return address;
		  }
		  
		  public void setAddress(String address) {
		    this.address = address;
		  }
}