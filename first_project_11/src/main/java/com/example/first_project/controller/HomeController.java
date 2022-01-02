package com.example.first_project.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import com.example.first_project.model.Actor;
import com.example.first_project.model.Castmates;
import com.example.first_project.model.Director;
import com.example.first_project.model.Files;
import com.example.first_project.model.Studio;
import com.example.first_project.model.User;
import com.example.first_project.repository.UserRepository;
import com.example.first_project.service.ActorService;
import com.example.first_project.service.CastmatesService;
import com.example.first_project.service.DirectorService;
import com.example.first_project.service.FilesService;
import com.example.first_project.service.StudioService;
import com.example.first_project.service.UserService;



@Controller
public class HomeController {
	
	@Autowired
	private UserService uservice;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private FilesService fService;
	
	@Autowired
	private DirectorService directorService;
	
	@Autowired
	private ActorService actorService;
	
	@Autowired
	private StudioService studioService;
	
	@Autowired
	private CastmatesService castmatesService;
	
	
	@GetMapping("/")
	public String home() {
		return "home";
	}
	

	// 회원가입폼
	@GetMapping("register")
	public String register() {
		return "/user/join";
	}

	// 회원가입
	@PostMapping("register")
	@ResponseBody
	public String register(@RequestBody User user) {
		  if(userRepository.findByUsername(user.getUsername())!=null) { 
			  return "fail";
		  }
		uservice.register(user);
		return "success";
	}
	
	// 로그인폼
	@GetMapping("login")
	public String login() {
		return "/user/login";
	}
	
	//유저리스트
		@GetMapping("userlist")
		public String userlist(Model model,
				@PageableDefault(size=5, sort = "userid", direction = Sort.Direction.DESC) Pageable pageable) {
			Page<User> lists=uservice.findAll(pageable);
			model.addAttribute("lists",lists);
			model.addAttribute("count",uservice.count());
			return "/user/userlist";		
		}
		
		//user삭제
		@DeleteMapping("delete/{userid}")
		@ResponseBody
		public Long delete(@PathVariable long userid) {
			uservice.delete(userid);
			return userid;
		}
	
	
	
	//이미지 업로드폼
	@GetMapping("fileinsert")
	public String fileinsert() {
		return "fileinsert";
	}
	
	//이미지 업로드
	@PostMapping("fileinsert")
	public String fileinsert(HttpServletRequest request,@RequestPart MultipartFile files)throws Exception{
		Files file=new Files();
		String sourceFileName=files.getOriginalFilename();
		String sourceFileNameExtension=FilenameUtils.getExtension(sourceFileName).toLowerCase();
		File destinationFile;
		String destinationFileName;
		String fileUrl="C:/Users/Administrator/Documents/workspace-spring-tool-suite-4-4.11.1.RELEASE/first_project_11/src/main/resources/static/images/";
		
		do {
			destinationFileName=RandomStringUtils.randomAlphanumeric(32) + "." + sourceFileNameExtension;
			destinationFile = new File(fileUrl + destinationFileName);
		}while(destinationFile.exists());
		destinationFile.getParentFile().mkdirs(); 
		files.transferTo(destinationFile);
	
		file.setFilename(destinationFileName);
		file.setFileOriName(sourceFileName);
		file.setFileurl(fileUrl);
		fService.save(file);
		return "redirect:/studioinsert";
		
	}
	
	//감독 추가폼
	@GetMapping("directorinsert")
	public String insert() {
		return "directorinsert";
	}
	
	//감독 추가
	@PostMapping("directorinsert")
	public String insert(Director director) {
		directorService.insert(director);
		return "redirect:/program/insert";
	}
	
	//출연진 추가폼
	@GetMapping("castmatesinsert")
	public String castinsert() {
		return "castmatesinsert";
	}
	
	//출연진 추가
	@PostMapping("castmatesinsert")
	public String castinsert(Castmates castmates) {
		castmatesService.insert(castmates);
		return "redirect:/program/list";
	}
	
	//배우 추가폼
	@GetMapping("actorinsert")
	public String actorinsert() {
		return "actorinsert";
	}
	
	//배우 추가
	@PostMapping("actorinsert")
	public String actorinsert(Actor actor) {
		actorService.insert(actor);
		return "redirect:/directorinsert";
	}
	
	//제작사 추가폼
	@GetMapping("studioinsert")
	public String studioinsert() {
		return "studioinsert";
	}
	
	//제작사 추가
	@PostMapping("studioinsert")
	public String studioinsert(Studio studio) {
		studioService.insert(studio);
		return "redirect:/actorinsert";
	}
	
	//종합 리스트
	@GetMapping("alist")
	public String alist(Model model) {
		List<Files> files=fService.findAll();
		List<Studio> studio=studioService.findAll();
		List<Actor> actor=actorService.findAll();
		List<Director> director=directorService.findAll();
		List<Castmates> castmates=castmatesService.findAll();
		model.addAttribute("files",files);
		model.addAttribute("studio",studio);
		model.addAttribute("actor",actor);
		model.addAttribute("director",director);
		model.addAttribute("castmates",castmates);
		return "alist";
	}
	
}


