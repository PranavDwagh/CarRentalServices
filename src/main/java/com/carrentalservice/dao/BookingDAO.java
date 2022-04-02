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
		booking.setJourneyTime((String)session.getAttribute("journeyTime"));
		booking.setJourneyDate((String)session.getAttribute("journeyDate"));
		booking.setSource((String)session.getAttribute("source"));
		booking.setDestination((String)session.getAttribute("destination"));
//		booking.setTotalPrice(intAmount);         // to be removed
		booking.setRideStatus(1);

		booking.setCustomerId((int)session.getAttribute("currentCustomer"));
		booking.setVehicleId((int)session.getAttribute("vehicleId"));
		booking.setDriverId((int)session.getAttribute("driverId"));
		booking.setPaymentId((int)session.getAttribute("paymentId"));
		
		booking.setBookingDate(dt.format(now));
		booking.setBookingTime(time.format(now));


		Booking newObj = bookingRepo.save(booking);
		//Session.map.put("bookingId", newObj.getId());
		session.setAttribute("bookingId", newObj.getId());
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
