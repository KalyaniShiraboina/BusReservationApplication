package com.demo.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.demo.model.Reservation;

public interface ReservationRepository extends JpaRepository<Reservation, Long> {
	
	List<Reservation> findAllByOrderByReservationDateDesc();
	
	List<Reservation> findByUserUserId(Long userId);


}
