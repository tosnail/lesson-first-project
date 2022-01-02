package com.example.first_project.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Studio {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long studionum;
	private String studioname;
	private String contact;
}
