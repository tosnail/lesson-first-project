package com.example.first_project.model;

import javax.persistence.Entity;

import javax.persistence.Id;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Actor {
	@Id 
	private String actorname;
	private String gender;
	
}
