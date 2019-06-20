package com.fer.hr.onlinecatalogue.catalog.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.fer.hr.onlinecatalogue.catalog.services.UserService;
import com.fer.hr.onlinecatalogue.roles.Administrator;
import com.fer.hr.onlinecatalogue.roles.Member;


@Controller
public class UserController {
	
	@Autowired
	private UserService service;
	
	
	@RequestMapping("validateEmail")
	public @ResponseBody String validateEmail(@RequestParam("email") String email) {
		Administrator admin = service.getAdmin(email);
		Member m = service.getMember(email);
		String msg = "";

		if (admin != null || m != null) {
			msg = email  + " already exists";
		}
		return msg;

	}

}
