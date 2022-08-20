package com.skilldistillery.rewardforpay.entities;

import java.util.Date;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Employee {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;

	private double salary;

	@OneToOne
	@JoinColumn(name="address_id")
	private Address address;

	@ManyToOne
	@JoinColumn(name="department_id")
	private Department department;

	@Column(name="supervisor_id")
	private Integer supervisorId;

	@Column(name="employee_photo")
	private String employeePhoto;

	
	private Date birthday;

	private String description;

	@ManyToOne
	@JoinColumn(name ="request_status_id")
	private Status requestStatus;
	
	@ManyToMany(mappedBy="employees")
	private List<Prize> prizes;
	
	@OneToMany(mappedBy="employee")
	private List<PointAwarded> pointsAwarded;
	
	public Employee() {}

	
	
	public List<PointAwarded> getPointsAwarded() {
		return pointsAwarded;
	}



	public void setPointsAwarded(List<PointAwarded> pointsAwarded) {
		this.pointsAwarded = pointsAwarded;
	}



	public List<Prize> getPrizes() {
		return prizes;
	}



	public void setPrizes(List<Prize> prizes) {
		this.prizes = prizes;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public int getSupervisorId() {
		return supervisorId;
	}

	public void setSupervisorId(Integer supervisorId) {
		this.supervisorId = supervisorId;
	}

	public String getEmployeePhoto() {
		return employeePhoto;
	}

	public void setEmployeePhoto(String employeePhoto) {
		this.employeePhoto = employeePhoto;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Status getRequestStatus() {
		return requestStatus;
	}

	public void setRequestStatus(Status requestStatus) {
		this.requestStatus = requestStatus;
	}


	@Override
	public String toString() {
		return "Employee [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", salary=" + salary
				+ ", address=" + address + ", department=" + department + ", supervisorId=" + supervisorId
				+ ", employeePhoto=" + employeePhoto + ", birthday=" + birthday + ", description=" + description
				+ ", requestStatus=" + requestStatus + ", prizes=" + prizes + ", pointsAwarded=" + pointsAwarded + "]";
	}



	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Employee other = (Employee) obj;
		return id == other.id;
	}
	
	
	

}
