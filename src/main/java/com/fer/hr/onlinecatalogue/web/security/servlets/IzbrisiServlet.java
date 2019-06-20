package com.fer.hr.onlinecatalogue.web.security.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.fer.hr.onlinecatalogue.catalog.dao.CatalogDAO;

@WebServlet(urlPatterns = { "/izbrisi" })
public class IzbrisiServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(req.getRequestURI().toString());
		req.getRequestDispatcher("/WEB-INF/adminkatalog.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"com/fer/hr/onlinecatalogue/web/security/servlets/config.xml");
		CatalogDAO catalogDao = (CatalogDAO) context.getBean("dao");
		System.out.println(req.getRequestURI().toString());
		if(req.getParameter("id").contains("@")) {
			//brisi korisnika tu 
			catalogDao.deleteUser(req.getParameter("id"));
		}else {
			int id = Integer.parseInt(req.getParameter("id"));
			catalogDao.deleteItem(id);
		}
		req.getRequestDispatcher("/WEB-INF/adminkatalog.jsp").forward(req, resp);
	}
}
