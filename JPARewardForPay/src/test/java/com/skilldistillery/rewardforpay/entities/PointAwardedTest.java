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

class PointAwardedTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private PointAwarded PointAwarded;
	
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
		PointAwarded = em.find(PointAwarded.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		PointAwarded=null;
		
	}
	

	@Test
	void  pointawarded_entity_basic_mapping() {
		assertNotNull(PointAwarded);
		assertEquals(200,PointAwarded.getAmount());
	}
	
	@Test
	void  pointawarded_entity_status_mapping() {
		assertNotNull(PointAwarded);
		assertEquals(1,PointAwarded.getStatus().getId());
	}
//	@Test
//	void  pointawarded_entity_employee_mapping() {
//		assertNotNull(PointAwarded);
//		assertEquals(85000,PointAwarded.getEmployee().getSalary());
//	}
	
	@Test
	void  pointawarded_entity_user_mapping() {
		assertNotNull(PointAwarded);
		assertEquals("ksmith",PointAwarded.getUser().getUsername());
	}

}
