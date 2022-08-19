package com.skilldistillery.rewardforpay.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class PrizeTest {
	static EntityManagerFactory emf;
	EntityManager em;
	private Prize prize;
	
	@BeforeAll
	static void setUpTest() {
		emf = Persistence.createEntityManagerFactory("JPARewardForPay");
	}
	
	@AfterAll
	static void tearDownTest() {
		emf.close();
	}
	
	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		prize = em.find(Prize.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		prize = null;
		em.close();
	}

	@Test
	void test_Prize_creates_new_prize() {
		assertNotNull(prize);
		assertEquals("Mouse Pad", prize.getName());
	}
	
	@Test
	void test_Prize_to_Tier_mapping() {
		assertNotNull(prize);
		assertEquals("Copper", prize.getTier().getName());
	}

	@Test
	void test_Prize_to_Status_mapping() {
		assertNotNull(prize);
		assertNotNull("Approved", prize.getTier().getName());
	}

//	@Test
//	void test_Prize_to_Employee_mapping() {
//		assertNotNull(prize);
//		assertEquals("Smith", prize.getEmployees().get(0).getLastName());
//	}


}
