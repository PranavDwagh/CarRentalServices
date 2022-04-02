package com.carrentalservice.dao;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.carrentalservice.PaymentRepository;
import com.carrentalservice.entity.Payment;


@Component
public class PaymentDAO {

	
	@Autowired
	PaymentRepository paymentRepo;
	
	@Autowired
	BookingDAO bookingdao;
	
	/*
	 * @Autowired Session session;
	 */
	
	
	  public void makePayment(Payment obj, HttpSession session) {
		  
		  Payment newObj =  paymentRepo.save(obj);
		  System.out.println(newObj);
//		  Session.map.put("paymentId", newObj.getId());
		  session.setAttribute("paymentId", newObj.getId());
		  bookingdao.bookRide(session);
	  }
	
	
	
}
