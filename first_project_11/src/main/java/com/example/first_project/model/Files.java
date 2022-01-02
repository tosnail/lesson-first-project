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
public class Files {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long fno;
	private String filename;
	private String fileOriName;
	private String fileurl;
	

	
//	@ManyToOne
//	@JoinColumn(name="programnum")
//	private Program program;
	
	
}
