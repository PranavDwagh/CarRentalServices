package com.carrentalservice.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.carrentalservice.LocationRepository;
import com.carrentalservice.VehicleRepo;
import com.carrentalservice.dao.PaymentDAO;
import com.carrentalservice.entity.Payment;


@RestController
@RequestMapping("payment")
public class PaymentController {


	@Autowired
	PaymentDAO dao;

	@Autowired
	VehicleRepo vehicleRepo;

	@Autowired
	LocationRepository locationRepo;

	@Autowired
	HttpServletRequest request;

	/*
	 * @Autowired Session session;
	 */

	@PostMapping("/makepayment")
	public void makePayment()
	{
		HttpSession session = request.getSession();

		int customerId = (int)session.getAttribute("currentCustomer");
		int vehicleId = (int)session.getAttribute("vehicleId");
		
		DateTimeFormatter dt = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		DateTimeFormatter time = DateTimeFormatter.ofPattern("HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		System.out.println(dt.format(now));
		System.out.println(time.format(now));
		
		Payment newObj = new Payment();
		newObj.setPayment_date(dt.format(now));
		newObj.setPayment_time(time.format(now));
		newObj.setCustomerId(customerId);
		newObj.setVehicleId(vehicleId);
		newObj.setAmount(calculateAmount());
		System.out.println(newObj);           // testing purpose
		dao.makePayment(newObj,session);
	}

	// to be use somewhere
	public int calculateAmount()
	{
		String source = (String)request.getSession().getAttribute("source");
		String destination = (String)request.getSession().getAttribute("destination");
		int distance = locationRepo.getDistance(source, destination);
		HttpSession session = request.getSession();
		int id = (int)session.getAttribute("vehicleId");
		int rate = vehicleRepo.getRate(id);
		return distance*rate;
	}

	@GetMapping("/getDetails")
	public Map<String, String> getDetails()
	{
		HttpSession session = request.getSession();
		String source = (String)session.getAttribute("source");
		String destination = (String)session.getAttribute("destination");
		Integer amount = calculateAmount();
		Map<String, String> map = new HashMap<>();
		map.put("source", source);
		map.put("destination", destination);
		map.put("amount", amount.toString());
		return map;
	}
}
