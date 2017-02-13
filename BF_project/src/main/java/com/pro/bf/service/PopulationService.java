package com.pro.bf.service;

import java.sql.SQLException;
import java.util.List;

public interface PopulationService {
	
	int totalPopulation(String dong) throws SQLException;
	float count() throws SQLException;
	List<String> populationList() throws SQLException;
	float score(String dong) throws SQLException;
}
