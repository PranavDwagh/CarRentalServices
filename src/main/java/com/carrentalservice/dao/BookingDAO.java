package com.carrentalservice.dao;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.carrentalservice.BookingRepository;
import com.carrentalservice.DTO.IBookingDTO;
import com.carrentalservice.DTO.IRideDTO;
import com.carrentalservice.entity.Booking;


@Component
public class BookingDAO {

	@Autowired
	BookingRepository bookingRepo;

	
	public void bookRide(HttpSession session) {

		DateTimeFormatter dt = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		DateTimeFormatter time = DateTimeFormatter.ofPattern("HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		System.out.println(dt.format(now));
		System.out.println(time.format(now));
	
		Booking booking = new Booking();
		booking.setJourney_time((String)session.getAttribute("journeyTime"));
		booking.setJourney_date((String)session.getAttribute("journeyDate"));
		booking.setSource((String)session.getAttribute("source"));
		booking.setDestination((String)session.getAttribute("destination"));
//		booking.setTotalPrice(intAmount);         // to be removed
		booking.setRide_status(1);

		booking.setCustomer_id((int)session.getAttribute("currentCustomer"));
		booking.setVehicle_id((int)session.getAttribute("vehicleId"));
		booking.setDriver_id((int)session.getAttribute("driverId"));
		booking.setPayment_id((int)session.getAttribute("paymentId"));
		
		booking.setBooking_date(dt.format(now));
		booking.setBooking_time(time.format(now));


		Booking newObj = bookingRepo.save(booking);
		//Session.map.put("bookingId", newObj.getId());
		session.setAttribute("bookingId", newObj.getOngoing_id());
		System.out.println(newObj);
	}
	

	public IBookingDTO getAllActiveRides() {

		return bookingRepo.getAllActiveRide();

	}
	
	public IBookingDTO getAllRides() {

		return bookingRepo.getAllRide();

	}

	public List<IRideDTO> getRideHistory(HttpSession session) {
		
		int customerId = (int)session.getAttribute("currentCustomer");
		List<IRideDTO> list = bookingRepo.getRideHistory(customerId);
		return list;
	}
}
