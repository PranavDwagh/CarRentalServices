package com.carrentalservice.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PostMapping;

import com.carrentalservice.FeedbackRepository;
import com.carrentalservice.DTO.IFeedbackDTO;
import com.carrentalservice.entity.Feedback;


@Component
public class FeedbackDAO {

	@Autowired
	FeedbackRepository feedbackRepo;

	public boolean giveFeedback(Feedback obj, HttpSession session) {
		
		int bookingId = (int)session.getAttribute("feedbackBookingId");
		int customerId = (int)session.getAttribute("currentCustomer");

		obj.setCustomerId(customerId);
		obj.setOngoingId(bookingId);
		Feedback feedback = feedbackRepo.save(obj);
		if(feedback!=null)
		{
			System.out.println(feedback);
			return true;
		}
		else
		{
			return false;
		}
	}

	public List<IFeedbackDTO> getFeedbackCustomerId(HttpSession session) {
//		List<Feedback> feedback = feedbackRepo.findByCustomerId(id);
		int customerId = (int) session.getAttribute("currentCustomer");
		int bookingId = (int) session.getAttribute("feedbackBookingId");
		List<IFeedbackDTO> feedback = feedbackRepo.getFeedback(customerId, bookingId);
		return feedback;
	}

	public List<Feedback> getFeedbackOngoingId(int id) {
		List<Feedback> feedback = feedbackRepo.findByCustomerId(id);
		return feedback;
	}


}
