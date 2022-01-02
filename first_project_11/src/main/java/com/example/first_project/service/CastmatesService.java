package com.example.first_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.first_project.model.Castmates;
import com.example.first_project.repository.CastmatesRepository;

@Service
public class CastmatesService {

	@Autowired
	private CastmatesRepository cRepository;
	
	//출연진 추가
	public void insert(Castmates cast) {
		cRepository.save(cast);
	}
	
	//출연진 리스트
	public List<Castmates> findAll(){
		return cRepository.findAll();
	}
	
	//출연진 리스트(프로그램 번호)
	public List<Castmates> list(Long num){
		return cRepository.findByprogramnum(num);
	}
	

}

