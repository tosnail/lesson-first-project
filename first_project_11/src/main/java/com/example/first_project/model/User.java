package com.example.first_project.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
public class User {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long userid;
	
	@Column(nullable = false)
	private String username;
	private String password;
	private String email;
	private String gender;
	private String role;
	
	
	//user list에서 user 삭제시 필요(JsonIdentityInfo랑 같이 사용해야함)
	@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "cnum")
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<Reply> replys;
	
	//user list에서 user 삭제시 필요(JsonIdentityInfo랑 같이 사용해야함)
	@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "likenum")
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<Likelist> likelist;
	
}
