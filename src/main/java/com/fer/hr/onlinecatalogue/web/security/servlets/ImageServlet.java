package com.fer.hr.onlinecatalogue.web.security.servlets;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.fer.hr.onlinecatalogue.catalog.dao.CatalogDAO;
import com.fer.hr.onlinecatalogue.catalog.entity.Catalog;

@WebServlet(urlPatterns = { "/image/*" })
public class ImageServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"com/fer/hr/onlinecatalogue/web/security/servlets/config.xml");
		CatalogDAO catalogDao = (CatalogDAO) context.getBean("dao");
		response.setContentType("image/png");
		int idOfCatalogItem = getLastDigits(request.getRequestURI().toString());
		Catalog catalog = catalogDao.findCatalogItem(idOfCatalogItem);
		byte[] picture = catalog.getPrikaz();
		response.setContentLength(picture.length);
		BufferedInputStream input = null;
		BufferedOutputStream output = null;
		try {
			input = new BufferedInputStream(new ByteArrayInputStream(picture));
			output = new BufferedOutputStream(response.getOutputStream());
			byte[] buffer = new byte[8192];
			int length;
			while ((length = input.read(buffer)) > 0) {
				output.write(buffer, 0, length);
			}
		} catch (IOException e) {
			System.out.println("There are errors in reading/writing image stream " + e.getMessage());
		} finally {
			if (output != null)
				try {
					output.close();
				} catch (IOException ignore) {
				}
			if (input != null)
				try {
					input.close();
				} catch (IOException ignore) {
				}
		}

	}

	private static int getLastDigits(String usedString) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < usedString.length(); i++) {
			char c = usedString.charAt(i);
			int ascii = (int) c;
			if (ascii >= 48 && ascii <= 57) {
				sb.append(c);
			}
		}
		return Integer.parseInt(sb.toString());
	}
}