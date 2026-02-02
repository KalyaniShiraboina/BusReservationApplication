package com.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.demo.model.Feedback;

public interface FeedbackRepository extends JpaRepository<Feedback, Long> {
    Feedback findByReservationReservationId(Long reservationId);
}

