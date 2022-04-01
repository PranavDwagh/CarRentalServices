package com.carrentalservice.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.carrentalservice.dao.VehicleDAO;
import com.carrentalservice.entity.Vehicle;


@RestController
@RequestMapping("vehicleController")
public class VehicleController {

	@Autowired
	VehicleDAO dao;
	
	@GetMapping("/getAllVehicles")
	public List<Vehicle> getAllVehicles(Model model)
	{
		 List<Vehicle> list =dao.getAll();
		
		 return list;
	}
	
	@PostMapping("/add")
	public void addVehicle(@RequestBody Vehicle obj)
	{
		System.out.println(obj);
		dao.addVehicle(obj);
	}
	
	@GetMapping("/choosevehicle/{id}")
	public Vehicle getVehicleById(@PathVariable("id") String i, HttpSession session)
	{
		int id = Integer.parseInt(i);
		Vehicle vehicle =  dao.getById(id, session);
		return vehicle;
	}
	
	@GetMapping("/getavaiblevehicle")
	public List<Vehicle> getAvailableVehicle()
	{
		List<Vehicle> list = dao.getAvailableVehicle();
		return list;
	}
}