package com.skilldistillery.rewardforpay.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.rewardforpay.entities.Address;
import com.skilldistillery.rewardforpay.entities.Department;
import com.skilldistillery.rewardforpay.entities.Employee;
import com.skilldistillery.rewardforpay.entities.PointAwarded;
import com.skilldistillery.rewardforpay.entities.PointRedemption;
import com.skilldistillery.rewardforpay.entities.Prize;
import com.skilldistillery.rewardforpay.entities.Status;
import com.skilldistillery.rewardforpay.entities.Tier;
import com.skilldistillery.rewardforpay.entities.User;
import com.skilldistillery.rewardforpay.entities.UserRole;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	
//LoggedIn User Actions
	@Override
	public User createUser(User user, int empId, int  departmentId) {
		User newUser = user;
		Employee employee = em.find(Employee.class, empId);
		UserRole newRole = em.find(UserRole.class, 2);
		Department department = em.find(Department.class, departmentId );
		List<UserRole> newRoles = new ArrayList<UserRole>();
		newRoles.add(newRole);
		newUser.setEnabled(true);
		newUser.setRoles(newRoles);
		employee.getPrizes().size();
		employee.getPointsAwarded().size();
		employee.setDepartment(department);
		newUser.setEmployee(employee);
		
		em.persist(newUser);
		
		return newUser;
	}
	
	@Override
	public User updateUser(int id, User user) {
		User updatedUser =em.find(User.class, id);
		
		updatedUser.setUsername(user.getUsername());
		updatedUser.setPassword(user.getPassword());
//		updatedUser.setEnabled(user.getEnabled());
//		updatedUser.setRoles(user.getRoles());
		return updatedUser;
	}

	@Override
	public User deleteUser(int id) {
		User userToBeDeleted =em.find(User.class, id);
		
		em.remove(userToBeDeleted);
		
		return userToBeDeleted;
	}
	
	@Override
	public User findUserById(int userId) {
		User user = em.find(User.class, userId);
		if (user.getEnabled()==true) {
			return user;
		}
		return null;
	}
	
	@Override
	public List<User> findUserByKeyword(String keyword) {
		keyword = "%" + keyword + "%";
		
		String jpql = "SELECT u FROM User u WHERE u.userName LIKE :keyword";
		
		
		return em.createQuery(jpql, User.class).setParameter("keyword", keyword).getResultList();
	}
	
	@Override
	public User findByUsername(String username, String password) {
		String exist = "SELECT u FROM User u WHERE u.username = :username AND u.password = :password";
		List<User> users = em.createQuery(exist, User.class).setParameter("username", username)
				.setParameter("password", password).getResultList();
		List<User> activeUsers = new ArrayList<User>();
		if (users.size() == 0) {
			return null;
		}
		for (User u : users) {
			if (u.getEnabled()==true) {
				activeUsers.add(u);
			}
		}
		return activeUsers.get(0);
	}
	
	@Override
	public List<User> findAllUsers() {
		String jpql =  "SELECT u FROM  User u";
		return em.createQuery(jpql, User.class).getResultList();
	}
	
	@Override
	public List<User> findAllActiveUsers() {
		String jpql =  "SELECT u FROM  User u WHERE u.enabled=0";
		return em.createQuery(jpql, User.class).getResultList();
	}
	
	@Override
	public boolean enableUser(int id) {
		User activeUser = em.find(User.class, id);
		activeUser.setEnabled(true);
		boolean userActivated = activeUser.getEnabled();
		return userActivated;
	}
	
	@Override
	public boolean disableUser(int id) {
		User inactiveUser = em.find(User.class, id);
		inactiveUser.setEnabled(false);
		boolean userDeactivated = inactiveUser.getEnabled();
		return userDeactivated;
	}
	
	@Override
	public Address createAddress(Address address) {
		em.persist(address);
		return address;
	}
	
	@Override
	public Address updateAddress(Address address, int addressId) {
		Address newAddress = em.find(Address.class, addressId);
		
		newAddress.setStreet(address.getStreet());
	
		newAddress.setCity(address.getCity());
		newAddress.setState(address.getState());
		newAddress.setPostalCode(address.getPostalCode());
		newAddress.setPhone(address.getPhone());

		
		return newAddress;  
	}
	
