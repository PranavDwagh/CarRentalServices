package com.carrentalservice.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.carrentalservice.AdminRepo;
import com.carrentalservice.entity.Admin;

@Component
public class AdminDAO {
	
	
	@Autowired
	AdminRepo adminRepo;


	public boolean verify(String username, String password, HttpSession session) {

		Admin obj = adminRepo.findAdmin(username, password);
		if(obj!=null)
		{
			session.setAttribute("adminObj", obj);
			session.setAttribute("adminId", obj.getId());
			return true;
		}
		else
		{
			return false;
		}
	}

	public void addAdmin(Admin admin) {

	
		Admin obj =  adminRepo.save(admin);
		System.out.println(obj);
		
	}

	public List<Admin> getAll() {
		
		return adminRepo.findAll();
	}
	
	public String getAdminName(HttpSession session) {
		
		int adminId = (int) session.getAttribute("adminId");
		return adminRepo.findById(adminId).get().getFirstname();
		
	}
	
	public Admin getAdminProfile(HttpSession session) {
		Admin admin = (Admin) session.getAttribute("adminObj");
		System.out.println(admin);
		return adminRepo.findById(admin.getId()).get();
	}
}
