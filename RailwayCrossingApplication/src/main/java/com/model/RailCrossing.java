package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class RailCrossing {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int crossingId;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "address")
	private String address;
	
	@Column(name = "landmark")
	private String landmark;
	
	@Column(name = "trainSchedules")
	private String trainSchedules;
	
	@Column(name = "personInCharge")
	private String personInCharge;
	
	@Column(name = "status")
	private String status;
	

	public RailCrossing() {
		
	}

	public RailCrossing(String name, String address, String landmark, String trainSchedules, String personInCharge,
			String status) {
		
		this.name = name;
		this.address = address;
		this.landmark = landmark;
		this.trainSchedules = trainSchedules;
		this.personInCharge = personInCharge;
		this.status = status;
	}
	

	public int getCrossingId() {
		return crossingId;
	}

	public void setCrossingId(int crossingId) {
		this.crossingId = crossingId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLandmark() {
		return landmark;
	}

	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}

	public String getTrainSchedules() {
		return trainSchedules;
	}

	public void setTrainSchedules(String trainSchedules) {
		this.trainSchedules = trainSchedules;
	}

	public String getPersonInCharge() {
		return personInCharge;
	}

	public void setPersonInCharge(String personInCharge) {
		this.personInCharge = personInCharge;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	
}
