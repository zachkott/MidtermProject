package com.skilldistillery.rewardforpay.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.rewardforpay.entities.Employee;
import com.skilldistillery.rewardforpay.entities.PointAwarded;
import com.skilldistillery.rewardforpay.entities.PointRedemption;
import com.skilldistillery.rewardforpay.entities.Prize;
import com.skilldistillery.rewardforpay.entities.Status;
import com.skilldistillery.rewardforpay.entities.Tier;
import com.skilldistillery.rewardforpay.entities.User;


@Service
@Transactional
public class JamieDAOImpl implements UserDAO {
	
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public User findById(int userId) {
		return em.find(User.class, userId);
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
	public List<Employee> findAllEmployees(int employeeId) {
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
	public List<Status> findAllRequests(int employeeId) {
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
	
	
	
	
	
	
	
	
	
	
/////Reward/Award actions
	@Override
	public Prize findPrizeById(int prizeId) {
		return em.find(Prize.class, prizeId);
	}

	@Override
	public List<Prize> findAllPrizes(int prizeId) {
		String query = "SELECT p FROM Prize p ORDER BY p.name";
		List<Prize> prizes = em.createQuery(query, Prize.class).getResultList();
		return prizes;
	}

	@Override
	public List<Prize> findPrizesByTier(int tierId) {
		String query = "SELECT p FROM Prize p ORDER BY p.tier, p.name";
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
	public List<PointAwarded> findAllAwards(int awardId) {
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

}
