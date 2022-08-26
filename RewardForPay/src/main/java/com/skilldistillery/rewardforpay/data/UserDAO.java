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
	User createUser(User user, int empId, int departmentId);
	User updateUser(int id, User user);
	User deleteUser(int id); //Inactivate user
		User findUserById(int userId);
		List<User> findUserByKeyword(String keyword);
		User findByUsername(String username, String password);
		List<User> findAllUsers();
		List<User> findAllActiveUsers();
		boolean enableUser(int id);
		boolean disableUser(int id);
		Address createAddress(Address address);
		Address updateAddress(Address address, int addressId);
		List<Prize> showWishList(int employeeId);
		List<Prize> addPrizeToWishlist(int employeeId, int prizeId);
		boolean removePrizeFromWishlist(int employeeId, int prizeId);
		
		
		//Employee profile/actions -Daniel
		Employee createEmployee(Employee employee, int addId, int depId);
		Employee updateEmployee(int id, Employee employee, int depId);
		Employee deleteEmployee(int id); //Inactivate employee
		Employee findEmployeeById(int employeeId);
		List<Employee> findAllEmployees();
		List<Employee> findAllActiveEmployees();
		int findPointBalance(int employeeId);
		PointRedemption createRedemption(PointRedemption pointRedemption); //Jamie update
		PointRedemption withdrawRedemption(int employeeId, int rewardId); //stretch function?
		
		
		
		//Admin actions -Swarm
		List<PointAwarded> pendingPointAwarded() ;//DONE
		List<Employee> pendingEmployees() ;//DONE
		List<Prize> pendingPrize() ; //DONE
		boolean deletePrize(int id); //DONE
		boolean updateStatus(int statusId); //DONE
		PointAwarded updateAward(int awardId, PointAwarded pointAward);// -Jamie
		PointRedemption updateRedemption(int employeeId, int rewardId); //Stretch function
		PointRedemption deleteRedemption(int employeeId, int rewardId); //Stretch function
		

		//Reward items -Jamie
		Prize findPrizeById(int prizeId);
		List<Prize> findAllPrizes();
		List<Prize> findAllActivePrizes();
		List<Prize> findPrizesByTier(int tierId);
		Prize createPrize(Prize prize);
		Prize updatePrize(int id, Prize prize);
		
		
		//Award submissions/points -Jamie
		PointAwarded findAwardByID(int awardId);
		List<PointAwarded> findAllAwards(int employeeId);
		List<PointAwarded> findAllWithdrawnAwards();
		PointAwarded createAward(PointAwarded pointAward, int empId, int userId);
		PointAwarded withdrawAward(int awardId);
		
		
		
		
}
