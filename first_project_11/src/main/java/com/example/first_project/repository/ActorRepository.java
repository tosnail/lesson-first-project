package com.example.first_project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.first_project.model.Actor;



public interface ActorRepository extends JpaRepository<Actor,String>{

}
