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
		employee = em.find(Employee.class, 3);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		employee=null;
		
	}
	
//	@Test
//	void test_Employee_Entity_mapping() {
//		assertNotNull(employee);
//		assertEquals("Ryan",employee.getFirstName());
//		assertEquals("Cosby",employee.getLastName());
//		assertEquals(110000, employee.getSalary());
//		assertEquals("Do you have those TPS reports?", employee.getDescription());
//
//
//	}
	
	@Test
	public void test_employee_to_address_association() {
		Address address = employee.getAddress();
		assertNotNull(address);
		assertEquals("1441 North Marine Drive", address.getStreet());
		assertEquals("Portland", address.getCity());
		assertEquals("Oregon", address.getState());
		assertEquals("97217", address.getPostalCode());
	}
	
	@Test
	void test_Employee_status_ManyToOne_mapping() {
		assertNotNull(employee);
		Status status = employee.getRequestStatus();
		assertEquals(1, status.getId());

	}
	
	@Test
	void test_Employee_PointAward_OneToMany_mapping() {
		employee= em.find(Employee.class, 2);
		assertNotNull(employee);
		assertNotNull(employee.getPointsAwarded());
		assertTrue(employee.getPointsAwarded().size() > 0);
	}
	@Test
	void test_Employee_Prize_ManyToMany_mapping() {
		employee= em.find(Employee.class, 1);
		assertNotNull(employee);
		assertNotNull(employee.getPrizes());
		assertTrue(employee.getPrizes().size() > 0);
		assertEquals("Mouse Pad", employee.getPrizes().get(0).getName());
	}
}