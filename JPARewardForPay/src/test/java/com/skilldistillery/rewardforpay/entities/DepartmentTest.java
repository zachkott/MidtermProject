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

class DepartmentTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Department department;
	
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
		department = em.find(Department.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		department=null;
		
	}
	
	@Test
	void test_Department_Entity_mapping() {
		assertNotNull(department);
		assertEquals("Human Resources", department.getName());
		assertEquals(1, department.getManagerId());
		assertEquals("We serve the company,not people.", department.getDescription());


	}
}