package com.carrentalservice.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PostMapping;

import com.carrentalservice.AdminRepo;
import com.carrentalservice.CustomerRepo;
import com.carrentalservice.DriverRepo;
import com.carrentalservice.VehicleRepo;
import com.carrentalservice.entity.Customer;


@Component
public class CustomerDAO  {

	@Autowired
	AdminRepo adminRepo;

	@Autowired
	CustomerRepo customerRepo;

	@Autowired
	DriverRepo driverRepo;

	@Autowired
	VehicleRepo vehicleRepo;
	
	/*
	 * @Autowired HttpSession session;
	 */
		
	@Autowired
	Session session;
	
	
	public boolean addCustomer(Customer obj) {

	  Customer newObj = customerRepo.save(obj);
	  System.out.println(newObj);
	  if(newObj!=null)
		  return true;
	  else
		  return false;
	}

	public List<Customer> getAll() {

		List<Customer> list =  customerRepo.findAll();
		return list;
	}

	public void deleteCustomer(int id) {
	
		Customer obj = customerRepo.findById(id).get();
		if(obj!=null)
		{
			customerRepo.delete(obj);
		}
		else
		{
			System.out.println("No customer found with given id");
		}
	}

	public void update(Customer obj) {
		
		int id = (int)Session.map.get("currentCustomer");
		obj.setId(id);
		Customer oldObj = customerRepo.findById(obj.getId()).get();
		
		if(oldObj!=null)
		{
			obj.setId(obj.getId());
			
			if((!oldObj.getCity().equals(obj.getCity())  ))
			{
				oldObj.setCity(obj.getCity());
			}
			if(!oldObj.getContactNo().equals(obj.getContactNo()))
			{
				oldObj.setContactNo(obj.getContactNo());
			}
			if(!oldObj.getEmail().equals(obj.getEmail()))
			{
				oldObj.setEmail(obj.getEmail());
			}
			if(!oldObj.getFirstname().equals(obj.getFirstname()))
			{
				oldObj.setFirstname(obj.getFirstname());
			}
			if(!oldObj.getUsername().equals(obj.getUsername()) && (obj.getUsername()!=null))
			{
				oldObj.setUsername(obj.getUsername());
			}
			if(!oldObj.getPassword().equals(obj.getPassword()) && (obj.getPassword()!=null))
			{
				oldObj.setPassword(obj.getPassword());
			}
			if(!oldObj.getLastname().equals(obj.getLastname()))
			{
				oldObj.setLastname(obj.getLastname());
			}
			if(!(oldObj.getPincode()==(obj.getPincode())))
			{
				oldObj.setPincode(obj.getPincode());
			}
			if(!(oldObj.getState().equals(obj.getState())))
			{
				oldObj.setState(obj.getState());
			}
			customerRepo.save(oldObj);
		}	
	}

	public boolean verify(String username, String password/* , HttpSession session */) {

		Customer obj = customerRepo.findCustomer(username, password);
		
		if(obj!=null)
		{
			System.out.println(obj);
			Session.map.put("currentCustomer", obj.getId());
//			session.setAttribute("customerId", obj.getId());
			return true;
		}
		else
		{
			return false;
		}
	}
}