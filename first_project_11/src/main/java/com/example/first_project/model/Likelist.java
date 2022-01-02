package com.example.first_project.model;

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
public class Likelist {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long likenum;

	@ManyToOne
	@JoinColumn(name = "userid")
	private User user;
	

	@ManyToOne
	@JoinColumn(name = "programnum")
	private Program program;
	
	
}
