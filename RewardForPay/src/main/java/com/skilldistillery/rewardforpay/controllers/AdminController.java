package com.skilldistillery.rewardforpay.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.rewardforpay.data.UserDAO;

@Controller
public class AdminController {
	
	@Autowired
	private UserDAO userDao;

//	@RequestMapping(path= {"account.do"})
//	public String home(Model model) {
//		model.addAttribute("SMOKETEST", userDao.findById(1)); //DELETE
//		return "home";
//		
//	}
}
