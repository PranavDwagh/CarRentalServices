package com.carrentalservice.entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="customer_details")
public class Customer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="customer_id")
	private int id;
	@Column(name="customer_firstname")
	private String firstname;
	@Column(name="customer_lastname")
	private String lastname;
	@Column(name="customer_contact_number")
	private String contactNo;
	@Column(name="customer_username")
	private String username;
	@Column(name="customer_password")
	private String password;
	@Column(name="customer_email")
	private String email;
	@Column(name="customer_city")
	private String city;
	@Column(name="customer_pincode")
	private int pincode;
	@Column(name="customer_state")
	private String state;
	
	public Customer(int id, String firstname, String lastname, String contactNo, String username, String password,
			String email, String city, int pincode, String state) 
	{
		this.id = id;
		this.firstname = firstname;
		this.lastname = lastname;
		this.contactNo = contactNo;
		this.username = username;
		this.password = password;
		this.email = email;
		this.city = city;
		this.pincode = pincode;
		this.state = state;
	}
	
	public Customer() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getPincode() {
		return pincode;
	}

	public void setPincode(int pincode) {
		this.pincode = pincode;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
 
	@Override
	public String toString() {
		return "Customer [id=" + id + ", firstname=" + firstname + ", lastname=" + lastname + ", contactNo=" + contactNo
				+ ", username=" + username + ", password=" + password + ", email=" + email + ", city=" + city
				+ ", pincode=" + pincode + ", state=" + state + "]";
	}
	
}