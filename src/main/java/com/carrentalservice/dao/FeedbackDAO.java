package com.carrentalservice.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PostMapping;

import com.carrentalservice.FeedbackRepository;
import com.carrentalservice.entity.Feedback;

@Component
public class FeedbackDAO {

	@Autowired
	FeedbackRepository feedbackRepo;

	public void giveFeedback(Feedback obj) {

		Feedback feedback = feedbackRepo.save(obj);
		System.out.println(feedback);
	}

	public List<Feedback> getAllFeedback() {
		List<Feedback> feedback = feedbackRepo.findAll();

		return feedback;
	}

	public List<Feedback> getFeedbackOngoingId(int id) {
		List<Feedback> feedback = feedbackRepo.findByCustomerId(id);

		return feedback;
	}
}