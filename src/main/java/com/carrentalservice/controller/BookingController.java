package com.carrentalservice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.carrentalservice.BookingRepository;
import com.carrentalservice.DriverRepo;
import com.carrentalservice.VehicleRepo;
import com.carrentalservice.DTO.IBookingDTO;
import com.carrentalservice.DTO.IBookingView;
import com.carrentalservice.DTO.IRideDTO;
import com.carrentalservice.dao.BookingDAO;
import com.carrentalservice.entity.Booking;
import com.carrentalservice.entity.Driver;
import com.carrentalservice.entity.Vehicle;


@RestController
@RequestMapping("booking")
@SessionAttributes
public class BookingController {

	
	@Autowired
	DriverRepo driverRepo;
	
	@Autowired
	VehicleRepo vehicleRepo;
	
	@Autowired
	BookingRepository bookingRepo;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	BookingDAO bookingDAO;
	
	@PostMapping("/book/{source}/{destination}/{journeydate}/{journeytime}")
	public void bookDetails(@PathVariable String source, @PathVariable String destination, @PathVariable String journeydate, @PathVariable String journeytime)
	{
		HttpSession session = request.getSession();
		session.setAttribute("journeyDate", journeydate);
		session.setAttribute("journeyTime", journeytime);
		session.setAttribute("source", source);
		session.setAttribute("destination", destination);
		System.out.println(journeydate+" " +journeytime+" "+source+" "+destination);
		System.out.println((String)session.getAttribute("journeyTime"));
	}
	
	/*
	 * @PostMapping("/returnVehicle") public void returnVehicle() {
	 * dao.returnVehicle(); }
	 */
	
	@GetMapping("/getAllActiveRides")
	public IBookingDTO getAllActiveRides()
	{
		 return bookingRepo.getAllActiveRide();
	}
	
	@GetMapping("/getAll")
	public IBookingDTO getAllRides()
	{
		return bookingRepo.getAllRide();
	}
	
	@GetMapping("/getRideHistory")
	public List<IRideDTO> getRideHistory()
	{
	 int customerId =(int) request.getSession().getAttribute("currentCustomer");
	  List<IRideDTO> list = bookingRepo.getRideHistory(customerId);
	  return list;
	}
	
	
	@GetMapping("/getAllBooking")
	public List<IBookingView> getAllBooking()
	{
		return bookingRepo.getAllBookings();
	}
	
	@GetMapping("/getActiveBooking")
	public List<IBookingView> getActiveBooking()
	{
		return bookingRepo.getActiveBookings();
	}
	
	@PostMapping("/completeride/{id}")
	public void completeRide(@PathVariable("id") String id)
	{
		Booking obj = bookingRepo.findById(Integer.parseInt(id)).get();
		int vehicleId = obj.getVehicle_id();
		int driverId = obj.getDriver_id();
		obj.setRide_status(0);
		 Vehicle vehicleObj =  vehicleRepo.getByStatus(vehicleId);
		 Driver driverObj = driverRepo.getByStatus(driverId);
		
		 if(vehicleObj!=null)
		 {
			 vehicleObj.setVehicle_status(1);
		 }

		 if(driverObj!=null)
		 {
			 driverObj.setStatus(1);
		 }
		 
		 vehicleRepo.save(vehicleObj);
		 driverRepo.save(driverObj);
		 
		 bookingRepo.save(obj);
		 
	}
	
	
}
