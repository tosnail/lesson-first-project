package com.example.first_project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.first_project.model.Files;

public interface FilesRepository extends JpaRepository<Files, Long>{
	Files findByFno(Long fno);
}

