package com.skilldistillery.rewardforpay.controllers;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.rewardforpay.data.UserDAO;
import com.skilldistillery.rewardforpay.entities.Address;
import com.skilldistillery.rewardforpay.entities.Employee;
import com.skilldistillery.rewardforpay.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {
		
		return "home";

	}

	@RequestMapping(path = "createUserAccountForm.do")
	public String createUserForm(Model model) {
		return "user/createUser";
	}

//	@RequestMapping(path = "createUser.do", method = RequestMethod.POST)
//	public ModelAndView createUserAccount(Model model, User user, RedirectAttributes redir, int empId) {
//		ModelAndView mv = new ModelAndView();
//		User newUser = userDao.createUser(user, empId);
////		newUser.setEnabled(true);
//		boolean createdUser = newUser.getId() > 0 ? true : false;
//		redir.addFlashAttribute("newUser", newUser);
//		redir.addFlashAttribute("createdUser", createdUser);
//		mv.setViewName("redirect:userWasCreated.do");
//		return mv;
//	}

	@RequestMapping(path = "createUser.do", method = RequestMethod.POST)
	public ModelAndView createUserAccount( Model model, String date,  Employee  employee, Address address, User user, RedirectAttributes redir) {
		LocalDate localDate = LocalDate.parse(date);
		employee.setBirthday(localDate);
		
		// Add address
		redir.addFlashAttribute("addressAdded", userDao.createAddress(address));
		redir.addAttribute("id", address.getId());
		redir.addFlashAttribute("addMessage", "Employee was successfully added.");
		redir.addFlashAttribute("addFail", "There was a problem adding the address.");
		
		// Add  employee
		
		redir.addFlashAttribute("employeeAdded", userDao.createEmployee(employee, address.getId()));
		redir.addAttribute("id", employee.getId());
		redir.addFlashAttribute("addMessage", "Employee was successfully added.");
		redir.addFlashAttribute("addFail", "There was a problem adding the employee.");
		
		// Create User
		ModelAndView mv = new ModelAndView();
		User newUser = userDao.createUser(user, employee.getId());
//		newUser.setEnabled(true);
		boolean createdUser = newUser.getId() > 0 ? true : false;
		redir.addFlashAttribute("newUser", newUser);
		redir.addFlashAttribute("createdUser", createdUser);
		mv.setViewName("redirect:userWasCreated.do");
		return mv;
	}

	@RequestMapping(path = "userWasCreated.do", method = RequestMethod.GET)
	public String userHasBeenCreated(Model model) {
		return "user/userConfirmation";
	}

	@RequestMapping(path = "updateUserForm.do")
	public String updateUserForm(int id, User user, Model model) {
		model.addAttribute("user", userDao.findUserById(id));
		return "user/updateUserDetails";
	}

	@RequestMapping(path = "updateUser.do", method = RequestMethod.POST)
	public String updateUserDetails(int id, User user, Model model) {
		userDao.updateUser(id, user);
		model.addAttribute("user", user);
		return "user/showUser";
	}

	@RequestMapping(path = "showAllUsers.do", method = RequestMethod.GET)
	public String showAllUsers(Model model) {
		List<User> users = userDao.findAllUsers();
		model.addAttribute("allUsers", users);
		return "user/userResults";
	}

	@RequestMapping(path = "findUser.do")
	public String findUser(int userId, Model model) {
		User thisUser = userDao.findUserById(userId);
		model.addAttribute("user", thisUser);
		return "user/showUser";
	}

	@RequestMapping(path = "userNameSearch.do", method = RequestMethod.GET)
	public String searchUsername(String keyword, Model model) {
		model.addAttribute("users", userDao.findUserByKeyword(keyword));
		return "user/userResults";
	}

	// Admin only
//	@RequestMapping(path = "deleteUser.do", method = RequestMethod.GET)
//	public String deleteUser(Integer id, Model model) {
//		if (id <= 0) {
//			return "index";
//		}
//
//		User status = userDao.findUserById(id);
//		if (userDao.deleteUser(id) != null) {
//			model.addAttribute("user", status);
//			return "user/deletedUser";
//		} else {
//			return "index";
//		}
//
//	}

//	@RequestMapping(path = "activateUser.do", method = RequestMethod.GET)
//	public String activateUser(Model model, int userId) {
//		boolean activateUser = userDao.enableUser(userId);
//		model.addAttribute("activated", activateUser);
//		return "admin/adminHome";
//	}
//	
//	@RequestMapping(path = "deactivateUser.do", method = RequestMethod.GET)
//	public String deactivateUser(Model model, int userId) {
//		boolean deactivateUser = userDao.disableUser(userId);
//		model.addAttribute("deactivated", deactivateUser);
//		return "admin/adminHome";
//	}
	
	
	@RequestMapping(path = "updateEmployeeForm.do")
	public String updateEmployeeForm(int id, Employee employee, Model model) {
		model.addAttribute("employee", userDao.findEmployeeById(id));
		return "user/updateEmployeeDetails";
	}

	@RequestMapping(path = "editEmployee.do", method = RequestMethod.POST)
	public String updateUserDetails(int id,Address address,int addressId, String date, HttpSession session, Employee employee, Model model) {
		Address add = userDao.updateAddress(address, addressId);
		employee.setAddress(add);
		LocalDate localDate = LocalDate.parse(date);
		employee.setBirthday(localDate);
		employee = userDao.updateEmployee(id, employee);
		
		model.addAttribute("employee", employee);
		session.setAttribute("userinfo", employee);
		return "user/showEmployee";
	}
}
