package com.demo.model;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import lombok.Data;

@Entity
@Data
public class Feedback {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long feedbackId;

    private int driverRating;
    private int serviceRating;
    private int overallRating;
    private String comments;

    private LocalDate feedbackDate;

    @ManyToOne
    private User user;

    @ManyToOne
    private Bus bus;

    @OneToOne
    private Reservation reservation;
}


