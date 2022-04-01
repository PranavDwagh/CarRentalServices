package com.carrentalservice.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="driver_details")
public class Driver {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="driver_id")
	private int id;
	@Column(name="driver_firstname")
	private String firstname;
	@Column(name="driver_lastname")
	private String lastname;
	@Column(name="driver_contact_number")
	private String constactNo;
	@Column(name="driver_license")
	private String license;
	@Column(name="driver_status")
	private int status;
	@Column(name="driver_city")
	private String city;
	@Column(name="driver_pincode")
	private int pincode;
	@Column(name="driver_state")
	private String state;
	
	public Driver() {
		// TODO Auto-generated constructor stub
	}
	public Driver(String firstname, String lastname, String constactNo, String license, int status, String city,
			int pincode, String state) {
		this.firstname = firstname;
		this.lastname = lastname;
		this.constactNo = constactNo;
		this.license = license;
		this.status = status;
		this.city = city;
		this.pincode = pincode;
		this.state = state;
	}
	public Driver(int id, String firstname, String lastname, String constactNo, String license, int status, String city,
			int pincode, String state) {
		
		this.id = id;
		this.firstname = firstname;
		this.lastname = lastname;
		this.constactNo = constactNo;
		this.license = license;
		this.status = status;
		this.city = city;
		this.pincode = pincode;
		this.state = state;
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
	public String getConstactNo() {
		return constactNo;
	}
	public void setConstactNo(String constactNo) {
		this.constactNo = constactNo;
	}
	public String getLicense() {
		return license;
	}
	public void setLicense(String license) {
		this.license = license;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
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
		return "Driver [id=" + id + ", firstname=" + firstname + ", lastname=" + lastname + ", constactNo=" + constactNo
				+ ", license=" + license + ", status=" + status + ", city=" + city + ", pincode=" + pincode + ", state="
				+ state + "]";
	}
}