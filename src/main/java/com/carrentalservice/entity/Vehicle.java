package com.carrentalservice.entity;

import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;

@Entity(name = "vehicle")
public class Vehicle {
	@Id
	private int vehicle_id;
	@Column
	private String vehicle_name;
	@Column
	private String vehicle_brand_name;
	@Column
	private String vehicle_type;
	@Column
	private int vehicle_seating_capacity;
	@Column
	private int vehicle_price_per_km;
	@Column
	private String vehicle_fuel_type;
	@Column(name="vehicle_status")
	private int vehicle_status;
	@Column
	@Lob
	private Blob vehicle_image;
	
	public Vehicle() {
		
	}


	public Vehicle(String vehicle_name, String vehicle_brand_name, String vehicle_type,
			int vehicle_seating_capacity, int vehicle_price_per_km, String vehicle_fuel_type, Blob vehicle_image) {
		this.vehicle_name = vehicle_name;
		this.vehicle_brand_name = vehicle_brand_name;
		this.vehicle_type = vehicle_type;
		this.vehicle_seating_capacity = vehicle_seating_capacity;
		this.vehicle_price_per_km = vehicle_price_per_km;
		this.vehicle_fuel_type = vehicle_fuel_type;
		this.vehicle_image = vehicle_image;
	}
	
	public Vehicle(int vehicle_id, String vehicle_name, String vehicle_brand_name, String vehicle_type,
			int vehicle_seating_capacity, int vehicle_price_per_km, String vehicle_fuel_type) {
		this.vehicle_id = vehicle_id;
		this.vehicle_name = vehicle_name;
		this.vehicle_brand_name = vehicle_brand_name;
		this.vehicle_type = vehicle_type;
		this.vehicle_seating_capacity = vehicle_seating_capacity;
		this.vehicle_price_per_km = vehicle_price_per_km;
		this.vehicle_fuel_type = vehicle_fuel_type;
	}
	public int getVehicle_id() {
		return vehicle_id;
	}
	public void setVehicle_id(int vehicle_id) {
		this.vehicle_id = vehicle_id;
	}
	public String getVehicle_name() {
		return vehicle_name;
	}
	public void setVehicle_name(String vehicle_name) {
		this.vehicle_name = vehicle_name;
	}
	public String getVehicle_brand_name() {
		return vehicle_brand_name;
	}
	public void setVehicle_brand_name(String vehicle_brand_name) {
		this.vehicle_brand_name = vehicle_brand_name;
	}
	public String getVehicle_type() {
		return vehicle_type;
	}
	public void setVehicle_type(String vehicle_type) {
		this.vehicle_type = vehicle_type;
	}
	public int getVehicle_seating_capacity() {
		return vehicle_seating_capacity;
	}
	public void setVehicle_seating_capacity(int vehicle_seating_capacity) {
		this.vehicle_seating_capacity = vehicle_seating_capacity;
	}
	public int getVehicle_price_per_km() {
		return vehicle_price_per_km;
	}
	public void setVehicle_price_per_km(int vehicle_price_per_km) {
		this.vehicle_price_per_km = vehicle_price_per_km;
	}
	public String getVehicle_fuel_type() {
		return vehicle_fuel_type;
	}
	public void setVehicle_fuel_type(String vehicle_fuel_type) {
		this.vehicle_fuel_type = vehicle_fuel_type;
	}
	
	public Blob getVehicle_image() {
		return vehicle_image;
	}
	
	public int getVehicle_status() {
		return vehicle_status;
	}

	public void setVehicle_status(int vehicle_status) {
		this.vehicle_status = vehicle_status;
	}
	
	public void setVehicle_image(Blob vehicle_image) {
		this.vehicle_image = vehicle_image;
	}
}  //end of Vehicle