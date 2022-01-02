package com.example.first_project.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@Entity
public class Program {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long programnum;
	
	private String title;
	private String year;
	private String synopsis;
	private Long hitcount;
	private Long replycnt;
	private String category;
	
	@ManyToOne
	@JoinColumn(name = "director")
	private Director Director;
	
	@ManyToOne
	@JoinColumn(name = "studio")
	private Studio Studio;
	
	@ManyToOne
	@JoinColumn(name="files")
	private Files files;
	
	@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "cnum")
	@OneToMany(mappedBy = "program", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<Reply> replys;
	
	@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "castmatesnum")
	@OneToMany(mappedBy = "program", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<Castmates> castmates; 

	@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "likenum")
	@OneToMany(mappedBy = "program", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<Likelist> likelists; 
	
	@PrePersist
	public void prePersist() {
		this.hitcount=this.hitcount==null?0:this.hitcount;
		this.replycnt=this.replycnt==null?0:this.replycnt;
	}
	
	
}



