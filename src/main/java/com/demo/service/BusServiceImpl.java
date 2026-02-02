package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.BusRepository;
import com.demo.model.Bus;

@Service
public class BusServiceImpl implements BusService {
	
	 @Autowired
	    private BusRepository busRepo;

	    @Override
	    public Bus saveBus(Bus bus) {
	        bus.setAvailableSeats(bus.getSeats()); // important logic
	        return busRepo.save(bus);
	    }

	    @Override
	    public List<Bus> getAllBuses() {
	        return busRepo.findAll();
	    }

	    @Override
	    public void deleteBus(Long id) {
	        busRepo.deleteById(id);
	    }
	    
	    @Override
	    public List<Bus> searchBuses(String from, String to) {
	        return busRepo.findBusesByRoute(from, to);
	    }


}
