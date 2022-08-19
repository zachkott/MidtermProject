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

<<<<<<< HEAD:JPARewardForPay/src/test/java/com/skilldistillery/rewardforpay/entities/TierTest2.java
class TierTest2 {
	static EntityManagerFactory emf;
	EntityManager em;
	private Tier tier;
	
	@BeforeAll
	static void setUpTest() {
		emf = Persistence.createEntityManagerFactory("JPARewardForPay");
	}
=======
class TierTest {
>>>>>>> 0fdea220544da9b68cf237e5d3e766c487b1dc25:JPARewardForPay/src/test/java/com/skilldistillery/rewardforpay/entities/TierTest.java
	
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

<<<<<<< HEAD:JPARewardForPay/src/test/java/com/skilldistillery/rewardforpay/entities/TierTest2.java
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

=======
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
>>>>>>> 0fdea220544da9b68cf237e5d3e766c487b1dc25:JPARewardForPay/src/test/java/com/skilldistillery/rewardforpay/entities/TierTest.java
}
