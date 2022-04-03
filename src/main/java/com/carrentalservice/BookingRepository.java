package com.carrentalservice;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.carrentalservice.DTO.IBookingDTO;
import com.carrentalservice.DTO.IBookingView;
import com.carrentalservice.DTO.IRideDTO;
import com.carrentalservice.entity.Booking;


@Repository
public interface BookingRepository extends JpaRepository<Booking, Integer> {

	
	@Query(value = "select concat(c.customer_firstname,\" \" , c.customer_lastname) as CustomerName, concat(v.vehicle_brand_name,\" \",v.vehicle_name) as VehicleName, concat(d.driver_firstname,\" \" , d.driver_lastname) as DriverName, p.amount, b.journey_time as JourneyTime, b.journey_date as JourneyDate, b.source as Source, b.destination as Destination, b.ride_status as RideStatus from customer_details c, vehicle v, driver_details d, booking b, payment p where  d.driver_id = b.driver_id and c.customer_id = b.customer_id and v.vehicle_id = b.vehicle_id and p.payment_id = b.payment_id and b.ride_status=1", nativeQuery = true)
	public IBookingDTO getAllActiveRide(); 
	
	@Query(value = "select concat(c.customer_firstname,\" \" , c.customer_lastname) as CustomerName, concat(v.vehicle_brand_name,\" \",v.vehicle_name) as VehicleName, concat(d.driver_firstname,\" \" , d.driver_lastname) as DriverName, p.amount, b.journey_time as JourneyTime, b.journey_date as JourneyDate, b.source as Source, b.destination as Destination, b.ride_status as RideStatus from customer_details c, vehicle v, driver_details d, booking b, payment p where  d.driver_id = b.driver_id and c.customer_id = b.customer_id and v.vehicle_id = b.vehicle_id and p.payment_id = b.payment_id", nativeQuery = true)
	public IBookingDTO getAllRide();

	
//	@Query(value = "select p.ongoing_id as BookingId, p.CarName, p.CarModel, p.DriverName, p.RidePrice, p.JourneyDate, p.JourneyTime, p.Source, p.Destination, f.description as Feedback from (select v.vehicle_name as CarName, v.vehicle_brand_name as CarModel, concat(d.driver_firstname,\" \",d.driver_lastname) as DriverName, p.amount as RidePrice,  b.journey_date as JourneyDate, b.journey_time as JourneyTime, b.source as Source, b.destination as Destination, b.ongoing_id as ongoing_id from vehicle v, booking b, payment p, driver_details d  where b.customer_id=:id and v.vehicle_id = b.vehicle_id and p.payment_id = b.payment_id  and d.driver_id = b.driver_id) p left join feedback f on f.ongoing_id = p.ongoing_id", nativeQuery = true)
	@Query(value = "select b.ongoing_id as BookingId, v.vehicle_name as CarName, v.vehicle_brand_name as CarModel, concat(d.driver_firstname,\" \",d.driver_lastname) as DriverName, p.amount as RidePrice,  b.journey_date as JourneyDate, b.journey_time as JourneyTime, b.source as Source, b.destination as Destination, b.ongoing_id as ongoing_id from vehicle v, booking b, payment p, driver_details d  where b.customer_id=:id and v.vehicle_id = b.vehicle_id and p.payment_id = b.payment_id  and d.driver_id = b.driver_id", nativeQuery = true)
	public List<IRideDTO> getRideHistory(@Param("id") int customerId); 
	
	@Query(value = "select * from (select concat(c.customer_firstname,\" \",c.customer_lastname) as CustomerName, concat(v.vehicle_brand_name,\" \",v.vehicle_name) as VehicleName, concat(d.driver_firstname,\" \", d.driver_lastname) as DriverName, concat(b.journey_date,\" \",b.journey_time) as JourneyDateandTime    ,b.source as Source, b.destination as Destination, b.ongoing_id as BookingId, p.amount as Amount from customer_details c join vehicle v join driver_details d join (select * from booking b where b.ride_status = 1) b join payment p  on b.customer_id = c.customer_id and v.vehicle_id = b.vehicle_id and p.payment_id = b.payment_id  and  d.driver_id = b.driver_id) m left join feedback f on f.ongoing_id = m.BookingId", nativeQuery = true)
	List<IBookingView> getActiveBookings();
	
	@Query(value = "select * from (select concat(c.customer_firstname,\" \",c.customer_lastname) as CustomerName, concat(v.vehicle_brand_name,\" \",v.vehicle_name) as VehicleName, concat(d.driver_firstname,\" \", d.driver_lastname) as DriverName,  concat(b.journey_date,\" \",b.journey_time) as JourneyDateandTime   ,b.source as Source, b.destination as Destination, b.ongoing_id as BookingId, p.amount as Amount from customer_details c join vehicle v join driver_details d join (select * from booking b) b join payment p  on b.customer_id = c.customer_id and v.vehicle_id = b.vehicle_id and p.payment_id = b.payment_id  and  d.driver_id = b.driver_id) m left join feedback f on f.ongoing_id = m.BookingId", nativeQuery = true)
	List<IBookingView> getAllBookings();
		
	
}
/*public int getBookingId();-
	public String getCarModel();-
	public String getCarName();-
	public String getDriverName();-
	public int getRidePrice();
	public String getJourneyTime();
	public String getJourneyDate();
	public String getSource();
	public String getDestination();
	public String getFeedback();
 * */
