package com.carrentalservice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@Autowired
	HttpServletRequest request;
	
	//http://localhost:8080/CustomerLogin/customerlogin.html
	
	@GetMapping("/verify/{username}/{password}")
	public boolean verifyCustomer(@PathVariable String username,
			@PathVariable String password/* , HttpServletRequest request */)
	{
		HttpSession session = request.getSession();
		boolean status = false;
		status = dao.verify(username, password, session);
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
	public void updateCustomer(@RequestBody Customer obj/* , HttpServletRequest request */)
	{
		dao.update(obj, request.getSession());
	}
	
	@GetMapping("/getbyid")
	public Customer getById(/* HttpServletRequest request */)
	{
		HttpSession session = request.getSession();
		Customer customer = dao.getById(session);
		return customer;
	}
	
	@PostMapping("/changepassword/{oldpassword}/{newpassword}")
	public boolean changePassword(@PathVariable("newpassword") String password,
			@PathVariable("oldpassword") String oldPassword/* , HttpServletRequest req */)
	{
		System.out.println("in the change password");
		HttpSession session =  request.getSession();
		boolean status = dao.changePassword(password, oldPassword,session);
		return status;
	}
	
	@GetMapping("/logout")
	public void logout()
	{
		request.getSession().invalidate();
	}
}