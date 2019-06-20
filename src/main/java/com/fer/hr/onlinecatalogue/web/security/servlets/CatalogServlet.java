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
import com.fer.hr.onlinecatalogue.roles.Member;

@WebServlet(urlPatterns = { "/katalog.jsp" })
public class CatalogServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// fix this,isto kao admina
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"com/fer/hr/onlinecatalogue/web/security/servlets/config.xml");
		CatalogDAO catalogDao = (CatalogDAO) context.getBean("dao");
		Member m = catalogDao.getMember(req.getSession().getAttribute("current.user.mail").toString());
		if (m != null) {
			req.getRequestDispatcher("/WEB-INF/katalog.jsp").forward(req, resp);
		} else {
			resp.sendRedirect("/onlinecatalogue/AppExceptionHandler");
		}
	}

}
