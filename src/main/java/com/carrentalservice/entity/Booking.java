package com.carrentalservice.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity(name="booking")
public class Booking {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="ongoing_id")
	private int id;
	@Column(name="customer_id")
	private int customerId;
	@Column(name="vehicle_id")
	private int vehicleId;
	@Column(name="driver_id")
	private int driverId;
	@Column(name="payment_id")
	private int paymentId;
	@Column(name="booking_time",columnDefinition="varchar(50) default (curtime())")
	private String bookingTime;
	@Column(name="booking_date",columnDefinition="varchar(50) default (curdate())")
	private String bookingDate;
	@Column(name="journey_time")
	private String journeyTime;
	@Column(name="journey_date")
	private String journeyDate;
	/*
	 * @Column(name="Total_ride_price") private int totalPrice;
	 */         // to be removed from database
	@Column(name="source")
	private String source;
	@Column(name="destination")
	private String destination;
	@Column(name="ride_status", columnDefinition="int default 1")
	private int rideStatus;
	
	public Booking() {
		// TODO Auto-generated constructor stub
	}
	
	public Booking(int id, int customerId, int vehicleId, int driverId, int paymentId, String bookingTime,
			String bookingDate, String journeyTime, String journeyDate, String source,
			String destination, int rideStatus) {
	
		this.id = id;
		this.customerId = customerId;
		this.vehicleId = vehicleId;
		this.driverId = driverId;
		this.paymentId = paymentId;
		this.bookingTime = bookingTime;
		this.bookingDate = bookingDate;
		this.journeyTime = journeyTime;
		this.journeyDate = journeyDate;
		this.source = source;
		this.destination = destination;
		this.rideStatus = rideStatus;
	}

	public int getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public int getVehicleId() {
		return vehicleId;
	}

	public void setVehicleId(int vehicleId) {
		this.vehicleId = vehicleId;
	}

	public int getDriverId() {
		return driverId;
	}

	public void setDriverId(int driverId) {
		this.driverId = driverId;
	}

	public String getBookingTime() {
		return bookingTime;
	}

	public void setBookingTime(String bookingTime) {
		this.bookingTime = bookingTime;
	}

	public String getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
	}

	public String getJourneyTime() {
		return journeyTime;
	}

	public void setJourneyTime(String journeyTime) {
		this.journeyTime = journeyTime;
	}

	public String getJourneyDate() {
		return journeyDate;
	}

	public void setJourneyDate(String journeyDate) {
		this.journeyDate = journeyDate;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public int getRideStatus() {
		return rideStatus;
	}

	public void setRideStatus(int rideStatus) {
		this.rideStatus = rideStatus;
	}

	@Override
	public String toString() {
		return "Booking [id=" + id + ", customerId=" + customerId + ", vehicleId=" + vehicleId + ", driverId="
				+ driverId + ", paymentId=" + paymentId + ", bookingTime=" + bookingTime + ", bookingDate="
				+ bookingDate + ", journeyTime=" + journeyTime + ", journeyDate=" + journeyDate + 
				", source=" + source + ", destination=" + destination + ", rideStatus=" + rideStatus
				+ "]";
	}

	
	
}
