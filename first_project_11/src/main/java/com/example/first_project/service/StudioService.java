package com.example.first_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.first_project.model.Studio;
import com.example.first_project.repository.StudioRepository;



@Service
public class StudioService {

	@Autowired
	private StudioRepository studioRep;
	
	//추가
	public void insert(Studio stu) {
		studioRep.save(stu);
	}
	
	//리스트
	public List<Studio> findAll(){
		return studioRep.findAll();
	}
}
