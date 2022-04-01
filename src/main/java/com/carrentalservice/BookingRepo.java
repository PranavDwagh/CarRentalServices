package com.carrentalservice;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.carrentalservice.entity.Booking;
import com.carrentalservice.entity.RecentBookings;
@Repository
public interface BookingRepo extends JpaRepository<Booking, Integer>{
	@Query(value = "select booking.booking_date, customer_details.customer_firstname, booking.source, booking.destination, sum(booking.total_ride_price) from booking, customer_details where booking.customer_id = customer_details.customer_id", nativeQuery = true)
	public List<RecentBookings> showRecentBookins();
}
