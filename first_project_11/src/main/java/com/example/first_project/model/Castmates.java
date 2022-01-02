package com.example.first_project.model;


import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Castmates implements Serializable{
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long castmatesnum;
	
	
	@ManyToOne
	@JoinColumn(name = "actor")
	private Actor actor;
	
	@ManyToOne
	@JoinColumn(name = "programnum")
	private Program program;
	
	
	
}






