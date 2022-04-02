package com.carrentalservice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.carrentalservice.DTO.IFeedbackDTO;
import com.carrentalservice.dao.FeedbackDAO;
import com.carrentalservice.entity.Feedback;


@RestController
@RequestMapping("/feedback")
public class FeedbackController {

	@Autowired
	FeedbackDAO dao;
	
	@Autowired
	HttpServletRequest request;
	
	@PostMapping("/add")
	public boolean giveFeedback(@RequestBody Feedback obj)
	{
		boolean status =  dao.giveFeedback(obj, request.getSession()); 
		return status;
	}
	
	/*
	 * @GetMapping("/getFeedbackCustomerId/{id}") public List<Feedback>
	 * getFeedbackByCustomer(@PathVariable("id") String i) { int id =
	 * Integer.parseInt(i); List<Feedback> feedback =
	 * dao.getFeedbackCustomerId(request); return feedback; }
	 */
	
	@GetMapping("/getFeedback")
	public List<IFeedbackDTO> getFeedbackByRide()
	{
		int id =(int)request.getSession().getAttribute("feedbackBookingId");
		System.out.println("feedbackBookingId "+id);
		List<IFeedbackDTO> feedback = dao.getFeedbackCustomerId(request.getSession());
		return feedback;
	}
	
	@PostMapping("/bookingId/{bookingId}")
	public void getBookingId(@PathVariable String bookingId)
	{
		int bookingId1 = Integer.parseInt(bookingId);
 		request.getSession().setAttribute("feedbackBookingId", bookingId1);
	}
	
}
