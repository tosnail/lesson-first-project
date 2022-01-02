package com.example.first_project.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Reply {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long cnum;
	
	@Column(columnDefinition = "bigint default 5")
	private Long starrating;
	private String comments;
	
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date regdate;
	
	@ManyToOne
	@JoinColumn(name="bnum")
	private Program program;

	@ManyToOne
	@JoinColumn(name="cuserid")
	private User user;
	
}
