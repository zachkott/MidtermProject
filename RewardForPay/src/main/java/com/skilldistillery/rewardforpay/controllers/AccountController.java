package com.skilldistillery.rewardforpay.controllers;

import java.time.LocalDate;
import java.util.List;

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
			List<Prize> wishlist = userDao.showWishList(employee.getId());
			session.setAttribute("wishlist", wishlist);
			model.addAttribute("numOfPrizes", wishlist.size());
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
	@RequestMapping(path = { "claimedPrizes.do" })
	public String claimedPrizes(HttpSession session, Model model) {
		Employee emp = (Employee) session.getAttribute("userinfo");
		List<Prize> claimedPrizes = adminDao.claimedPrizes(emp.getId());
		model.addAttribute("record",claimedPrizes);
		model.addAttribute("numOfPrizes", claimedPrizes.size());
		return "claimedPrizes";
		
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
			model.addAttribute("redeemed","Congratulations! Please allow 5-10 business days to receive your item at:");		
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
	public String changeToEmployee(HttpSession session, Model model,RedirectAttributes redir) {
		User user = (User) session.getAttribute("loggedInUser");
		session.setAttribute("role", user.getRoles().get(1).getId());
		return "redirect:account.do";
		
	}
	@RequestMapping(path = { "changeToAdmin.do" },method = RequestMethod.GET)
	public String changeToAdmin(HttpSession session, Model model,RedirectAttributes redir) {
		User user = (User) session.getAttribute("loggedInUser");
		if(user.getRoles().size()==1) {
			return "failedAdmin";
		}else {
		session.setAttribute("role", user.getRoles().get(0).getId());
		return "redirect:account.do";
		}
		
	}
	@RequestMapping(path = { "eventsList.do" })
	public String eventsList(HttpSession session, Model model,int empId) {
		System.out.println(empId);
		model.addAttribute("events",adminDao.showEvents(empId));
		return "eventsPage";
		
	}
	@RequestMapping(path = { "joinedEvents.do" })
	public String joinedEvents(HttpSession session, Model model,int empId) {
		System.out.println(empId);
		model.addAttribute("joined",adminDao.showRegistered(empId));
		return "joinedEvents";
		
	}
	@RequestMapping(path="createEvent.do")
	public String createEvent(Model model) {
		return "createEvent";
	}
	@RequestMapping(path="contact.do")
	public String contact(Model model) {
		return "contact";
	}
	@RequestMapping(path = "createEvent.do", method = RequestMethod.POST)
	public String createdEvent(HttpSession session, PointAwarded award, Model model, int empId,String date, int userId, RedirectAttributes redir) {
		PointAwarded newAward = userDao.createAward(award, empId, userId);
		
		LocalDate localDate = LocalDate.parse(date);
		newAward.setIssued(localDate);
		Employee emp = (Employee) session.getAttribute("userinfo");
		redir.addAttribute("empId", emp.getId());
		return "redirect:eventsList.do";
	}
	@RequestMapping(path = "viewEmployee.do")
	public String viewEmployee(int id, Model model) {
		model.addAttribute("employee", userDao.findEmployeeById(id));
		model.addAttribute("joined",adminDao.showRegistered(id));
		model.addAttribute("wishlist", userDao.showWishList(id));
		return "viewEmployee";
	}
}