//Employee profile/actions	
	@Override
	public Employee createEmployee(Employee employee, int addId, int depId) {
		Employee emp = employee;
		Department department = em.find(Department.class,depId);
		Address add = em.find(Address.class, addId);
		Status stat = em.find(Status.class, 2);
		List<Prize> prizes = findPrizesByTier(1);
		List<PointAwarded> points = new ArrayList<>() ;
		emp.setDepartment(department);
		emp.setPointsAwarded(points);
		emp.setPrizes(prizes);
		emp.setRequestStatus(stat);
		emp.setAddress(add);
		emp.setEmployeePhoto(employee.getEmployeePhoto());
		em.persist(emp);
		emp.setPointsAwarded(findAllAwards(emp.getId()));
		return emp;
	}

	@Override
	public Employee updateEmployee(int id, Employee employee, int depId) {
		Employee updated = em.find(Employee.class, id);
		Department dep= em.find(Department.class, depId);
		Status stat = em.find(Status.class, 2);
		updated.setRequestStatus(stat);
		updated.setFirstName(employee.getFirstName());
		updated.setLastName(employee.getLastName());
		updated.setSalary(employee.getSalary());
		updated.setEmployeePhoto(employee.getEmployeePhoto());
		updated.setDepartment(dep);
//		updated.setSupervisorId(employee.getSupervisorId());
//		updated.setEmployeePhoto(employee.getEmployeePhoto());
		updated.setBirthday(employee.getBirthday());
//		updated.setDescription(employee.getDescription());
		
		
		return updated;
	}

	@Override
	public Employee deleteEmployee(int id) {
		em.remove(em.find(Employee.class, id));
		return null;
	}
	
	@Override
	public Employee findEmployeeById(int employeeId) {
		Employee emp = em.find(Employee.class, employeeId);
		if (emp.getRequestStatus().getId() > 2) {
			return null;
		}
		return emp;
	}

	@Override
	public List<Employee> findAllEmployees() {
		String query = "SELECT e FROM Employee e";
		return em.createQuery(query, Employee.class).getResultList();
	}
	
	@Override
	public List<Employee> findAllActiveEmployees() {
		String query = "SELECT e FROM Employee e WHERE e.requestStatus.id=1";
		return em.createQuery(query, Employee.class).getResultList();
	}

	@Override
	public int findPointBalance(int employeeId) {
		int sum = 0;
		String redeemedquery = "SELECT pr FROM PointRedemption pr WHERE employee_id = :employeeId";
		List<PointRedemption> redeemed = em.createQuery(redeemedquery, PointRedemption.class)
				.setParameter("employeeId", employeeId).getResultList();
		String awaredquery = "SELECT pa FROM PointAwarded pa WHERE employee_id = :employeeId AND award_status_id=1";
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
	public PointRedemption withdrawRedemption(int employeeId, int rewardId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
//Admin actions
	@Override
	public List<PointAwarded> pendingPointAwarded() {
		Status status = em.find(Status.class, 2);
		return status.getPointsAwarded();
	}

	@Override
	public List<Employee> pendingEmployees() {
		Status status = em.find(Status.class, 2);
		return status.getEmployees();
	}

	@Override
	public List<Prize> pendingPrize() {
		Status status = em.find(Status.class, 2);
		return status.getPrizes();
	}
	
	@Override
	public boolean deletePrize(int id) {
		Status status = em.find(Status.class, 4);
		Prize deleted = em.find(Prize.class, id);
		deleted.setStatus(status);
		boolean success = em.contains(deleted);
		return success;
	}

	@Override
	public boolean updateStatus(int statusId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public PointAwarded updateAward(int awardId, PointAwarded pointAward) {
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
	
	
//Reward items
	@Override
	public Prize findPrizeById(int prizeId) {
		Prize prize = em.find(Prize.class, prizeId);
		if (prize.getStatus().getId()<3) {
			return prize;
		}
		return null;
	}

	@Override
	public List<Prize> findAllPrizes() {
		String query = "SELECT p FROM Prize p ORDER BY p.name";
		List<Prize> prizes = em.createQuery(query, Prize.class).getResultList();
		return prizes;
	}

	@Override
	public List<Prize> findAllActivePrizes() {
		String query = "SELECT p FROM Prize p WHERE p.status.id=1 ORDER BY p.name";
		List<Prize> prizes = em.createQuery(query, Prize.class).getResultList();
		return prizes;
	}

	@Override
	public List<Prize> findPrizesByTier(int tierId) {
		//select * from prize p join tier t on p.tier_id=t.id where t.id = 3 order by p.tier_id, p.name; //make this into JPQL
//		String query2 = "SELECT p FROM Prize p JOIN Tier t on p.tier_id = t.id WHERE t.id = :tier ORDER BY p.tier, p.name";
//		List<Prize> prizeTier = em.createQuery(query2, Prize.class).setParameter("tier", tierId).getResultList();
	
		String query = "SELECT p FROM Prize p WHERE p.status.id = 1 OR p.status.id=2 ORDER BY p.tier, p.name";
		List<Prize> prizes = em.createQuery(query, Prize.class).getResultList();
		List<Prize> prizeTier = new ArrayList<Prize>();
		for (Prize p : prizes) {
			if (p.getTier().getId() == tierId) {
				prizeTier.add(p);
			}
		}
		return prizeTier;

	}

	@Override
	public Prize createPrize(Prize prize) {
		Status status = em.find(Status.class, 2);
		prize.setStatus(status);
		if (prize.getPoints() < em.find(Tier.class, 1).getThreshold()) {
			prize.setTier(em.find(Tier.class, 1));
		}
		else if (prize.getPoints() < em.find(Tier.class, 2).getThreshold()) {
			prize.setTier(em.find(Tier.class, 2));
		}
		else { prize.setTier(em.find(Tier.class, 3));
		}
		em.persist(prize);
		return prize;
	}

	@Override
	public Prize updatePrize(int id, Prize prize) {
		Prize updated = em.find(Prize.class, id);
		
		updated.setName(prize.getName());
		updated.setPoints(prize.getPoints());
		updated.setDescription(prize.getDescription());
		updated.setImage(prize.getImage());
		if (prize.getPoints() < em.find(Tier.class, 1).getThreshold()) {
			updated.setTier(em.find(Tier.class, 1));
		}
		else if (prize.getPoints() < em.find(Tier.class, 2).getThreshold()) {
			updated.setTier(em.find(Tier.class, 2));
		}
		else { updated.setTier(em.find(Tier.class, 3));
		}
		Status status = em.find(Status.class, 2);
		updated.setStatus(status);
		updated.setEmployees(prize.getEmployees());
		
		return updated;
	}
	
	
//Award actions
	@Override
	public PointAwarded findAwardByID(int awardId) {
		return em.find(PointAwarded.class, awardId);
	}

	@Override
	public List<PointAwarded> findAllAwards(int employeeId) {
		String query = "SELECT pa FROM PointAwarded pa JOIN Employee e ON e.id = pa.employee.id WHERE e.id = :employeeId ORDER BY pa.id";
		
		List<PointAwarded> pointsAwarded = em.createQuery(query, PointAwarded.class).setParameter("employeeId", employeeId).getResultList();
		return pointsAwarded;		
	}

	@Override
	public List<PointAwarded> findAllWithdrawnAwards() {
		String query = "SELECT pa FROM PointAwarded pa JOIN Employee e ON e.id = pa.employee.id WHERE pa.employee.requestStatus.id=1 OR pa.employee.requestStatus.id=2 OR pa.employee.requestStatus.id=3 ORDER BY pa.id";
		
		List<PointAwarded> pointsAwarded = em.createQuery(query, PointAwarded.class).getResultList();
		return pointsAwarded;		
	}

	@Override
	public PointAwarded createAward(PointAwarded pointAward, int empId, int userId) {
		Employee emp = em.find(Employee.class, empId);
		pointAward.setEmployee(emp);
		Status status = em.find(Status.class, 2);
		pointAward.setStatus(status);
		User user = em.find(User.class, userId);
		pointAward.setUser(user);
		
		em.persist(pointAward);
		return pointAward;
	}

	@Override
	public PointAwarded withdrawAward(int awardId) {
		String query = "SELECT pa FROM PointAwarded pa WHERE pa.status = 2 ORDER BY pa.id";
		PointAwarded toDelete = em.find(PointAwarded.class, awardId);
		List<PointAwarded> withdrawAllowed = em.createQuery(query, PointAwarded.class).getResultList();
		if (withdrawAllowed.contains(toDelete)) {
			toDelete.setStatus(em.find(Status.class, 4));
			em.persist(toDelete);
		}
		
		return toDelete;
	}

	@Override
	public List<Prize> showWishList(int employeeId) {
		Employee emp  = em.find(Employee.class, employeeId);
		List<Prize> wishlist = emp.getFavorites();
		return wishlist;
	}

	@Override
	public List<Prize> addPrizeToWishlist(int employeeId, int prizeId) {
		Employee emp = em.find(Employee.class, employeeId);
		Prize prize = em.find(Prize.class, prizeId);
		emp.addPrizeToWishlist(prize);
		List<Prize> wishlist = emp.getFavorites();
		emp.setFavorites(wishlist);
		em.close();
		return wishlist;
	}

	@Override
	public boolean removePrizeFromWishlist(int employeeId, int prizeId) {
		
		Employee emp = em.find(Employee.class, employeeId);
		emp.removePrizeFromWishlist(em.find(Prize.class, prizeId));

		return emp.getFavorites().contains(em.find(Prize.class, prizeId));
	}
}