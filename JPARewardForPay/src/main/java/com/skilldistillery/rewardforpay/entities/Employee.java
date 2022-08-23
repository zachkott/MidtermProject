package com.skilldistillery.rewardforpay.entities;

import java.time.LocalDate;
import java.util.ArrayList;
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
	private Integer id;

	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;

	private Double salary;

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

	
	private LocalDate birthday;

	private String description;

	@ManyToOne
	@JoinColumn(name ="request_status_id")
	private Status requestStatus;
	
	@ManyToMany(mappedBy="employees")
	private List<Prize> prizes;
	
	@OneToMany(mappedBy="employee")
	private List<PointAwarded> pointsAwarded;
	
	@OneToOne(mappedBy="employee")
	private User user;
	
	@ManyToMany(mappedBy="staff")
	private List<Prize> favorites;
	
	
	public Employee() {}

	public int getId() {
		return id;
	}

	public void setId(Integer id) {
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

	public Double getSalary() {
		return salary;
	}

	public void setSalary(Double salary) {
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

	public Integer getSupervisorId() {
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

	public LocalDate getBirthday() {
		return birthday;
	}

	public void setBirthday(LocalDate birthday) {
//		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//		Date parsed = format.parse(birthday);
	
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

	public List<Prize> getPrizes() {
		return prizes;
	}

	public void setPrizes(List<Prize> prizes) {
		this.prizes = prizes;
	}

	public List<PointAwarded> getPointsAwarded() {
		return pointsAwarded;
	}

	public void setPointsAwarded(List<PointAwarded> pointsAwarded) {
		this.pointsAwarded = pointsAwarded;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public void addPrizeToWishlist(Prize prize) {
		if (favorites == null) {
			favorites = new ArrayList<>();
		}
		if (! favorites.contains(prize)) {
			favorites.add(prize);
			prize.addEmployee(this);
		}
	}
	public void removePrizeFromWishlist(Prize prize) {
		if (favorites != null && favorites.contains(prize)) {
			favorites.remove(prize);
			prize.removeEmployee(this);
		}
	}
	


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Employee [id=");
		builder.append(id);
		builder.append(", firstName=");
		builder.append(firstName);
		builder.append(", lastName=");
		builder.append(lastName);
		builder.append(", salary=");
		builder.append(salary);
		builder.append(", address=");
		builder.append(address);
		builder.append(", department=");
		builder.append(department);
		builder.append(", supervisorId=");
		builder.append(supervisorId);
		builder.append(", employeePhoto=");
		builder.append(employeePhoto);
		builder.append(", birthday=");
		builder.append(birthday);
		builder.append(", description=");
		builder.append(description);
		builder.append(", requestStatus=");
		builder.append(requestStatus);
		builder.append(", prizes=");
		builder.append(prizes);
		builder.append(", pointsAwarded=");
		builder.append(pointsAwarded);
		builder.append(", user=");
		builder.append(user);
		builder.append(", favorites=");
		builder.append(favorites);
		builder.append("]");
		return builder.toString();
	}

	public List<Prize> getFavorites() {
		return favorites;
	}

	public void setFavorites(List<Prize> favorites) {
		this.favorites = favorites;
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
