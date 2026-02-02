package com.demo.service;

import java.util.List;

import com.demo.model.Reservation;
import com.demo.model.User;

public interface ReservationService {
	 Reservation bookSeat(Long busId, int seats, User user);
	 
	 List<Reservation> getAllReservations();
	 
	 void cancelReservation(Long reservationId);
	 
	 List<Reservation> getReservationsByUser(Long userId);
     
	 
	 void startJourney(Long reservationId);
	 void endJourney(Long reservationId);


	 


}
