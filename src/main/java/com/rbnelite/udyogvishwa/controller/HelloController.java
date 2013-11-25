package com.rbnelite.udyogvishwa.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rbnelite.udyogvishwa.service.HelloWorldService;

@Controller
public class HelloController {

	@Resource
	HelloWorldService helloWorldService;
	
	@RequestMapping(value = "/hello", method=RequestMethod.GET)
	public String hello(ModelMap model) {
		model.addAttribute("message", helloWorldService.getMessage());
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
