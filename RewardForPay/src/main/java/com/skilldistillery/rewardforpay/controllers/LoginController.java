package com.skilldistillery.rewardforpay.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.rewardforpay.data.AdminDAO;
import com.skilldistillery.rewardforpay.data.UserDAO;
import com.skilldistillery.rewardforpay.entities.Employee;
import com.skilldistillery.rewardforpay.entities.User;

@Controller
public class LoginController {
	
	@Autowired
	private UserDAO userDao;
	@Autowired
	private AdminDAO adminDao;

	@RequestMapping (path ="login.do",method = RequestMethod.GET) 
	public String goToLoginForm(HttpSession session) {
		User user = (User)session.getAttribute("loggedInUser");
		if(user!=null) {
			return "account";
		}else {
		return "login";
		}
	}
	@RequestMapping (path ="login.do",method = RequestMethod.POST) 
	public String login(User user, HttpSession session, Model model, RedirectAttributes redir) {
		user=userDao.findByUsername(user.getUsername(), user.getPassword());
		if(user == null) {
			model.addAttribute("NotFound", "User not found. Please check username or password");
			return "login";
		}else {
			session.setAttribute("loggedInUser", user);
			Employee employee = user.getEmployee();
			session.setAttribute("userinfo", employee);
			session.setAttribute("role", user.getRoles().get(0).getId());
			return "redirect:account.do";
		}
	}
	@RequestMapping (path ="logout.do") 
	public String logout(HttpSession session) {
		session.removeAttribute("loggedInUser");
		session.removeAttribute("role");
		session.removeAttribute("userinfo");
		return "redirect:home.do";
	}
	@RequestMapping (path ="DanielTest.do") 
	public String DanielTest(HttpSession session) {

		return "DanielTest";
	}
}
