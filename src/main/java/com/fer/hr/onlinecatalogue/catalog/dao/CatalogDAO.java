package com.fer.hr.onlinecatalogue.catalog.dao;

import java.util.List;

import com.fer.hr.onlinecatalogue.catalog.entity.Catalog;
import com.fer.hr.onlinecatalogue.roles.Administrator;
import com.fer.hr.onlinecatalogue.roles.Member;
import com.fer.hr.onlinecatalogue.roles.User;


public interface CatalogDAO {
	
	int create(Catalog catalog);
	
	List<Catalog> getCatalogItems();
	
	Catalog findCatalogItem(int id);
	
	void updateCatalogItem(Catalog catalog);
	
	boolean updateItemSingleColumn(Catalog catalog,String value,String type);
	
	boolean updateItemMultipleColumns(Catalog catalog,List<String> values,List<String> types);
	
	User getUser(int id);
	
	List<User> getAllUsers();
	
	User getByEmail(String email);
	
	Member getMember(String email);
	
	Administrator getAdmin(String email);
	
	int createAdmin(Administrator a);
	
	int createMember(Member m);
	
	boolean deleteItem(int id);
	
	boolean deleteUser(String email);
	
	boolean deleteAdmin(String email);

	void updatePicture(Catalog catalog, byte[] prikaz);

}
