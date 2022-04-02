package com.carrentalservice;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.carrentalservice.DTO.*;
import com.carrentalservice.entity.Location;


@Repository
public interface LocationRepository extends JpaRepository<Location, Integer> {

	@Query(value = "select distance from location l where l.source=:source and l.destination =:destination", nativeQuery = true)
	public int getDistance(@Param("source") String source , @Param("destination") String destination);
		
	
	@Query(value = "select d.destination as Destination, d.source as Source from location d", nativeQuery = true)
	public List<ILocationDTO> getLocation();
	
	
}
