package com.fer.hr.onlinecatalogue.web.security.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.fer.hr.onlinecatalogue.catalog.dao.CatalogDAO;
import com.fer.hr.onlinecatalogue.catalog.dao.CatalogDAOProvider;
import com.fer.hr.onlinecatalogue.catalog.services.UserService;
import com.fer.hr.onlinecatalogue.catalog.settings.Preferences;
import com.fer.hr.onlinecatalogue.roles.Administrator;
import com.fer.hr.onlinecatalogue.roles.User;
import com.fer.hr.onlinecatalogue.roles.Member;


@WebServlet(urlPatterns = { "/register.jsp" })
public class RegisterServlet extends HttpServlet {
	/***/
	private static final long serialVersionUID = 1L;
	@Autowired
	private UserService userService;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/register.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = new User();
		Member member = new Member();
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("com/fer/hr/onlinecatalogue/web/security/servlets/config.xml");
		CatalogDAO dao = (CatalogDAO) context.getBean("dao");
		user.setUsername(req.getParameter("username"));
		user.setMail(req.getParameter("email"));
		user.setLozinka(req.getParameter("pass"));
		member.setLozinka(user.getLozinka());
		member.setMail(user.getMail());
		member.setUsername(user.getUsername());
		dao.createMember(member);
		String contextPath = req.getContextPath();
		resp.sendRedirect(contextPath + "/index.jsp");
	}
}
