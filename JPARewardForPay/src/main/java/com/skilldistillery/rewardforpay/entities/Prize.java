package com.skilldistillery.rewardforpay.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
public class Prize {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	private int points;
	private String description;
	
	@Column(name="prize_url")
	private String image;
	
	@ManyToOne
	@JoinColumn(name="tier_id")
	private Tier tier;

	@ManyToOne
	@JoinColumn(name="request_status_id")
	private Status status;
	
	@ManyToMany
	@JoinTable(name="point_redemption", 
	joinColumns=@JoinColumn(name="reward_id"), 
	inverseJoinColumns=@JoinColumn(name="employee_id"))
	private List<Employee> employees;
	//TODO add/remove methods
	
	
	
	
	
	public Prize() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPoints() {
		return points;
	}

	public void setPoints(int points) {
		this.points = points;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Tier getTier() {
		return tier;
	}

	public void setTier(Tier tier) {
		this.tier = tier;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public List<Employee> getEmployees() {
		return employees;
	}

	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
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
		Prize other = (Prize) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Prize [id=" + id + ", name=" + name + ", points=" + points + ", description=" + description + ", image="
				+ image + ", tier=" + tier + ", status=" + status + "]";
	}
	

}
