package com.skilldistillery.rewardforpay.data;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.rewardforpay.entities.Address;
import com.skilldistillery.rewardforpay.entities.Employee;
import com.skilldistillery.rewardforpay.entities.PointAwarded;
import com.skilldistillery.rewardforpay.entities.PointRedemption;
import com.skilldistillery.rewardforpay.entities.Prize;
import com.skilldistillery.rewardforpay.entities.Status;
import com.skilldistillery.rewardforpay.entities.User;

@Service
@Transactional
public interface UserDAO {

		//Login/credentialed user actions -Zach
		User findById(int userId);
		List<User> findUserByKeyword(String keyword);
		List<User> findAllUsers();
		User createUser(User user, int empId);
		User updateUser(int id, User user);
		User deleteUser(int id); //Inactivate user
		boolean disableUser(int id);
		boolean enableUser(int id);
		
		//Employee profile/actions -Daniel
		Employee findEmployeeById(int employeeId);
		List<Employee> findAllEmployees();
		Employee createEmployee(Employee employee);
		Employee updateEmployee(int id, Employee employee);
		Employee deleteEmployee(int id); //Inactivate employee
		int findPointBalance(int employeeId);
		PointRedemption createRedemption(PointRedemption pointRedemption);
		PointRedemption withdrawRedemption(int employeeId, int rewardId);
		User findByUsername(String username, String password);
		Address createAddress(Address address);
		
		//Admin actions -Swarm
		List<Status> pendingRequests(Status requestedStatus);
		boolean updateStatus(int statusId);
		List<Status> findAllRequests();
		boolean rejectAward(int id);
		PointAwarded updateAward(int awardId, PointAwarded pointAward);
		Prize deletePrize(int id); //Inactivate prize
		PointRedemption updateRedemption(int employeeId, int rewardId); //Update in case program throws error
		PointRedemption deleteRedemption(int employeeId, int rewardId); //Inactivate redemption
		

		//Reward items -Jamie
		Prize findPrizeById(int prizeId);
		List<Prize> findAllPrizes();
		List<Prize> findPrizesByTier(int tierId);
		Prize createPrize(Prize prize);
		Prize updatePrize(int id, Prize prize);
		
		//Award submissions/points -Jamie
		PointAwarded findAwardByID(int awardId);
		List<PointAwarded> findAllAwards();
		PointAwarded createAward(PointAwarded pointAward);
		PointAwarded withdrawAward(int awardId);
		
		
		
		
}
