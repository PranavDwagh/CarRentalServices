package com.carrentalservice;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.carrentalservice.DTO.IFeedbackDTO;
import com.carrentalservice.entity.Feedback;

public interface FeedbackRepository extends JpaRepository<Feedback, Integer> {

	@Query(value="select * from feedback f where f.customer_id =:id", nativeQuery = true)
	public List<Feedback> findByCustomerId(@Param("id") int id);
	
	@Query(value="select * from feedback f where f.ongoing_id =:id", nativeQuery = true)
	public List<Feedback> findByOngoingId(@Param("id") int id);
	
	@Query(value="select c.customer_firstname as FirstName, c.customer_lastname as LastName, f.description as Feedback, f.customer_rating as Rating  from customer_details c, feedback f, booking b where f.ongoing_id = :bookingId and b.customer_id = :customerId and c.customer_id = :customerId", nativeQuery = true)
	public List<IFeedbackDTO> getFeedback(@Param("customerId") int customerId, @Param("bookingId") int bookingId);
	
}
