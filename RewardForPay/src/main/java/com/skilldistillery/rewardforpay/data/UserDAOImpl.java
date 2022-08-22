package com.skilldistillery.rewardforpay.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.context.annotation.Primary;
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
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User findByUsername(String username, String password) {
		String exist = "SELECT u FROM User u WHERE u.username = :username AND u.password = :password";
		List<User> users = em.createQuery(exist, User.class).setParameter("username", username)
				.setParameter("password", password).getResultList();
		if (users.size() == 0) {
			return null;
		}
		return users.get(0);
	}

	@Override
	public User createUser(User user, int empId) {
		User newUser = user;
		Employee employee = em.find(Employee.class, empId);
		employee.getPrizes().size();
		employee.getPointsAwarded().size();
		newUser.setEmployee(employee);
		em.persist(newUser);

		return newUser;
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
	public Employee createEmployee(Employee employee, int addId) {
		Employee emp = employee;
		Address add = em.find(Address.class, addId);
		emp.setAddress(add);
		em.persist(emp);
		return emp;
	}

	@Override
	public Address createAddress(Address address) {
		em.persist(address);
		return address;
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
		String redeemedquery = "SELECT pr FROM PointRedemption pr WHERE employee_id = :employeeId";
		List<PointRedemption> redeemed = em.createQuery(redeemedquery, PointRedemption.class)
				.setParameter("employeeId", employeeId).getResultList();
		String awaredquery = "SELECT pa FROM PointAwarded pa WHERE employee_id = :employeeId";
		List<PointAwarded> awarded = em.createQuery(awaredquery, PointAwarded.class)
				.setParameter("employeeId", employeeId).getResultList();

		for (PointAwarded each : awarded) {
			sum += each.getAmount();
		}
		if (redeemed.size() != 0) {
			for (PointRedemption each : redeemed) {
				sum -= each.getPrize().getPoints();
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
	public User findById(int userId) {
		return em.find(User.class, userId);
	}
	
/////Reward/Award actions
	@Override
	public Prize findPrizeById(int prizeId) {
		return em.find(Prize.class, prizeId);
	}

	@Override
	public List<Prize> findAllPrizes() {
		String query = "SELECT p FROM Prize p ORDER BY p.name";
		List<Prize> prizes = em.createQuery(query, Prize.class).getResultList();
		return prizes;
	}

	@Override
	public List<Prize> findPrizesByTier(int tierId) {
		//select * from prize p join tier t on p.tier_id=t.id where t.id = 3 order by p.tier_id, p.name; //make this into JPQL
		String query2 = "SELECT p FROM Prize p JOIN Tier t on p.tier_id = t.id WHERE t.id = :tier ORDER BY p.tier, p.name";
		List<Prize> prizeTier = em.createQuery(query2, Prize.class).setParameter("tier", tierId).getResultList();

		
//		String query = "SELECT p FROM Prize p ORDER BY p.tier, p.name";
//		List<Prize> prizes = em.createQuery(query, Prize.class).getResultList();
//		List<Prize> prizeTier = new ArrayList<Prize>();
//		for (Prize p : prizes) {
//			if (p.getTier().getId() == tierId) {
//				prizeTier.add(p);
//			}
//		}
		return prizeTier;

	}

	@Override
	public Prize createPrize(Prize prize) {
		em.persist(prize);
		return prize;
	}

	@Override
	public Prize updatePrize(int id, Prize prize) {
		Prize updated = em.find(Prize.class, id);
		
		updated.setName(prize.getName());
		updated.setPoints(prize.getPoints());
		updated.setDescription(prize.getDescription());
		updated.setDescription(prize.getDescription());
		updated.setImage(prize.getImage());
		updated.setImage(prize.getImage());
		updated.setTier(prize.getTier());
		updated.setTier(prize.getTier());
		updated.setStatus(prize.getStatus());
		updated.setEmployees(prize.getEmployees());
		
		return prize;
	}

	@Override
	public PointAwarded findAwardByID(int awardId) {
		return em.find(PointAwarded.class, awardId);
	}

	@Override
	public List<PointAwarded> findAllAwards() {
		String query = "SELECT pa FROM PointAwarded pa ORDER BY pa.id";
		List<PointAwarded> pointsAwarded = em.createQuery(query, PointAwarded.class).getResultList();
		return pointsAwarded;		
	}

	@Override
	public PointAwarded createAward(PointAwarded pointAward) {
		em.persist(pointAward);
		return pointAward;
	}

	@Override
	public PointAwarded withdrawAward(int awardId) {
		String query = "SELECT pa FROM PointAwarded pa WHERE pa.award_status_id = 2 ORDER BY pa.id";
		PointAwarded toDelete = em.find(PointAwarded.class, awardId);
		List<PointAwarded> withdrawAllowed = em.createQuery(query, PointAwarded.class).getResultList();
		if (withdrawAllowed.contains(toDelete)) {
			toDelete.setStatus(em.find(Status.class, 4));
			em.persist(toDelete);
		}
		
		return toDelete;
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
	public boolean disableUser(int id) {
		User inactiveUser = em.find(User.class, id);
		inactiveUser.setEnabled(false);
		boolean userDeactivated = inactiveUser.getEnabled();
		return userDeactivated;
	}
	
	@Override
	public boolean enableUser(int id) {
		User activeUser = em.find(User.class, id);
		activeUser.setEnabled(true);
		boolean userActivated = activeUser.getEnabled();
		return userActivated;
	}

	@Override
	public PointRedemption withdrawRedemption(int employeeId, int rewardId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Status> pendingRequests() {
		String query = "SELECT e, p FROM Employee e, Prize p WHERE e.request_status_id = 2";
		return em.createQuery(query, Status.class).getResultList();
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
}
