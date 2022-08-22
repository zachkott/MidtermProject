package com.skilldistillery.rewardforpay.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.rewardforpay.data.UserDAO;
import com.skilldistillery.rewardforpay.entities.Employee;
import com.skilldistillery.rewardforpay.entities.User;

@Controller
public class AccountController {

	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = { "account.do" })
	public String home(HttpSession session, Model model) {
		User user = (User) session.getAttribute("loggedInUser");
		Employee employee = (Employee) session.getAttribute("userinfo");
			model.addAttribute("awardbalance",userDao.findPointBalance(employee.getId()));
			return "account";


	}
}
