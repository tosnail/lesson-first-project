package com.example.first_project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.first_project.model.Director;



public interface DirectorRepository extends JpaRepository<Director,String>{

}
