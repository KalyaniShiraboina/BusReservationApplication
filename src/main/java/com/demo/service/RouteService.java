package com.demo.service;

import java.util.List;

import com.demo.model.Route;

public interface RouteService {
	
	Route saveRoute(Route route);
    List<Route> getAllRoutes();
    void deleteRoute(Long id);

}
