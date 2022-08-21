package com.skilldistillery.rewardforpay.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.skilldistillery.rewardforpay.entities.Employee;
import com.skilldistillery.rewardforpay.entities.PointAwarded;
import com.skilldistillery.rewardforpay.entities.PointRedemption;
import com.skilldistillery.rewardforpay.entities.Prize;
import com.skilldistillery.rewardforpay.entities.Status;
import com.skilldistillery.rewardforpay.entities.User;


@Service
@Transactional
@Primary
public class UserDAOImpl implements UserDAO {
	
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public User findById(int userId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public User findByUsername(String username, String password) {
		String exist = "SELECT u FROM User u WHERE u.username = :username AND u.password = :password";
		List<User> users = em.createQuery(exist, User.class).setParameter("username", username).setParameter("password", password).getResultList();
		if(users.size()==0) {
			return null;
		}
		return users.get(0);
	}

	@Override
	public List<User> findUserByKeyword(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> findAllUsers() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User createUser(User user, int empId) {
		
		return user;
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
		return em.find(Employee.class, employeeId);
	}

	@Override
	public List<Employee> findAllEmployees() {
		String query = "SELECT e FROM Employee e";
		return em.createQuery(query, Employee.class).getResultList();
	}

	@Override
	public Employee createEmployee(Employee employee) {
		em.persist(employee);
		return employee;
	}

	@Override
	public Employee updateEmployee(int id, Employee employee) {
		Employee updated = em.find(Employee.class, id);
		updated.setFirstName(employee.getFirstName());
		updated.setLastName(employee.getLastName());
		updated.setSalary(employee.getSalary());
		updated.setAddress(employee.getAddress());
		updated.setDepartment(employee.getDepartment());
		updated.setSupervisorId(employee.getSupervisorId());
		updated.setEmployeePhoto(employee.getEmployeePhoto());
		updated.setBirthday(employee.getBirthday());
		updated.setDescription(employee.getDescription());
		updated.setRequestStatus(employee.getRequestStatus());
		updated.setPrizes(employee.getPrizes());
		return employee;
	}

	@Override
	public Employee deleteEmployee(int id) {
		em.remove(em.find(Employee.class, id));
		return null;
	}

	@Override
	public int findPointBalance(int employeeId) {
		int sum = 0;
		String redeemedquery = "SELECT pr FROM PointRedemption pr WHERE pr.employee = :employeeId";
		List<PointRedemption> redeemed = em.createQuery(redeemedquery, PointRedemption.class).setParameter("employeeId", employeeId).getResultList();
		String awaredquery = "SELECT pa FROM PointAwarded pa WHERE pr.employee = :employeeId";
		List<PointAwarded> awarded = em.createQuery(awaredquery, PointAwarded.class).setParameter("employeeId", employeeId).getResultList();
		
		for(PointAwarded each: awarded) {
			sum +=each.getAmount();
		}
		if(redeemed.size()!=0) {
			for(PointRedemption each: redeemed) {
				sum -=each.getPrize().getPoints();
			}
		}
		return sum;
	}

	@Override
	public PointRedemption createRedemption(PointRedemption redeemed) {
		em.persist(redeemed);
		return redeemed;
	}

	@Override
	public PointRedemption withdrawRedemption(int employeeId, int rewardId) {
		//This is hard to accomplish becasue it doesnt have a status field, prize does
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
	public List<Prize> findPrizesByTier(int tierId) {
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


}
