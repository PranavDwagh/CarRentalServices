package com.carrentalservice;

import javax.websocket.server.PathParam;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.carrentalservice.entity.Admin;
@Repository
public interface AdminRepo extends JpaRepository<Admin, Integer>{
	@Query(value = "SELECT * FROM admin_credentials admin_credentials WHERE admin_credentials.admin_username=:username and admin_credentials.admin_password=:password", nativeQuery = true)
	public Admin adminLogin(@PathParam("username")String username, @PathParam("password")String password);
	
	@Query(value="select * from admin_credentials a where a.admin_username=:username and a.admin_password=:password", nativeQuery = true )
	public Admin findAdmin(@Param("username") String username, @Param("password") String password);
	
}
