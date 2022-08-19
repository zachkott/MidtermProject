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

class EmployeeTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Employee employee;
	
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
		employee = em.find(Employee.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		employee=null;
		
	}
	
	@Test
	void test_Employee_Entity_mapping() {
		assertNotNull(employee);
		assertEquals("Karen",employee.getFirstName());
		assertEquals("Smith",employee.getLastName());
		assertEquals(85000, employee.getSalary());
		assertEquals("I'd like to speak with your manager.", employee.getDescription());


	}
}