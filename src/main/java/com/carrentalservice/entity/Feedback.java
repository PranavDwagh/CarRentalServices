package com.carrentalservice.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="feedback")
public class Feedback {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="feedback_id")
	private int id;
	@Column(name="customer_id")
	private int customerId;
	@Column(name="ongoing_id")
	private int ongoingId;
	@Column(name="customer_rating")
	private int customerRating;
	@Column(name="description")
	private String description;
	
	public Feedback() {
		// TODO Auto-generated constructor stub
	}

	public Feedback(int id, int customerId, int ongoingId, int customerRating, String description) {
		super();
		this.id = id;
		this.customerId = customerId;
		this.ongoingId = ongoingId;
		this.customerRating = customerRating;
		this.description = description;
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

	public int getOngoingId() {
		return ongoingId;
	}

	public void setOngoingId(int ongoingId) {
		this.ongoingId = ongoingId;
	}

	public int getCustomerRating() {
		return customerRating;
	}

	public void setCustomerRating(int customerRating) {
		this.customerRating = customerRating;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "Feedback [id=" + id + ", customerId=" + customerId + ", ongoingId=" + ongoingId + ", customerRating="
				+ customerRating + ", description=" + description + "]";
	}
}