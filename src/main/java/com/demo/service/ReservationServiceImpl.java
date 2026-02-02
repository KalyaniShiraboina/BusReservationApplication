package com.demo.service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.BusRepository;
import com.demo.dao.ReservationRepository;
import com.demo.model.Bus;
import com.demo.model.Reservation;
import com.demo.model.User;

@Service
public class ReservationServiceImpl implements ReservationService {

    @Autowired
    private BusRepository busRepo;

    @Autowired
    private ReservationRepository reservationRepo;

    @Override
    public Reservation bookSeat(Long busId, int seats, User user) {

        Bus bus = busRepo.findById(busId)
                .orElseThrow(() -> new RuntimeException("Bus not found"));

        // ❌ Not enough seats
        if (bus.getAvailableSeats() < seats) {
            return null;
        }

        // ✅ Reduce seats
        bus.setAvailableSeats(bus.getAvailableSeats() - seats);
        busRepo.save(bus);

        // ✅ Create reservation
        Reservation reservation = new Reservation();
        reservation.setBus(bus);
        reservation.setUser(user);
        reservation.setSeatsRequested(seats);
        reservation.setReservationStatus("CONFIRMED");
        reservation.setReservationType("ONLINE");
        reservation.setReservationDate(LocalDate.now());
        reservation.setReservationTime(LocalTime.now().toString());
        reservation.setSource(bus.getRoute().getRouteFrom());
        reservation.setDestination(bus.getRoute().getRouteTo());

        return reservationRepo.save(reservation);
    }
        
        @Override
        public List<Reservation> getAllReservations() {
            return reservationRepo.findAllByOrderByReservationDateDesc();
    }
        
        
        @Override
        public void cancelReservation(Long reservationId) {

            Reservation reservation = reservationRepo.findById(reservationId)
                    .orElseThrow(() -> new RuntimeException("Reservation not found"));

            // If already cancelled, do nothing
            if ("CANCELLED".equals(reservation.getReservationStatus())) {
                return;
            }

            Bus bus = reservation.getBus();

            // 🔁 Increase seats back
            bus.setAvailableSeats(
                    bus.getAvailableSeats() + reservation.getSeatsRequested()
            );

            busRepo.save(bus);

            // ❌ Cancel reservation
            reservation.setReservationStatus("CANCELLED");
            reservationRepo.save(reservation);
        }

        @Override
        public List<Reservation> getReservationsByUser(Long userId) {
            return reservationRepo.findByUserUserId(userId);
        }
        
        
        @Override
        public void startJourney(Long reservationId) {

            Reservation reservation = reservationRepo.findById(reservationId)
                    .orElseThrow(() -> new RuntimeException("Reservation not found"));

            if (!"CONFIRMED".equals(reservation.getReservationStatus())) {
                return;
            }

            reservation.setJourneyStarted(true);
            reservationRepo.save(reservation);
        }

        @Override
        public void endJourney(Long reservationId) {

            Reservation reservation = reservationRepo.findById(reservationId)
                    .orElseThrow(() -> new RuntimeException("Reservation not found"));

            if (!reservation.isJourneyStarted()) {
                return;
            }

            reservation.setJourneyEnded(true);
            reservationRepo.save(reservation);
        }



}

