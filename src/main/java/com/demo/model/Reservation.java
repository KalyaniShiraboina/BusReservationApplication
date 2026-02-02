package com.demo.model;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import lombok.Data;

@Entity
@Data
public class Reservation {
       
	 @Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long reservationId;

	    private String reservationStatus; //confirmed /cancelled
	    private String reservationType;  //online
	    private LocalDate reservationDate;
	    private String reservationTime;
	    private String source;
	    private String destination;
	    private int seatsRequested;
	    
	    
	    
	    private boolean journeyStarted;
	    private boolean journeyEnded;

	    @ManyToOne
	    private User user;

	    @ManyToOne
	    private Bus bus;
	
}
