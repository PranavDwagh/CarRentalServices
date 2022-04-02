package com.carrentalservice.controller;

import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.carrentalservice.dao.AdminDAO;
import com.carrentalservice.entity.Admin;

@RestController
@RequestMapping("/admin")
public class AdminControllerUpdated {


	@Autowired
	AdminDAO dao;
	@Autowired
	HttpServletRequest request;

	@GetMapping("/verify/{username}/{password}")
	public boolean verifyAdmin(@PathVariable("username") String username, @PathVariable("password") String password) {

		boolean status = dao.verify(username, password, request.getSession());
		return status;
	}
	
	
	@GetMapping("/getAdminName")
	public String getAdminName() {
		String adminName = dao.getAdminName(request.getSession());
		return adminName;
	}
	
	@GetMapping("/getAdminProfile")
	public Admin getAdminProfile() {
		Admin admin = dao.getAdminProfile(request.getSession());
		return admin;
	}
	
	@PostMapping("/addadmin")
	public void addAdmin(@RequestBody Admin admin)
	{
		dao.addAdmin(admin);
	}
	
	@GetMapping("/getAll")
	public List<Admin> getAdmin()
	{
		List<Admin> list =  dao.getAll();
		return list;
	}

}
