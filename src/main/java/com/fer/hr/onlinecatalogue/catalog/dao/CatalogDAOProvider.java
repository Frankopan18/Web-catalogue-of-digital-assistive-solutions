package com.fer.hr.onlinecatalogue.catalog.dao;

import com.fer.hr.onlinecatalogue.catalog.dao.impl.CatalogDAOImpl;

public class CatalogDAOProvider {
	
	private static CatalogDAO dao = new CatalogDAOImpl();
	
	public static CatalogDAO getDAO() {
		return dao;
	}

}
