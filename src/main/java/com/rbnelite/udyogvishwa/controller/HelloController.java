package com.rbnelite.udyogvishwa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HelloController {

	@RequestMapping(value = "/hello", method=RequestMethod.GET)
	public String hello(Model model) {
		return "hello";
	}
	
	@RequestMapping(value = "/redirect")
	public String redirect(){
		return "redirect:redirectBye";
	}
	
	@RequestMapping(value = "/redirectBye")
	public String redirectBye(){
		return "redirectBye";
	}
	
	@RequestMapping(value = "/redirectOutSide")
	public String redirectOutSide(){
		return "redirect:http://google.com";
	}

	@RequestMapping(value = "/helloForward", method=RequestMethod.GET)
	public String helloForward(Model model) {
		return "forward:redirectBye";
	}
}
