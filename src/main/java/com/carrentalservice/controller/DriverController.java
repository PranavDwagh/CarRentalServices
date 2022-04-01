package com.carrentalservice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.carrentalservice.dao.DriverDAO;
import com.carrentalservice.entity.Driver;


@RestController
@RequestMapping("driver")
public class DriverController {

	@Autowired
	DriverDAO dao;
	
	@GetMapping("/getAll")
	public List<Driver> getAll()
	{
		List<Driver> list =  dao.getAll();
		return list;
	}
	
	@PostMapping("/add")
	public void addDriver(@RequestBody Driver driver)
	{
		dao.addDriver(driver);
	}
	
	@PostMapping("/delete/{id}")
	public void deleteDriver(@PathVariable("id") String i)
	{
		int id = Integer.parseInt(i);
		dao.deleteDriver(id);
	}
	
	@PostMapping("/togglestate/{id}")
	public void toggleDriverStatus(@PathVariable("id") String i)
	{
		int id = Integer.parseInt(i);
		dao.toggleStatus(id);
	}
	
	@GetMapping("/assignDriver")
	public void assignDriver()
	{
		dao.assignDriver();     // after invoking this method automatically driver will be assign and his id will be stored in the session
	}
	
	@PostMapping("/update")
	public void updateDriver(@RequestBody Driver driver)
	{
		dao.updateDriver(driver);
	}
	
	@PostMapping("/getDriverById/{driverId}")
	public Driver getDriverById(@PathVariable int driverId) {
		System.out.println(dao.getDriverById(driverId));
		return dao.getDriverById(driverId);
	} //end of deleteDriverById();
}
