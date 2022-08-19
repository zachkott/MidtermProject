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


class Test {
	static EntityManagerFactory emf;
	EntityManager em;
	private Tier tier;
	
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
		tier = em.find(Tier.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		tier = null;
		em.close();
	}

	@Test
	void test_Tier_creates_new_tier() {
		assertNotNull(tier);
		assertEquals("Copper", tier.getName());
	}
	
	@Test
	void test_Tier_to_Prize_mapping() {
		assertNotNull(tier);
		assertEquals("Mouse Pad", tier.getPrizes().get(0).getName());
	}
}
