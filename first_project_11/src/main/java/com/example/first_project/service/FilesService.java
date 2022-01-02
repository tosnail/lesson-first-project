package com.example.first_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.first_project.model.Files;
import com.example.first_project.repository.FilesRepository;


@Service
public class FilesService {

	@Autowired
	FilesRepository filesRep;
	
	public void save(Files files) {
		Files f=new Files();
		f.setFilename(files.getFilename());
		f.setFileOriName(files.getFileOriName());
		f.setFileurl(files.getFileurl());
		filesRep.save(f);
	}

	public List<Files> findAll(){
		return filesRep.findAll();
	}
	
	
}
