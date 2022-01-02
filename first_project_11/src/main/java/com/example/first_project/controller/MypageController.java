package com.example.first_project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.first_project.model.Program;
import com.example.first_project.model.User;
import com.example.first_project.model.Likelist;
import com.example.first_project.service.LikelistService;

import com.example.first_project.service.ProgramService;
import com.example.first_project.service.UserService;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private LikelistService likeService;
	
	@Autowired
	private ProgramService programService;
	
	
	//전체보기
	@GetMapping("list")
	public String list(Model model, Authentication authentication) {
		User user = userService.findByUsername(authentication.getName());
		String mcategory="movie";
		String pcategory="programs";
		
		List<Program> movielists=programService.findByCategory(mcategory);
		List<Program> programslists=programService.findByCategory(pcategory);
		List<Likelist> Likelists =  likeService.findLikelistByUser(user);
	
		model.addAttribute("movielists",movielists);
		model.addAttribute("programslists",programslists);
		model.addAttribute("likelists",Likelists);		
		return "/mypage/list";
	}


}


