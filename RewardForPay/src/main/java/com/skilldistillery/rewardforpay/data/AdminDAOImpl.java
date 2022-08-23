package com.skilldistillery.rewardforpay.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.rewardforpay.entities.Employee;
import com.skilldistillery.rewardforpay.entities.PointAwarded;
import com.skilldistillery.rewardforpay.entities.Prize;
import com.skilldistillery.rewardforpay.entities.Status;
@Service
@Transactional
public class AdminDAOImpl implements AdminDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public boolean updateStatus(Object obj,int statusId) {
		boolean changed = false;
		if(obj instanceof Prize) {
			((Prize) obj).setStatus(em.find(Status.class, statusId));
			changed =true;
		}
		if(obj instanceof Employee) {
			((Employee) obj).setRequestStatus(em.find(Status.class, statusId));
			changed =true;
		}
		if(obj instanceof PointAwarded) {
			((PointAwarded) obj).setStatus(em.find(Status.class, statusId));
			changed =true;
		}
		return changed;
	}

}
