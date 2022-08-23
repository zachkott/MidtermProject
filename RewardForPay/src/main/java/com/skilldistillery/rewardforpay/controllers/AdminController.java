package com.skilldistillery.rewardforpay.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.rewardforpay.data.UserDAO;
import com.skilldistillery.rewardforpay.entities.Address;
import com.skilldistillery.rewardforpay.entities.Employee;
import com.skilldistillery.rewardforpay.entities.User;

@Controller
public class AdminController {

	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = "adminHome.do")
	public String home(Model model) {
		return "admin/adminHome";

	}

	@RequestMapping(path = "createAddress.do", method = RequestMethod.GET)
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

	@RequestMapping(path = "createEmployee.do", method = RequestMethod.GET)
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
	
	
	@RequestMapping(path = "deleteUser.do", method = RequestMethod.GET)
	public String deleteUser(int id, Model model) {
		if (id <= 0) {
			return "home";
		}

		User status = userDao.findUserById(id);
		if (userDao.deleteUser(id) != null) {
			model.addAttribute("user", status);
			return "user/deletedUser";
		} else {
			return "home";
		}

	}

	@RequestMapping(path = "adminAllUsers.do", method = RequestMethod.GET)
	public String showAdminAllUsers(Model model) {
		List<User> users = userDao.findAllUsers();
		model.addAttribute("allUsers", users);
		return "admin/adminAllUsers";
	}

	@RequestMapping(path = "adminUpdateUserForm.do")
	public String adminUpdateUserForm(Integer id, User user, Model model) {
		model.addAttribute("user", userDao.findUserById(id));
		return "admin/adminUpdateUser";
	}

	@RequestMapping(path = "adminAllEmployees.do", method = RequestMethod.GET)
	public String showAdminAllEmployees(Model model) {
		List<Employee> emps = userDao.findAllEmployees();
		model.addAttribute("allEmployees", emps);
		return "admin/adminAllEmployees";
	}

	@RequestMapping(path = "adminUpdateEmployeeForm.do")
	public String adminUpdateEmployeeForm(Integer id, Employee employee, Model model) {
		model.addAttribute("employee", userDao.findEmployeeById(id));
		return "admin/adminUpdateEmployee";
	}

	@RequestMapping(path = "adminUpdateEmployee.do", method = RequestMethod.POST)
	public String updateEmployeeDetails(int id, int addressId, Address address, Employee employee, Model model,
			HttpSession session) {

		Address addressUpdate = userDao.updateAddress(address, addressId);
		employee.setAddress(addressUpdate);
		session.setAttribute("address", addressUpdate.getId());
		userDao.updateEmployee(id, employee);
		model.addAttribute("employee", employee);
		return "user/showEmployee";
	}
	
	@RequestMapping(path = "adminDeleteEmployeeForm.do")
	public String adminDeleteEmployeeForm(Integer id, Employee employee, Model model) {
		model.addAttribute("employee", userDao.deleteEmployee(id));
		return "admin/adminDeleteEmployee";
	}
	
	@RequestMapping(path = "findEmployee.do")
	public String findEmployee(int employeeId, Model model) {
		Employee emp = userDao.findEmployeeById(employeeId);
		model.addAttribute("employee", emp);
		return "user/showEmployee";
	}

	
	@RequestMapping(path = "deleteEmployee.do", method = RequestMethod.GET)
	public String deleteEmployee(HttpSession session,int id, Model model) {
		Employee emp = (Employee) session.getAttribute("employee");

		
		if (userDao.deleteEmployee(emp.getId()) != null) {
			model.addAttribute("actionResult", "Employee deleted");
			session.removeAttribute("employee");
			return "admin/adminAllEmployees";
		} else {
			model.addAttribute("actionResult", "Employee not found");
			session.removeAttribute("employee");

		}
			return "admin/adminHome";

	}
}
