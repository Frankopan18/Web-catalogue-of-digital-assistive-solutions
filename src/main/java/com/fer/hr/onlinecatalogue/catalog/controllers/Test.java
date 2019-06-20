//package com.fer.hr.onlinecatalogue.catalog.controllers;
//
//import java.io.File;
//import java.io.FileInputStream;
//import org.springframework.context.ApplicationContext;
//import org.springframework.context.support.ClassPathXmlApplicationContext;
//import com.fer.hr.onlinecatalogue.catalog.dao.CatalogDAO;
//import com.fer.hr.onlinecatalogue.catalog.entity.Catalog;
//import com.fer.hr.onlinecatalogue.catalog.settings.Preferences;
//
//public class Test {
//
//	public static void main(String[] args) {
//
//		// TEST IS RUNNED TO UPDATE ALL "PRIKAZ" COLUMN VARIABLES
//		// LATER ON WHEN TRANSFERING TO ANOTHER COMPUTER FIRST RUN TEST METHOD TO UPDATE
//		// .PNG PATH VARIABLES
//		// WILL SAY IN INSTRUCTIONS IN FINAL PAPERS
//
//		ApplicationContext context = new ClassPathXmlApplicationContext(
//				"com/fer/hr/onlinecatalogue/web/security/config.xml");
//		CatalogDAO catalogDao = (CatalogDAO) context.getBean("dao");
//		File some = new File(Preferences.CATALOG_PICTURES);
//		Catalog catalogItem = null;
//		byte[] bFile = null;
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
//	}
//
//	private static int getLastDigits(String usedString) {
//		StringBuilder sb = new StringBuilder();
//		for (int i = 0; i < usedString.length(); i++) {
//			char c = usedString.charAt(i);
//			int ascii = (int) c;
//			if (ascii >= 48 && ascii <= 57) {
//				sb.append(c);
//			}
//		}
//		return Integer.parseInt(sb.toString());
//	}
//}