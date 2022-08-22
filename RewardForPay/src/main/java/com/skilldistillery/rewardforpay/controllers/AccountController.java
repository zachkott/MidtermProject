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
		if (user != null) {
			model.addAttribute("awardbalance",userDao.findPointBalance(employee.getId()));
			return "account";
		} else {
			return "login";
		}
		
	}
	@RequestMapping(path = { "pendingList.do" })
	public String allPending(HttpSession session, Model model) {
		model.addAttribute("pendingPA",userDao.pendingPointAwarded());
		model.addAttribute("pendingPE",userDao.pendingEmployees());
		model.addAttribute("pendingPP",userDao.pendingPrize());
		return "TestMethods";
		
	}
	@RequestMapping(path = { "findAwardTest.do" })
	public String pendingAward(HttpSession session, Model model, int paid) {
		model.addAttribute("award",userDao.findAwardByID(paid));
		return "award";
		
	}
	@RequestMapping(path = { "findEmployeeTest.do" })
	public String pendingEmployee(HttpSession session, Model model, int paid) {
		model.addAttribute("award",userDao.findAwardByID(paid));
		return "employee";

	}
}
