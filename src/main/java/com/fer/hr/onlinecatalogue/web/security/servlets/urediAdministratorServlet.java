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
import com.fer.hr.onlinecatalogue.roles.Administrator;

@WebServlet(urlPatterns = { "/urediAdministrator.jsp" })
public class urediAdministratorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"com/fer/hr/onlinecatalogue/web/security/servlets/config.xml");
		CatalogDAO catalogDao = (CatalogDAO) context.getBean("dao");
		Administrator a = catalogDao.getAdmin(req.getSession().getAttribute("current.user.mail").toString());
		if (a != null && a.getUsername().equals("topuser")) {
			req.getRequestDispatcher("/WEB-INF/urediAdministrator.jsp").forward(req, resp);
		} else {
			resp.sendRedirect("/onlinecatalogue/AppExceptionHandler");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/tech.jsp").forward(req, resp);
	}

}
