package com.example.first_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.first_project.model.Director;
import com.example.first_project.repository.DirectorRepository;



@Service
public class DirectorService {

	@Autowired
	private DirectorRepository directorRep;
	
	//추가
	public void insert(Director director) {
		directorRep.save(director);
	}
	
	//리스트
	public List<Director> findAll(){
		return directorRep.findAll();
	}
}
