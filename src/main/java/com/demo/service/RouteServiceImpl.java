package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.RouteRepository;
import com.demo.model.Route;

@Service
public class RouteServiceImpl implements RouteService {

    @Autowired
    private RouteRepository routeRepo;

    @Override
    public Route saveRoute(Route route) {
        return routeRepo.save(route);
    }

    @Override
    public List<Route> getAllRoutes() {
        return routeRepo.findAll();
    }

    @Override
    public void deleteRoute(Long id) {
        routeRepo.deleteById(id);
    }
}
