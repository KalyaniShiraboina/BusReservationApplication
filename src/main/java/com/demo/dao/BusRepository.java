package com.demo.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.demo.model.Bus;

public interface BusRepository extends JpaRepository<Bus, Long> {
	

    @Query("SELECT b FROM Bus b WHERE b.route.routeFrom = :from AND b.route.routeTo = :to AND b.availableSeats > 0")
    List<Bus> findBusesByRoute(@Param("from") String from,
                               @Param("to") String to);
	

}
