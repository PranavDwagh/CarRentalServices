package com.carrentalservice.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="payment")
public class Payment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="payment_id")
	private int id;
	@Column(name="customer_id")
	private int customerId;
	@Column(name="vehicle_id")
	private int vehicleId;
	@Column(name="amount")
	private int amount;
	@Column(name="payment_date")
	private String payment_date;
	@Column(name="payment_time")
	private String payment_time;
	
	public Payment() {
		// TODO Auto-generated constructor stub
	}

	public Payment(int id, int customerId, int vehicleId, int amount, String payment_date,
			String payment_time) {
		super();
		this.id = id;
		this.customerId = customerId;
		this.vehicleId = vehicleId;
		this.amount = amount;
		this.payment_date = payment_date;
		this.payment_time = payment_time;
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

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}

	public String getPayment_time() {
		return payment_time;
	}

	public void setPayment_time(String payment_time) {
		this.payment_time = payment_time;
	}

	@Override
	public String toString() {
		return "Payment [id=" + id + ", customerId=" + customerId + ", vehicleId=" + vehicleId + ", amount=" + amount + ", payment_date=" + payment_date + ", payment_time=" + payment_time
				+ "]";
	}
	
	
}