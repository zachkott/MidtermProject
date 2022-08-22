package com.skilldistillery.rewardforpay.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	private String username;

	private String password;

	private Boolean enabled;

	@ManyToMany
	@JoinTable(name = "user_has_role", 
	joinColumns = @JoinColumn(name = "user_id"), 
	inverseJoinColumns = @JoinColumn(name = "user_role_id"))
	private List<UserRole> roles;

	@OneToOne
	@JoinColumn(name = "employee_id")
	private Employee employee;
	
	@OneToMany(mappedBy="user")
	private List<PointAwarded> pointsAwarded;
	

	public User() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	

	public List<PointAwarded> getPointsAwarded() {
		return pointsAwarded;
	}

	public void setPointsAwarded(List<PointAwarded> pointsAwarded) {
		this.pointsAwarded = pointsAwarded;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public List<UserRole> getRoles() {
		return roles;
	}


	public void setRoles(List<UserRole> roles) {
		this.roles = roles;
	}


	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
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
		User other = (User) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("User [id=");
		builder.append(id);
		builder.append(", username=");
		builder.append(username);
		builder.append(", password=");
		builder.append(password);
		builder.append(", enabled=");
		builder.append(enabled);
		builder.append(", employeeId=");
		builder.append(employee);
		builder.append("]");
		return builder.toString();
	}

	


}
