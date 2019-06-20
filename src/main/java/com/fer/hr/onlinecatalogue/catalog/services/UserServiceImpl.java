package com.fer.hr.onlinecatalogue.catalog.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.fer.hr.onlinecatalogue.catalog.dao.CatalogDAO;
import com.fer.hr.onlinecatalogue.catalog.entity.Catalog;
import com.fer.hr.onlinecatalogue.roles.Administrator;
import com.fer.hr.onlinecatalogue.roles.Member;
import com.fer.hr.onlinecatalogue.roles.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private CatalogDAO dao;

	public CatalogDAO getDao() {
		return dao;
	}

	public void setDao(CatalogDAO dao) {
		this.dao = dao;
	}

	@Override
	public int create(Catalog catalog) {
		// business logic
		return dao.create(catalog);
	}

	@Override
	public List<Catalog> getCatalogItems() {
		// business logic
		return dao.getCatalogItems();
	}

	@Override
	public Catalog findCatalogItem(int id) {
		// business logic
		return dao.findCatalogItem(id);
	}

	@Override
	public boolean updateItemSingleColumn(Catalog catalog, String value, String type) {
		// business logic
		return dao.updateItemSingleColumn(catalog, value, type);
	}

	@Override
	public boolean updateItemMultipleColumns(Catalog catalog, List<String> values, List<String> types) {
		// business logic
		return dao.updateItemMultipleColumns(catalog, values, types);
	}

	@Override
	public User getUser(int id) {
		// business logic
		return dao.getUser(id);
	}

	@Override
	public List<User> getAllUsers() {
		// business logic
		return dao.getAllUsers();
	}

	@Override
	public User getByEmail(String email) {
		// business logic
		return dao.getByEmail(email);
	}

	@Override
	public int createAdmin(Administrator a) {
		return dao.createAdmin(a);
	}

	@Override
	public int createMember(Member m) {
		// TODO Auto-generated method stub
		return dao.createMember(m);
	}

	@Override
	public void updatePicture(Catalog catalog, byte[] prikaz) {
		dao.updatePicture(catalog, prikaz);
		
	}

	@Override
	public Member getMember(String email) {
		return dao.getMember(email);
	}

	@Override
	public Administrator getAdmin(String email) {
		return dao.getAdmin(email);
	}

	@Override
	public boolean deleteItem(int id) {
		return dao.deleteItem(id);
	}

}
