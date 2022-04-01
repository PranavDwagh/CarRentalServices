package com.carrentalservice.dao;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Session {

	
	public static Map<String, Object> map;
	
	public Session() {
		
		map = new HashMap<String, Object>();
		System.out.println("session object created");
	}
		// session TODO
	
	@Override
	public String toString() {
		return "Session [getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
}
