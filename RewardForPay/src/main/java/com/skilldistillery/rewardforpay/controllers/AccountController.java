package com.skilldistillery.rewardforpay.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.rewardforpay.data.AdminDAO;
import com.skilldistillery.rewardforpay.data.UserDAO;
import com.skilldistillery.rewardforpay.entities.Employee;
import com.skilldistillery.rewardforpay.entities.PointAwarded;
import com.skilldistillery.rewardforpay.entities.Prize;
import com.skilldistillery.rewardforpay.entities.User;

@Controller
public class AccountController {

	@Autowired
	private UserDAO userDao;
	@Autowired
	private AdminDAO adminDao;


	@RequestMapping(path = { "account.do" })
	public String home(HttpSession session, Model model) {
		User user = (User) session.getAttribute("loggedInUser");
		Employee employee = (Employee) session.getAttribute("userinfo");
		if (user != null) {
			model.addAttribute("awardbalance",userDao.findPointBalance(employee.getId()));
			session.setAttribute("loggedInUser", user);
			employee = user.getEmployee();
			session.setAttribute("userinfo", employee);
			List<Prize> prizes = userDao.findAllActivePrizes();
			session.setAttribute("prizes", userDao.findAllPrizes());
			model.addAttribute("numOfPrizes", prizes.size());
			model.addAttribute("prizeError", "Sorry, something went wrong. Please try again later.");
			session.setAttribute("rewardBalance", userDao.findPointBalance(employee.getId())); 
			session.setAttribute("claimed", adminDao.claimedInitial(employee.getId())); 
			session.setAttribute("claimedT", adminDao.claimedInitialT(employee.getId())); 
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
		return "admin/TestMethods";
		
	}
	@RequestMapping(path = { "findAwardTest.do" })
	public String pendingAward(HttpSession session, Model model, int paid) {
		model.addAttribute("award",userDao.findAwardByID(paid));
		return "award";
		
	}
	@RequestMapping(path = { "findEmployeeTest.do" })
	public String pendingEmployee(HttpSession session, Model model, int eid) {
		model.addAttribute("employee",userDao.findEmployeeById(eid));
		return "user/showEmployee";
		
	}
	@RequestMapping(path = { "findRewardTest.do" })
	public String pendingReward(HttpSession session, Model model, int rid) {
		model.addAttribute("prize",userDao.findPrizeById(rid));
		return "reward";
		
	}
	@RequestMapping(path = { "updateAwardStatus.do" }, method = RequestMethod.GET)
	public String updateAwardStatus(HttpSession session, Model model, int statusId, int id) {
		PointAwarded pa = userDao.findAwardByID(id);
		adminDao.updateStatus(pa, statusId);
		allPending(session,model);
		return "admin/TestMethods";
		
	}
	@RequestMapping(path = { "updateEmployeeStatus.do" }, method = RequestMethod.GET)
	public String updateEmployeeStatus(HttpSession session, Model model, int statusId, int id) {
		Employee emp = userDao.findEmployeeById(id);
		adminDao.updateStatus(emp, statusId);
		allPending(session,model);
		return "admin/TestMethods";
		
	}
	@RequestMapping(path = { "updatePrizeStatus.do" }, method = RequestMethod.GET)
	public String updatePrizeStatus(HttpSession session, Model model, int statusId, int id) {
		Prize p = userDao.findPrizeById(id);
		adminDao.updateStatus(p, statusId);
		allPending(session,model);
		return "admin/TestMethods";
		
	}
	@RequestMapping(path = { "redeem.do" }, method = RequestMethod.GET)
	public String redeemPrize(HttpSession session, Model model, int id) {
		Prize p = userDao.findPrizeById(id);
		Employee employee = (Employee) session.getAttribute("userinfo");
		int remainder = userDao.findPointBalance(employee.getId());
		if(adminDao.createRedemption(p,employee,remainder)) {
			model.addAttribute("redeemed","Congratulations! Please allow 5-10 business days to receive your item at.");		
		}else {		
			model.addAttribute("Failed","You do not have enough points to redeem this prize.");
		}
		model.addAttribute("prize",p);
		session.setAttribute("rewardBalance", userDao.findPointBalance(employee.getId())); 
		return "redeemConfirmation";
		
	}
	@RequestMapping(path = { "searchEmployee.do" },method = RequestMethod.GET)
	public String searchEmployee(HttpSession session, Model model, String keyword) {
		model.addAttribute("allEmployees",adminDao.searchAll(keyword));
		model.addAttribute("keyword",keyword);
		return "employeeSearch";
		
	}
	@RequestMapping(path = { "changeToEmployee.do" },method = RequestMethod.GET)
	public String changeToEmployee(HttpSession session, Model model) {
		User user = (User) session.getAttribute("loggedInUser");
		session.setAttribute("role", user.getRoles().get(1).getId());
		return "account";
		
	}
	@RequestMapping(path = { "changeToAdmin.do" },method = RequestMethod.GET)
	public String changeToAdmin(HttpSession session, Model model) {
		User user = (User) session.getAttribute("loggedInUser");
		if(user.getRoles().size()==1) {
			return "failedAdmin";
		}else {
		session.setAttribute("role", user.getRoles().get(0).getId());
		return "account";
		}
		
	}
}
