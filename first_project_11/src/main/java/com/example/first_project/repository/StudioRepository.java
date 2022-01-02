package com.example.first_project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.first_project.model.Studio;


public interface StudioRepository extends JpaRepository<Studio,Long>{

}
