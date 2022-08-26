package com.skilldistillery.rewardforpay.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.rewardforpay.data.AdminDAO;
import com.skilldistillery.rewardforpay.data.UserDAO;
import com.skilldistillery.rewardforpay.entities.PointAwarded;
import com.skilldistillery.rewardforpay.entities.Prize;

@Controller
public class RewardController {
	
	
	
	
//	List<Prize> findPrizesByTier(int tierId);  // add this DAO method to Login Controller- how to get tier? Points issue
	
	
	
	@Autowired
	private UserDAO userDao;
	@Autowired
	private AdminDAO adminDao;

	//Receives id from button on carousel / prize list page and takes user to prize details page
	@RequestMapping(path= {"reward.do"})
	public String prizeDetails(Model model, int id) {
		model.addAttribute("prize", userDao.findPrizeById(id)); 
		model.addAttribute("error", "Sorry, that prize is no longer available.");
		return "reward";
	}
	
	//From loggedInHome, if See all Prizes, passes an id of 0 to show all prizes. If selects tier from dropdown, shows prizes per tier
	@RequestMapping(path="allPrizes.do")
	public String allPrizes(Model model, int id) {
		if (id >=1 && id <= 3) {
			List<Prize> prizes = userDao.findPrizesByTier(id);
			model.addAttribute("prizes", prizes);
			model.addAttribute("numOfPrizes", prizes.size());
			model.addAttribute("prizeError", "Sorry, something went wrong. Please try again later.");
		} else {
			model.addAttribute("prizes", userDao.findAllActivePrizes()); //need to update method parameter in main DAO-waiting to check merge
		}
		return "allRewards";
	}
	
	@RequestMapping(path="createPrize.do", method= RequestMethod.GET)
	public String createPrize(Model model) {
		return "createPrize";
	}
	
	@RequestMapping(path = "createPrize.do", method = RequestMethod.POST)
	public String prizeCreated(Prize prize, Model model, RedirectAttributes redir) {
		redir.addFlashAttribute("prizeAdded", userDao.createPrize(prize));
		redir.addAttribute("id", prize.getId());
		redir.addFlashAttribute("addMessage", "Prize was successfully added.");
		redir.addFlashAttribute("addFail", "There was a problem adding the prize.");
		return "redirect:reward.do"; 
	}
	
	@RequestMapping(path="updatePrize.do", method= RequestMethod.GET)
	public String updatePrize(Model model, int id) {
		model.addAttribute("prize", userDao.findPrizeById(id));
		return "updatePrize";
	}
	
	@RequestMapping(path = "updatePrize.do", method = RequestMethod.POST)
	public String prizeUpdated(Prize prize, int id, Model model, RedirectAttributes redir) {
		redir.addFlashAttribute("siteUpdated", userDao.updatePrize(id, prize));
		redir.addAttribute("id", prize.getId());
		redir.addFlashAttribute("editMessage", "Changes have been submitted for approval.");
		redir.addFlashAttribute("editFail", "There was a problem updating the prize.");
		return "redirect:reward.do"; 
	}
	
	@RequestMapping(path="deletePrize.do", method= RequestMethod.GET)
	public String deletePrize(Model model, int id) {
		model.addAttribute("prize", userDao.findPrizeById(id));
		return "deleteConfirmation";
	}
	
	@RequestMapping(path = "deletePrize.do", method = RequestMethod.POST)
	public String prizeDeleted(Prize prize, int id, Model model, RedirectAttributes redir) {
		redir.addFlashAttribute("prizeDeleted", userDao.deletePrize(id));
		redir.addAttribute("id", 0);
		redir.addFlashAttribute("deleteMessage", "Prize has been deleted.");
		redir.addFlashAttribute("deleteFail", "There was a problem deleting the prize.");
		return "redirect:allPrizes.do"; 
	}
	
	//Full history of awards will display under specific award on award.jsp
	@RequestMapping(path="awardHistory.do")
	public String allAwards(Model model, int empId) {
			model.addAttribute("awards", userDao.findAllAwards(empId));
			model.addAttribute("Error", "Sorry, something went wrong. Please try again later.");
		return "award";
	}
	
	//When user looks for specific award req, takes them to award page w/ award info
	@RequestMapping(path= {"award.do"})
	public String awardDetails(Model model, int awardId, int empId) {
		model.addAttribute("award", userDao.findAwardByID(awardId));
		model.addAttribute("awards", userDao.findAllAwards(empId));
		model.addAttribute("awardNotFound", "Sorry, we can't find that award.");
		return "award";
	}
	
	//From award page, user can withdraw req
	@RequestMapping(path= {"withdrawAward.do"})
	public String withdrawAward(Model model, int awardId, int empId) {  //add extra verification that user submitted request?
		PointAwarded wdAward = userDao.withdrawAward(awardId);
		model.addAttribute("success", "The status of this award is now " + wdAward.getStatus().getName());
		model.addAttribute("awards", userDao.findAllAwards(empId));
		return "award";
	}
	
	//From main homepage logged in, user can submit a new award
	@RequestMapping(path="createAward.do", method= RequestMethod.GET)
	public String createAward(Model model) {
		return "createAward";
	}
	
	//Processes award form and directs user to award details page
	@RequestMapping(path = "createAward.do", method = RequestMethod.POST)
	public String awardCreated(PointAwarded award, Model model, int empId, int userId, RedirectAttributes redir) {
		PointAwarded newAward = userDao.createAward(award, empId, userId);
		if(newAward.getDescription().startsWith("EVENT:")) {
			redir.addAttribute("empId", empId);
			return "redirect:joinedEvents.do";
		}
		if(newAward.getDescription().startsWith("Initial")) {
			redir.addAttribute("empId", empId);
			adminDao.updateStatus(newAward, 1);
			return "redirect:account.do";
		}
		redir.addAttribute("empId", empId);
		redir.addAttribute("awardId", newAward.getId());
		redir.addFlashAttribute("newAwardID", newAward.getId());
		redir.addFlashAttribute("addMessage", "Award request has been submitted for approval.");
		redir.addFlashAttribute("addFail", "There was a problem adding the award.");
		return "redirect:award.do"; 
	}
}