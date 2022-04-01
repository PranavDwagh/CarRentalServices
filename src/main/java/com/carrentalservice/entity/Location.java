package com.carrentalservice.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="location")
public class Location {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="location_id")
	private int id;
	@Column(name="source")
	private String source;
	@Column(name="destination")
	private String destination;
	@Column(name="distance")
	private int distance;
	
	public Location() {
		// TODO Auto-generated constructor stub
	}

	public Location(int id, String source, String destination, int distance) {
		super();
		this.id = id;
		this.source = source;
		this.destination = destination;
		this.distance = distance;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public int getDistance() {
		return distance;
	}

	public void setDistance(int distance) {
		this.distance = distance;
	}
}