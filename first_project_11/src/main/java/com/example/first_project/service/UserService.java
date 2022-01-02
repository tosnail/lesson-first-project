package com.example.first_project.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.first_project.model.User;
import com.example.first_project.repository.UserRepository;



@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	//회원가입
	@Transactional
	public void register(User user) {
		//비번 암호화
		String rawPassword=user.getPassword();
		String encPassword=encoder.encode(rawPassword);
		
		user.setPassword(encPassword);
		user.setRole("ROLE_USER");
		userRepository.save(user);
		
	}
	
	//user 찾기
	public User findByUsername(String username) {
		return userRepository.findByUsername(username);
	}
	
	//user 리스트
	public Page<User> findAll(Pageable pageable){
		return userRepository.findAll(pageable);
	}
	
	//user 수
	public Long count() {
		return userRepository.count();
	}
	
	//user 삭제
	public void delete(Long userid) {
		 userRepository.deleteById(userid);;
	}
	
}
