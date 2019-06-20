package com.fer.hr.onlinecatalogue.web.security.servlets;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.fer.hr.onlinecatalogue.catalog.dao.CatalogDAO;
import com.fer.hr.onlinecatalogue.catalog.entity.Catalog;
import com.fer.hr.onlinecatalogue.roles.Administrator;

@WebServlet(urlPatterns = { "/dodajAdministrator.jsp" })
public class DodajAdministratorServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"com/fer/hr/onlinecatalogue/web/security/servlets/config.xml");
		CatalogDAO catalogDao = (CatalogDAO) context.getBean("dao");
		Administrator a = catalogDao.getAdmin(req.getSession().getAttribute("current.user.mail").toString());
		if (a!=null && a.getUsername().equals("topuser")) {
			req.getRequestDispatcher("/WEB-INF/dodajAdministrator.jsp").forward(req, resp);
			req.setCharacterEncoding("UTF-8");
		}else {
			resp.sendRedirect("/onlinecatalogue/AppExceptionHandler");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
				"com/fer/hr/onlinecatalogue/web/security/servlets/config.xml");
		CatalogDAO dao = (CatalogDAO) context.getBean("dao");
		int size = dao.getCatalogItems().size();
		req.setCharacterEncoding("UTF-8");
		Administrator a = new Administrator();
		// we can't have another topuser administrator
		if (!req.getParameter("username").equals("topuser")) {
			a.setUsername(req.getParameter("username"));
			a.setMail(req.getParameter("email"));
			a.setLozinka(req.getParameter("pass"));
		}
		dao.createAdmin(a);
		resp.sendRedirect("/onlinecatalogue/adminkatalog.jsp");
	}
	
	
}
