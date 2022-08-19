package com.skilldistillery.rewardforpay.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class PointRedemptionTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private PointRedemption PointRedemption;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPARewardForPay");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		PointRedemption = em.find(PointRedemption.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		PointRedemption=null;
		
	}
	

	@Test
	void  PointRedemption_entity_Employee_mapping() {
		assertNotNull(PointRedemption);
		assertEquals("Karen",PointRedemption.getEmployee().getFirstName());
	}
	
	@Test
	void  PointRedemption_entity_Reward_mapping() {
		assertNotNull(PointRedemption);
		assertEquals("Mouse Pad",PointRedemption.getPrize().getName());
	}
	

}
