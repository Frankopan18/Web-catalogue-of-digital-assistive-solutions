package com.fer.hr.onlinecatalogue.catalog.dao.impl;

import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.fer.hr.onlinecatalogue.catalog.dao.CatalogDAO;
import com.fer.hr.onlinecatalogue.catalog.entity.Catalog;
import com.fer.hr.onlinecatalogue.roles.Administrator;
import com.fer.hr.onlinecatalogue.roles.Member;
import com.fer.hr.onlinecatalogue.roles.User;

@Repository("dao")
public class CatalogDAOImpl implements CatalogDAO {

	// helper catalog map to not go through database and opening workbench + helps
	// in updating single/multiple columns
	private static final Map<String, String> catalogColumns;
	static {
		catalogColumns = new LinkedHashMap<String, String>();
		catalogColumns.put("id", "prvi");
		catalogColumns.put("link", "drugi");
		catalogColumns.put("naziv", "treci");
		catalogColumns.put("proizvodjac", "cetvrti");
		catalogColumns.put("jezici", "peti");
		catalogColumns.put("prikaz", "sesti");
		catalogColumns.put("vrstaPoteskoce", "sedmi");
		catalogColumns.put("ICTUredjaj", "osmi");
		catalogColumns.put("asistivnaTehnologija", "deveti");
		catalogColumns.put("platforma", "deseti");
		catalogColumns.put("cijena", "jedanaesti");
		catalogColumns.put("uporabljivost", "dvanaesti");
		catalogColumns.put("recenzije", "trinaesti");
		catalogColumns.put("dostupnost", "cetrnaesti");
		catalogColumns.put("vrstaPrimjene", "petnaesti");
		catalogColumns.put("mjestoPrimjene", "sesnaesti");
	}

	@Autowired
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	@Transactional
	public int create(Catalog catalog) {
		// napravi provjeru,prije nego sto ga kreiraš provjeri ako postoji vec u bazi sa
		// istim linkom
		List<Catalog> catalogItems = getCatalogItems();
		for (Catalog item : catalogItems) {
			if (item.getLink().equals(catalog.getLink())
					|| item.getLink().replace("http", "https").equals(catalog.getLink())) {
				// if create returns -1,display something on webpage like,catalog item could not
				// be added,already exists one with same link
				return -1;
			}
		}
		Integer result = (Integer) hibernateTemplate.save(catalog); // catalog --> catalogItem
		return result;
	}

	@Override
	@Transactional
	public List<Catalog> getCatalogItems() {
		return hibernateTemplate.loadAll(Catalog.class);
	}

	@Override
	@Transactional
	public Catalog findCatalogItem(int id) {
		return hibernateTemplate.get(Catalog.class, id);
	}
	
	@Override
	@Transactional
	public void updatePicture(Catalog catalog,byte[] prikaz) {
		catalog.setPrikaz(prikaz);
		hibernateTemplate.update(catalog);
	}

	@Override
	@Transactional
	public boolean updateItemSingleColumn(Catalog catalog, String value, String type) {
		Boolean ErrorOccured = false;
		if (catalogColumns.get(type).equals("prvi") || catalogColumns.get(type).equals("drugi")) {
			return false; // these two cannot be changed/updated(id/link)
		}
		switch (type) {
		case "naziv":
			catalog.setNaziv(value);
			break;

		case "proizvodjac":
			catalog.setProizvodjac(value);
			break;

		case "jezici":
			catalog.setJezici(value);
			break;

		case "vrstaPoteskoce":
			catalog.setVrstaPoteskoce(value);
			break;

		case "ICTUredjaj":
			catalog.setICTUredjaj(value);
			break;

		case "asistivnaTehnologija":
			catalog.setAsistivnaTehnologija(value);
			break;

		case "platforma":
			catalog.setPlatforma(value);
			break;

		case "cijena":
			catalog.setCijena(value);
			break;

		case "uporabljivost":
			catalog.setUporabljivost(value);
			break;

		case "recenzije":
			catalog.setRecenzije(value);
			break;

		case "dostupnost":
			catalog.setDostupnost(value);
			break;

		case "vrstaPrimjene":
			catalog.setVrstaPrimjene(value);
			break;

		case "mjestoPrimjene":
			catalog.setMjestoPrimjene(value);
			break;

		default:
			ErrorOccured = true;

		}
		if (!ErrorOccured) {
			hibernateTemplate.update(catalog);
			return true;
		}
		return false;
	}

	@Override
	@Transactional
	// doesnt'work GOOD!FIX IT!
	public boolean updateItemMultipleColumns(Catalog catalog, List<String> values, List<String> types) {
		List<Boolean> boolValues = new LinkedList<>();
		for (String value : values) {
			for (String type : types) {
				boolValues.add(updateItemSingleColumn(catalog, value, type));
			}
		}
		for (Boolean booleanValue : boolValues) {
			if (!booleanValue) {
				return false; // here one or multiple update values didn't pass,should display error message
								// later
			}
		}
		return true; // this means all updates of all columns passed
	}

	@Override
	@Transactional
	public User getUser(int id) {
		return hibernateTemplate.get(User.class, id);

	}

	@Override
	@Transactional
	public User getByEmail(String email) {
		List<User> users = hibernateTemplate.loadAll(User.class);
		for (User user : users) {
			if (user.getMail().equals(email)) {
				return user;
			}
		}
		return null;
	}

	@Override
	@Transactional
	public List<User> getAllUsers() {
		return hibernateTemplate.loadAll(User.class);
	}

	@Override
	@Transactional
	public int createAdmin(Administrator a) {
		int num = hibernateTemplate.loadAll(Administrator.class).size();
		hibernateTemplate.save(a);
		if (hibernateTemplate.loadAll(Administrator.class).size() > num) {
			return 1;
		}else {
			return -1;
		}	
	}

	@Override
	@Transactional
	public int createMember(Member m) {
		int num = hibernateTemplate.loadAll(Member.class).size();
		hibernateTemplate.save(m);
		if (hibernateTemplate.loadAll(Member.class).size() > num) {
			return 1;
		}else {
			return -1;
		}	
	}

	@Override
	@Transactional
	public Member getMember(String email) {
		List<Member> users = hibernateTemplate.loadAll(Member.class);
		for (Member user : users) {
			if (user.getMail().equals(email)) {
				return user;
			}
		}
		return null;
	}

	@Override
	@Transactional
	public Administrator getAdmin(String email) {
		List<Administrator> users = hibernateTemplate.loadAll(Administrator.class);
		for (Administrator user : users) {
			if (user.getMail().equals(email)) {
				return user;
			}
		}
		return null;
	}

	@Override
	@Transactional
	public boolean deleteItem(int id) {
		hibernateTemplate.delete(hibernateTemplate.get(Catalog.class, id));
		return false;
	}

	@Override
	@Transactional
	public boolean deleteUser(String email) {
		if (getMember(email)!=null) {
			hibernateTemplate.delete(getMember(email));
			return true;
		}
		return false;
	}

	@Override
	public void updateCatalogItem(Catalog catalog) {
		hibernateTemplate.update(catalog);
	}

	@Override
	@Transactional
	public boolean deleteAdmin(String email) {
		if (getAdmin(email)!=null) {
			hibernateTemplate.delete(getAdmin(email));
			return true;
		}
		return false;
	}

}
