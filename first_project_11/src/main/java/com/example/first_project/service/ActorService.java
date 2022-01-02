package com.example.first_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.first_project.model.Actor;
import com.example.first_project.repository.ActorRepository;


@Service
public class ActorService {

	@Autowired
	ActorRepository actRep;
	
	//추가
	public void insert(Actor act) {
		actRep.save(act);
	}
	
	//리스트
	public List<Actor> findAll(){
		return actRep.findAll();
	}
	
}
