package com.carrentalservice.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.carrentalservice.DriverRepo;
import com.carrentalservice.entity.Driver;


@Component
public class DriverDAO {

	@Autowired
	DriverRepo driverRepo;
	
	@Autowired
	Session session;
	
	public List<Driver> getAll() {
		
		return driverRepo.findAll();
	}

	public void addDriver(Driver driver) {

		Driver newObj =  driverRepo.save(driver);
		System.out.println(newObj);
	}

	public void deleteDriver(int id) {

		Driver obj = driverRepo.findById(id).get();
		
		if(obj!=null)
		{
			driverRepo.delete(obj);
		}
	}

	public void toggleStatus(int id) {
		
		Driver obj = driverRepo.findById(id).get();
		
		if(obj.getStatus()==1)
		{
			obj.setStatus(0);
		}
		else
		{
			obj.setStatus(1);
		}
		driverRepo.save(obj);
	}

	public void assignDriver(HttpSession session) {

		Driver driver = driverRepo.assignDriver();
		
		if(driver!=null)
		{
			driver.setStatus(0);
			driverRepo.save(driver);
			session.setAttribute("driverId", driver.getId());
		}
		
	}

	public void updateDriver(Driver driver) {

		/*
		 * Driver obj = driverRepo.findById(driver.getId()).get();
		 * 
		 * if(obj!=null) { obj.setCity(driver.getCity()); }
		 */
		
		driverRepo.save(driver);         //TODO
	}
	
	public Driver getDriverById(int driverId) {
		return driverRepo.getDriverById(driverId);
	}
	
	
}
