package com.example.first_project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.first_project.model.User;



public interface UserRepository extends JpaRepository<User, Long>{
	User findByUsername(String username);
	User findByUserid(Long userid);
}
