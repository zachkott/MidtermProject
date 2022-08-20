package com.skilldistillery.rewardforpay.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.rewardforpay.data.UserDAO;
import com.skilldistillery.rewardforpay.entities.User;

@Controller
public class LoginController {
	
	@Autowired
	private UserDAO userDao;

//	@RequestMapping (path ="login.do",method = RequestMethod.GET) 
//	public String goToLoginForm(HttpSession session) {
//		User user = (User)session.getAttribute("loggedInUser");
//		if(user!=null) {
//			return "account";
//		}else {
//		return "login";
//		}
//		return "login";
//	}
//	@RequestMapping (path ="login.do",method = RequestMethod.POST) 
//	public String login(User user, HttpSession session) {
//		user=dao.getUserByUserNameAndPassword(user.getUserName(), user.getPassword());
//		if(user == null) {
//			return "login";
//		}else {
//			session.setAttribute("loggedInUser", user);
//			return "account";
//		}
//		return "login";
//	}
	@RequestMapping (path ="logout.do") 
	public String logout(HttpSession session) {
		session.removeAttribute("loggedInUser");
		return "logout";
	}
}
