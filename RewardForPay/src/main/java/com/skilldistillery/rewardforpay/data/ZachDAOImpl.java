package com.skilldistillery.rewardforpay.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.rewardforpay.entities.Employee;
import com.skilldistillery.rewardforpay.entities.PointAwarded;
import com.skilldistillery.rewardforpay.entities.PointRedemption;
import com.skilldistillery.rewardforpay.entities.Prize;
import com.skilldistillery.rewardforpay.entities.Status;
import com.skilldistillery.rewardforpay.entities.User;


@Service
@Transactional
public class ZachDAOImpl implements UserDAO {
	
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public User findById(int userId) {
		return em.find(User.class, userId);
	}

	@Override
	public User findUserByKeyword(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User findAllUsers() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User createUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User updateUser(int id, User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User deleteUser(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Employee findEmployeeById(int employeeId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Employee findAllEmployees(int employeeId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Employee createEmployee(Employee employee) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Employee updateEmployee(int id, Employee employee) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Employee deleteEmployee(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int findPointBalance(int employeeId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public PointRedemption createRedemption(int employeeId, int rewardId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PointRedemption withdrawRedemption(int employeeId, int rewardId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Status> pendingRequests(Status requestedStatus) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean updateStatus(int statusId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Prize findAllRequests(int employeeId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean rejectAward(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public PointAwarded updateAward(int awardId, PointAwarded pointAward) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Prize deletePrize(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PointRedemption updateRedemption(int employeeId, int rewardId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PointRedemption deleteRedemption(int employeeId, int rewardId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Prize findPrizeById(int prizeId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Prize findAllPrizes(int prizeId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Prize createPrize(Prize prize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Prize updatePrize(int id, Prize prize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PointAwarded findAwardByID(int awardId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PointAwarded> findAllAwards(int awardId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PointAwarded createAward(PointAwarded pointAward) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PointAwarded withdrawAward(int awardId) {
		// TODO Auto-generated method stub
		return null;
	}

}
