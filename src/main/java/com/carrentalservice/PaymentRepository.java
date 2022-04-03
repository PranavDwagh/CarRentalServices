package com.carrentalservice;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.carrentalservice.DTO.IPaymentDTO;
import com.carrentalservice.entity.Payment;

@Repository
public interface PaymentRepository extends JpaRepository<Payment, Integer> {
	@Query(value="SELECT SUM(p.amount) FROM payment p", nativeQuery = true)
	public int getTotalAmount();
	
	@Query(value="select p.amount as Amount, concat(c.customer_firstname,\" \",c.customer_lastname) as CustomerName, concat(v.vehicle_brand_name,\" \",v.vehicle_name) as VehicleName, concat(m.journey_date,\" \",m.journey_time) as JourneyDateandTime from (select b.vehicle_id,  b.payment_id, b.customer_id, b.ongoing_id, b.journey_date, b.journey_time from booking b) m join customer_details c join payment p join vehicle v on m.payment_id = p.payment_id and v.vehicle_id = m.vehicle_id and p.customer_id = c.customer_id", nativeQuery = true)
	public List<IPaymentDTO> getPaymentDetails();
}
