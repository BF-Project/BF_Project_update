package com.pro.bf.dao;

import java.sql.SQLException;
import java.util.List;

public interface PopulationDao {
	
	int totalPopulation(String dong) throws SQLException;
	float count() throws SQLException;
	List<String> populationList() throws SQLException;
}
