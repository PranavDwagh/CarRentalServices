package com.carrentalservice.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.carrentalservice.DTO.*;
import com.carrentalservice.*;

@Component
public class LocationDAO {

	@Autowired
	LocationRepository locationRepo;

	public List<ILocationDTO> getLocation() {
		
		List<ILocationDTO> list = locationRepo.getLocation();
		return list;
	}
	
	
}
