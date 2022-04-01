package com.carrentalservice.controller;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.carrentalservice.AdminRepo;
import com.carrentalservice.BookingRepo;
import com.carrentalservice.CustomerRepo;
import com.carrentalservice.DriverRepo;
import com.carrentalservice.VehicleRepo;
import com.carrentalservice.entity.Admin;
import com.carrentalservice.entity.Booking;
import com.carrentalservice.entity.Driver;
import com.carrentalservice.entity.RecentBookings;
import com.carrentalservice.entity.Vehicle;

@org.springframework.stereotype.Controller

public class AdminController {
	@Autowired
	VehicleRepo vehicleRepo;
	@Autowired
	AdminRepo adminRepo;
	@Autowired
	DriverRepo driverRepo;
	@Autowired
	CustomerRepo customerRepo;
	@Autowired
	BookingRepo bookingRepo;
	
	@GetMapping("/")
	public ModelAndView loadAdminLogin() {
			return new ModelAndView("CustomerView/ListCars");
	} // end of hello()
	
	@PostMapping("/adminLogin/{username}/{password}")
	public ModelAndView adminLogin(@PathVariable String username, @PathVariable String password) {
			ModelAndView  temp = new ModelAndView();
			temp.setViewName("Admin_Dashboard");
			return temp;
	} // end of adminLogin
	
	@GetMapping("/loadAdminDashboard")
	public ModelAndView loadAdminDashboard() {
		ModelAndView adminModelAndView = new ModelAndView();
		adminModelAndView.addObject("carsCount", vehicleRepo.getCarsCount());
		adminModelAndView.addObject("driversCount", driverRepo.getDriverCount());
		adminModelAndView.addObject("customersCount", customerRepo.getCustomerCount());
		adminModelAndView.setViewName("Admin_Dashboard");
		return adminModelAndView;
	} // end of

	
	@PostMapping("/addAdmin/{adminFirstName}/{adminLastName}/{adminContactNumber}/{adminUserName}/{adminPassword}")
	public void addAdmin(@PathVariable String adminFirstName, @PathVariable String adminLastName,
			@PathVariable String adminContactNumber, @PathVariable String adminUserName,
			@PathVariable String adminPassword) {
		Admin admin = new Admin(adminFirstName, adminLastName, adminContactNumber, adminUserName, adminPassword);
		adminRepo.save(admin);
	} // end of addAdmin();

	@PostMapping("/updatePrice/{vehicleId}/{updatedPrice}")
	public void updatePrice(@PathVariable int vehicleId, @PathVariable int updatedPrice) {
		vehicleRepo.updatePrice(vehicleId, updatedPrice);
	} // end of updatePrice

	@PostMapping("/add")
	public void add(@RequestBody Vehicle vehicle) {
		byte[] byteArr;

		vehicleRepo.save(vehicle);
	}

	 @PostMapping("/addCar/{vehicleName}/{vehicleBrandName}/{vehicleType}/{seatingCapacity}/{pricePerKm}/{vehicleFuelType}/{vehicleImage}")
	  public void addCar(@PathVariable String vehicleName, @PathVariable String vehicleBrandName, @PathVariable String vehicleType, @PathVariable int seatingCapacity, @PathVariable int pricePerKm, @PathVariable String vehicleFuelType, @PathVariable MultipartFile vehicleImage) throws IOException, SerialException, SQLException 
	 { 
		byte[] byteArr;
		Blob blob;
		byteArr = vehicleImage.getBytes();
		blob = new SerialBlob(byteArr);
	    Vehicle vehicle = new Vehicle(vehicleName, vehicleBrandName, vehicleType, seatingCapacity, pricePerKm, vehicleFuelType, blob);
	    vehicleRepo.save(vehicle); 
	 } //end of addCar;
	 
	@PostMapping("/addDriver/{driverFirstName}/{driverLastName}/{driverContactNumber}/{driverAvail}/{driverLicenseNumber}/{driverCity}/{driverPinCode}/{driverState}")
	public void addDriver(@PathVariable String driverFirstName, @PathVariable String driverLastName,
			@PathVariable int driverAvail, @PathVariable String driverContactNumber,
			@PathVariable String driverLicenseNumber, @PathVariable String driverCity, @PathVariable int driverPinCode,
			@PathVariable String driverState) {
		Driver driver = new Driver(driverFirstName, driverLastName, driverContactNumber, driverLicenseNumber,
				driverAvail, driverCity, driverPinCode, driverState);
		driverRepo.save(driver);
	} // end of addCar

	@PostMapping("/deleteDriverById/{driverId}")
	public void deleteDriverById(@PathVariable int driverId) {
		driverRepo.deleteById(driverId);
	} // end of deleteDriverById();

	@PostMapping("/deleteCustomerById/{customerId}")
	public void deleteCustomerById(@PathVariable int customerId) {
		customerRepo.deleteById(customerId);
	} // end of deleteCustomerById();

	@GetMapping("/loadManageCars")
	public ModelAndView loadManageCars() {
		ModelAndView vehicleModelAndView = new ModelAndView();
		List<Vehicle> vehicleList = vehicleRepo.findAll();
		vehicleModelAndView.addObject("vehicleDetails", vehicleList);
		vehicleModelAndView.setViewName("ManageCars");
		return vehicleModelAndView;
	} // end of loadManageCars;

	@PostMapping("deleteCarById/{vehicleId}")
	public void deleteCarById(@PathVariable int vehicleId) {
		vehicleRepo.deleteById(vehicleId);
	} // end of deleteCarById();

	@GetMapping("/loadManageDrivers")
	public ModelAndView loadManageDrivers() {
		ModelAndView driversModelAndView = new ModelAndView();
		driversModelAndView.addObject("driverDetails", driverRepo.findAll());
		driversModelAndView.setViewName("ManageDrivers");
		return driversModelAndView;
	} // end of loadManageDrivers;

	@GetMapping("/loadUserFeedback")
	public String loadUserFeedback() {
		return "UserFeedback";
	} // end of loadUserFeedback

	@GetMapping("/loadViewBookings")
	public String loadViewBookings() {
		return "ViewBookings";
	} // end of loadUserFeedback

	@GetMapping("/loadViewCustomers")
	public ModelAndView loadViewCustomers() {
		ModelAndView customersModelAndView = new ModelAndView();
		customersModelAndView.addObject("customerData", customerRepo.findAll());
		customersModelAndView.setViewName("ViewCustomers");
		return customersModelAndView;
	} // end of loadUserFeedback

	@GetMapping("/loadViewPayments")
	public String loadViewPayments() {
		return "ViewPayment";
	} // end of loadUserFeedback

	@GetMapping("/loadViewProfile")
	public String loadViewProfile() {
		return "ViewProfile";
	} // end of loadUserFeedback

	@GetMapping("/logout")
		public String logout(@RequestBody Admin admin) {
			return "index";
		}
} // end of AdminController
