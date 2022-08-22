package com.skilldistillery.rewardforpay.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.rewardforpay.data.UserDAO;
import com.skilldistillery.rewardforpay.entities.Address;
import com.skilldistillery.rewardforpay.entities.Employee;

@Controller
public class AdminController {
	
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(path =  "adminHome.do" )
	public String home(Model model) {
		return "admin/adminHome";

	}

	@RequestMapping(path="createAddress.do", method= RequestMethod.GET)
	public String createAddress(Model model) {
		return "createAddress";
	}
	
	@RequestMapping(path = "createAddress.do", method = RequestMethod.POST)
	public String addressCreated(Address address, Model model, RedirectAttributes redir) {
		redir.addFlashAttribute("addressAdded", userDao.createAddress(address));
		redir.addAttribute("id", address.getId());
		redir.addFlashAttribute("addMessage", "Employee was successfully added.");
		redir.addFlashAttribute("addFail", "There was a problem adding the address.");
		return "redirect:account.do"; 
	}
	
	@RequestMapping(path="createEmployee.do", method= RequestMethod.GET)
	public String createEmployee(Model model) {
		return "createEmployee";
	}
	
//	@RequestMapping(path = "createEmployee.do", method = RequestMethod.POST)
//	public String employeeCreated(Employee employee, Model model, RedirectAttributes redir) {
//		redir.addFlashAttribute("employeeAdded", userDao.createEmployee(employee));
//		redir.addAttribute("id", employee.getId());
//		redir.addFlashAttribute("addMessage", "Employee was successfully added.");
//		redir.addFlashAttribute("addFail", "There was a problem adding the employee.");
//		return "redirect:account.do"; 
//	}
	
	@RequestMapping(path = "activateUser.do", method = RequestMethod.GET)
	public String activateUser(Model model, int userId) {
		boolean activateUser = userDao.enableUser(userId);
		model.addAttribute("activated", activateUser);
		return "admin/adminHome";
	}
	
	@RequestMapping(path = "deactivateUser.do", method = RequestMethod.GET)
	public String deactivateUser(Model model, int userId) {
		boolean deactivateUser = userDao.disableUser(userId);
		model.addAttribute("deactivated", deactivateUser);
		return "admin/adminHome";
	}
}
