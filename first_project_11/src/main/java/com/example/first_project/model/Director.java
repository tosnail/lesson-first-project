package com.example.first_project.model;

import javax.persistence.Entity;

import javax.persistence.Id;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Director {
	@Id 
	private String directorname;
	private String gender;
}
