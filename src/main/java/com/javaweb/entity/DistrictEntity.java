package com.javaweb.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="district")
@Getter
@Setter
public class DistrictEntity 
{
	@Id           // Indicates the primary key field of the entity.
	@GeneratedValue(strategy = GenerationType.IDENTITY) // auto increment
	private Long id;
	
	
	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getCode() {
		return code;
	}


	public void setCode(String code) {
		this.code = code;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public List<BuildingEntity> getBuildings() {
		return buildings;
	}


	public void setBuildings(List<BuildingEntity> buildings) {
		this.buildings = buildings;
	}


	@Column(name="code")
	private String code;
	
	
	
	@Column(name="name")
	private String name;
	
	
	@OneToMany(mappedBy = "district", fetch = FetchType.LAZY)//mappedBy value same variable table rentArea
	private List<BuildingEntity> buildings = new ArrayList<>();
}