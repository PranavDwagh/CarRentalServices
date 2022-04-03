package com.carrentalservice.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="booking")
public class Booking {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column
	private int ongoing_id;
	@Column
	private int customer_id;
	@Column
	private int vehicle_id;
	@Column
	private int driver_id;
	@Column
	private int payment_id;
	@Column
	private String booking_time;
	@Column
	private String booking_date;
	@Column
	private String journey_time;
	@Column
	private String journey_date;
	
	@Column
	private String source;
	@Column
	private String destination;
	@Column
	private int ride_status;
	
	public Booking() {
		// TODO Auto-generated constructor stub
	}

	public Booking(int ongoing_id, int customer_id, int vehicle_id, int driver_id, int payment_id, String booking_time,
			String booking_date, String journey_time, String journey_date, int total_ride_price, String source,
			String destination, int ride_status) {
		super();
		this.ongoing_id = ongoing_id;
		this.customer_id = customer_id;
		this.vehicle_id = vehicle_id;
		this.driver_id = driver_id;
		this.payment_id = payment_id;
		this.booking_time = booking_time;
		this.booking_date = booking_date;
		this.journey_time = journey_time;
		this.journey_date = journey_date;
	
		this.source = source;
		this.destination = destination;
		this.ride_status = ride_status;
	}

	public int getOngoing_id() {
		return ongoing_id;
	}

	public void setOngoing_id(int ongoing_id) {
		this.ongoing_id = ongoing_id;
	}

	public int getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}

	public int getVehicle_id() {
		return vehicle_id;
	}

	public void setVehicle_id(int vehicle_id) {
		this.vehicle_id = vehicle_id;
	}

	public int getDriver_id() {
		return driver_id;
	}

	public void setDriver_id(int driver_id) {
		this.driver_id = driver_id;
	}

	public int getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
	}

	public String getBooking_time() {
		return booking_time;
	}

	public void setBooking_time(String booking_time) {
		this.booking_time = booking_time;
	}

	public String getBooking_date() {
		return booking_date;
	}

	public void setBooking_date(String booking_date) {
		this.booking_date = booking_date;
	}

	public String getJourney_time() {
		return journey_time;
	}

	public void setJourney_time(String journey_time) {
		this.journey_time = journey_time;
	}

	public String getJourney_date() {
		return journey_date;
	}

	public void setJourney_date(String journey_date) {
		this.journey_date = journey_date;
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

	public int getRide_status() {
		return ride_status;
	}

	public void setRide_status(int ride_status) {
		this.ride_status = ride_status;
	}
	
	
}