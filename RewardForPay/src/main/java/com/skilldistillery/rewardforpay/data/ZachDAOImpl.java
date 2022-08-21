package com.skilldistillery.rewardforpay.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
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
public class ZachDAOImpl implements UserDAO {
	
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public User findById(int userId) {
		return em.find(User.class, userId);
	}

	@Override
	public List<User> findUserByKeyword(String keyword) {
		keyword = "%" + keyword + "%";
		
		String jpql = "SELECT u FROM User u WHERE u.userName LIKE :keyword";
		
		
		return em.createQuery(jpql, User.class).setParameter("keyword", keyword).getResultList();
	}

	@Override
	public List<User> findAllUsers() {
		String jpql =  "SELECT u FROM  User u";
		return em.createQuery(jpql, User.class).getResultList();
	}

	@Override
	public User createUser(User user, int empId) {
		Employee employee = em.find(Employee.class, empId);
		user.setEmployee(employee);
		em.persist(user);
		
		return user;
	}

	@Override
	public User updateUser(int id, User user) {
		User updatedUser =em.find(User.class, id);
		
		updatedUser.setUsername(user.getUsername());
		updatedUser.setPassword(user.getPassword());
		updatedUser.setEnabled(user.getEnabled());
		updatedUser.setRoles(user.getRoles());
		
		
		return updatedUser;
	}

	@Override
	public User deleteUser(int id) {
		User userToBeDeleted =em.find(User.class, id);
		
		em.remove(userToBeDeleted);
		
		return userToBeDeleted;
	}

	@Override
	public Employee findEmployeeById(int employeeId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Employee> findAllEmployees() {
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
	public PointRedemption createRedemption(PointRedemption redeemed) {
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
	public List<Status> findAllRequests() {
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
	public List<Prize> findAllPrizes() {
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
	public List<PointAwarded> findAllAwards() {
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

	@Override
	public List<Prize> findPrizesByTier(int tierId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User findByUsername(String username, String password) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Address createAddress(Address address) {
		// TODO Auto-generated method stub
		return null;
	}

}
