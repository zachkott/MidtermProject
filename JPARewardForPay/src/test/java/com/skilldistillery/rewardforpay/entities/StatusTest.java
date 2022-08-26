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

class StatusTest {

		static EntityManagerFactory emf;
		EntityManager em;
		private Status status;
		
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
			status = em.find(Status.class, 1);
		}

		@AfterEach
		void tearDown() throws Exception {
			status = null;
			em.close();
		}

		@Test
		void test_Status_creates_new_actor() {
			assertNotNull(status);
			assertEquals("Approved", status.getName());
		}
		
//		@Test
//		void test_Status_to_Prize_mapping() {
//			assertNotNull(status);
//			assertEquals(4, status.getPrizes().size());
//		}
//
//		@Test
//		void test_Status_to_Employees_mapping() {
//			assertNotNull(status);
//			assertEquals(7, status.getEmployees().size());
//		}
//
//		@Test
//		void test_Status_to_PointsAwarded_mapping() {
//			assertNotNull(status);
//			assertEquals(1, status.getPointsAwarded().size());
//		}

}
