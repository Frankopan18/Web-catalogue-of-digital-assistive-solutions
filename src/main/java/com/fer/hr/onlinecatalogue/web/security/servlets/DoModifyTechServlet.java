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

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.fer.hr.onlinecatalogue.catalog.dao.CatalogDAO;
import com.fer.hr.onlinecatalogue.catalog.entity.Catalog;

@MultipartConfig
@WebServlet(urlPatterns = { "/modificirajTech" })
public class DoModifyTechServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/urediTehnologiju.jsp").forward(req, resp);
		req.setCharacterEncoding("UTF-8");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
				"com/fer/hr/onlinecatalogue/web/security/servlets/config.xml");
		CatalogDAO dao = (CatalogDAO) context.getBean("dao");
		int size = dao.getCatalogItems().size();
		String id = req.getParameter("id");
		req.setCharacterEncoding("UTF-8");
		Catalog item = new Catalog();
		item.setId(Integer.parseInt(id));
		item.setNaziv(req.getParameter("nameField"));
		item.setProizvodjac(req.getParameter("manufacterField"));
		item.setVrstaPoteskoce(req.getParameter("difficulty"));
		item.setLink(req.getParameter("linkField"));
		item.setDostupnost(req.getParameter("availability"));
		item.setCijena(req.getParameter("price"));
		item.setAsistivnaTehnologija(req.getParameter("tech"));
		StringBuilder sbDevices = new StringBuilder();
		for(int i =1;i<=4;i++) {
			if(req.getParameter("device"+i)!=null) {
				sbDevices.append(req.getParameter("device"+i));
				if (i!=4) {
					sbDevices.append(",");
				}
			}
		}
		item.setICTUredjaj(sbDevices.toString());
		item.setOpis(req.getParameter("myname5").trim());
		item.setJezici(req.getParameter("myname4").trim());
		item.setMjestoPrimjene(req.getParameter("myname3"));
		StringBuilder rec = new StringBuilder();
		rec.append("Promotivne: ");
		rec.append(req.getParameter("myname1"));
		rec.append("Korisničke: ");
		rec.append(req.getParameter("myname2"));
		item.setRecenzije(rec.toString().trim());
		// uporabljivost i platforme još i vrsta primjene
		item.setUporabljivost(req.getParameter("usage"));
		
		StringBuilder sbPlatforms = new StringBuilder();
		for(int i =1;i<=6;i++) {
			if(req.getParameter("platform"+i)!=null) {
				sbPlatforms.append(req.getParameter("platform"+i));
				if (i!=6) {
					sbPlatforms.append(",");
				}
			}
		}
		item.setPlatforma(sbPlatforms.toString());
		
		StringBuilder sbTypes = new StringBuilder();
		for(int i =1;i<=4;i++) {
			if(req.getParameter("tip"+i)!=null) {
				sbTypes.append(req.getParameter("tip"+i));
				if (i!=4) {
					sbTypes.append(",");
				}
			}
		}
		item.setVrstaPrimjene(sbTypes.toString().trim());
		byte[] originalPrikaz = dao.findCatalogItem(Integer.parseInt(id)).getPrikaz();
		Part pic = req.getPart("file");
        byte[] bFile = new byte[(int) pic.getSize()];

        try {
        InputStream fileStream = pic.getInputStream();
	     //convert file into array of bytes
	     fileStream.read(bFile);
	     fileStream.close();
        } catch (Exception e) {
	     e.printStackTrace();
        }
        
        if (bFile.length == 0) {
        	item.setPrikaz(originalPrikaz);
        }else {
        	item.setPrikaz(bFile);
        }
		dao.updateCatalogItem(item);
		resp.sendRedirect("/onlinecatalogue/adminkatalog.jsp");
	}
	
	
}
