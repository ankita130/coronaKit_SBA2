package com.eval.coronakit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

	
	@RequestMapping("/custom-login")
	public String login() {
		return "login-form";
	}
	
	@RequestMapping("/custom-error")
	public String error() {
		return "error-page";
	}
	
	@RequestMapping("/validate")
	public String validateLogin() {
		return "main-menu";
	}
	
	@RequestMapping(value={"/custom-login/*","/validate/*","/custom-error/*"})
	public String inValidUrl() {
		return "invalidUrl";
	}
	
	
}
