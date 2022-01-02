package com.example.first_project.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.first_project.model.Program;
import com.example.first_project.model.User;
import com.example.first_project.model.Likelist;
import com.example.first_project.repository.LikelistRepository;
import com.example.first_project.repository.UserRepository;

@Service
public class LikelistService {

	@Autowired
	private LikelistRepository likeRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	//like
	@Transactional
	public void likes(Long programnum, String username) {
		User user = userRepository.findByUsername(username);
		likeRepository.likelist(programnum, user.getUserid());
	}
	
	//unlike
	@Transactional
	public void unLikes(Long programnum, String username) {
		User user = userRepository.findByUsername(username);
		likeRepository.unLikelist(programnum, user.getUserid());
	}
	
	//program, user에 맞는 likelist출력
	@Transactional
	public Likelist findLikelistByProgramAndUser(Program program, User user) {
		return likeRepository.findLikelistByProgramAndUser(program, user);
		
	}
	
	//user에 맞는 likelist출력
		@Transactional
		public List<Likelist> findLikelistByUser(User user) {
			return likeRepository.findLikelistByUser(user);
		}
		
}
