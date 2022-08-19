package com.skilldistillery.rewardforpay.data;

import java.util.List;

import com.skilldistillery.rewardforpay.entities.Employee;
import com.skilldistillery.rewardforpay.entities.PointAwarded;
import com.skilldistillery.rewardforpay.entities.PointRedemption;
import com.skilldistillery.rewardforpay.entities.Prize;
import com.skilldistillery.rewardforpay.entities.Status;
import com.skilldistillery.rewardforpay.entities.User;


public interface UserDAO {

		//Login/credentialed user actions -Zach
		User findById(int userId);
		User findUserByKeyword(String keyword);
		User findAllUsers();
		User createUser(User user);
		User updateUser(int id, User user);
		User deleteUser(int id);
		
		//Employee profile/actions -Daniel
		Employee findEmployeeById(int employeeId);
		Employee findAllEmployees(int employeeId);
		Employee createEmployee(Employee employee);
		Employee updateEmployee(int id, Employee employee);
		Employee deleteEmployee(int id);
		int findPointBalance(int employeeId);
		PointRedemption createRedemption(int employeeId, int rewardId);
		PointRedemption withdrawRedemption(int employeeId, int rewardId);
		
		//Admin actions -Swarm
		List<Status> pendingRequests(Status requestedStatus);
		boolean updateStatus(int statusId);
		Prize findAllRequests(int employeeId);
		boolean rejectAward(int id);
		PointAwarded updateAward(int awardId, PointAwarded pointAward);
		Prize deletePrize(int id);
		PointRedemption updateRedemption(int employeeId, int rewardId); //Update in case program throws error
		PointRedemption deleteRedemption(int employeeId, int rewardId); //Inactivate
		

		//Reward items -Jamie
		Prize findPrizeById(int prizeId);
		Prize findAllPrizes(int prizeId);
		Prize createPrize(Prize prize);
		Prize updatePrize(int id, Prize prize);
		
		//Award submissions/points -Jamie
		PointAwarded findAwardByID(int awardId);
		List<PointAwarded> findAllAwards(int awardId);
		PointAwarded createAward(PointAwarded pointAward);
		PointAwarded withdrawAward(int awardId);
		
		
		
		
}
