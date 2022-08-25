package com.skilldistillery.rewardforpay.data;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.rewardforpay.entities.Employee;
import com.skilldistillery.rewardforpay.entities.PointAwarded;
import com.skilldistillery.rewardforpay.entities.PointRedemption;
import com.skilldistillery.rewardforpay.entities.Prize;
import com.skilldistillery.rewardforpay.entities.UserRole;

@Service
@Transactional
public interface AdminDAO {
	boolean updateStatus(Object obj,int statusId);	
	boolean deleteEmployeeTest(Employee emp);
	 boolean createRedemption(Prize p, Employee e,int remainder);
	 List<PointAwarded>  claimedInitial(int id);
	 List<PointRedemption> claimedInitialT(int employeeId);
	 List<Employee> searchAll(String keyword);
	 List<PointAwarded> showEvents(int id);
	 List<PointAwarded> showRegistered(int id);
	 List<Prize> claimedPrizes(int employeeId);
}
