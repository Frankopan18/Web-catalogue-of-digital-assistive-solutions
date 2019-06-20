package com.fer.hr.onlinecatalogue.web.security.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.fer.hr.onlinecatalogue.catalog.dao.CatalogDAO;
import com.fer.hr.onlinecatalogue.catalog.dao.CatalogDAOProvider;
import com.fer.hr.onlinecatalogue.catalog.entity.Catalog;
import com.fer.hr.onlinecatalogue.catalog.settings.Preferences;
import com.fer.hr.onlinecatalogue.roles.Administrator;
import com.fer.hr.onlinecatalogue.roles.Member;

@WebServlet(urlPatterns = { "/index.jsp" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/login.jsp").forward(req, resp);
//		System.out.println("Dogodilo se");
//		ApplicationContext context = new ClassPathXmlApplicationContext(
//				"com/fer/hr/onlinecatalogue/web/security/servlets/config.xml");
//		CatalogDAO catalogDao = (CatalogDAO) context.getBean("dao");
//		ClassLoader classLoader = getClass().getClassLoader();
//		File some = new File(classLoader.getResource("catalogPictures").getFile());
//		//File some = new File(Preferences.CATALOG_PICTURES);
//		Catalog catalogItem = null;
//		byte[] bFile = null;
//		// sve je dobro,samo brojeve krivo vraća
//		for(File file : some.listFiles()) {
//			int returnNumber = getLastDigits(file.getAbsolutePath().toString().replace(".png", ""));
//			catalogItem = catalogDao.findCatalogItem(returnNumber);
//			bFile = new byte[(int) file.length()]; 
//	        try {
//	            FileInputStream fileInputStream = new FileInputStream(file);
//	            fileInputStream.read(bFile);
//	            fileInputStream.close();
//	        } catch (Exception e) {
//	            e.printStackTrace();
//	        }
//			catalogDao.updatePicture(catalogItem, bFile);
//		}	
//		System.out.println("Završilo je");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mail = req.getParameter("email");
		String lozinka = req.getParameter("lozinka");
		boolean isAdmin = false;
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
				"com/fer/hr/onlinecatalogue/web/security/servlets/config.xml");
		CatalogDAO dao = (CatalogDAO) context.getBean("dao");

		Member k = dao.getMember(mail);
		// System.out.println(k);
		Administrator a = null;

		if (k == null) {
			isAdmin = true;
			a = dao.getAdmin(mail);
		}
		if (k != null || a != null) {
			if (isAdmin) {
				req.getSession().setAttribute("current.user.username", a.getUsername());
			} else {
				req.getSession().setAttribute("current.user.username", k.getUsername());
			}
			req.getSession().setAttribute("current.user.mail", mail);
			if (!isAdmin) {
				if (lozinka.equals(k.getLozinka())) {
					String contextPath = req.getContextPath();
					resp.sendRedirect(contextPath + "/katalog.jsp");
					return;
				}
			} else {
				if (a.getUsername().equals("topuser")) {
					if (lozinka.equals(a.getLozinka())) {
						String contextPath = req.getContextPath();
						resp.sendRedirect(contextPath + "/adminkatalog.jsp");
						return;
						
					}
				}else {
					if (lozinka.equals(a.getLozinka())) {
						String contextPath = req.getContextPath();
						resp.sendRedirect(contextPath + "/adminkatalog1.jsp");
						return;
					}
				}
			}
		}
		resp.sendRedirect("/onlinecatalogue/index.jsp");
	}
	
	private static int getLastDigits(String usedString) {
		StringBuilder sb = new StringBuilder();
		for (int i = usedString.length() - 1 ; i >=0 ; i--) {
			char c = usedString.charAt(i);
			int ascii = (int) c;
			if (ascii >= 48 && ascii <= 57) {
				sb.append(c);
			}else {
				break;
			}
		}
		return Integer.parseInt(sb.reverse().toString());
	}
}
