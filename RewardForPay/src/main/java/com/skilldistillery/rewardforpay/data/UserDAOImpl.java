package com.skilldistillery.rewardforpay.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;


@Service
@Transactional
public class UserDAOImpl implements UserDAO {
	
	
	@PersistenceContext
	private EntityManager em;

}
