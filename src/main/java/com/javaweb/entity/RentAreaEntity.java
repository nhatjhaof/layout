package com.javaweb.entity;

import javax.persistence.*;


import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="rentarea")
@Getter
@Setter
public class RentAreaEntity 
{
	@Id           // Indicates the primary key field of the entity.
	@GeneratedValue(strategy = GenerationType.IDENTITY) // auto increment
	private Long id;
	

	@Column(name="value")
	private Long value;
	
	
	
	@ManyToOne
    @JoinColumn(name = "buildingid") // Assuming "buildingId" is the foreign key column
    private BuildingEntity building;


	
}