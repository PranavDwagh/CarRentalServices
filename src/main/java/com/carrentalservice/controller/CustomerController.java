package com.carrentalservice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.carrentalservice.dao.CustomerDAO;
import com.carrentalservice.entity.Customer;

@CrossOrigin
@RestController
@RequestMapping("carrentalservices")
public class CustomerController {
	
	@Autowired
	CustomerDAO dao;
	
	//http://localhost:8080/CustomerLogin/customerlogin.html
	
	@GetMapping("/verify/{username}/{password}")
	public boolean verifyCustomer(@PathVariable String username, @PathVariable String password)
	{
		boolean status = false;
		status = dao.verify(username, password);
		return status;
	}
	
	@PostMapping("/add")
	public boolean addCustomer(@RequestBody Customer obj)
	{
		boolean status = false;
		status = dao.addCustomer(obj);
		System.out.println(obj);
		return status;
	}
	
	@GetMapping("/getAll")
	public List<Customer> getAllCustomer()
	{
		return dao.getAll();
	}
	
	@PostMapping("/deletecustomer/{id}")
	public void deleteCustomer(@RequestParam String i)
	{
		int id = Integer.parseInt(i);
		dao.deleteCustomer(id);
	}
	
	@PostMapping("/update")
	public void updateCustomer(@RequestBody Customer obj)
	{
		dao.update(obj);
	}
	
}
