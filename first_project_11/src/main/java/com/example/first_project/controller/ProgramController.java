package com.example.first_project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.first_project.model.Castmates;
import com.example.first_project.model.Program;
import com.example.first_project.model.Reply;
import com.example.first_project.model.User;
import com.example.first_project.service.CastmatesService;

import com.example.first_project.service.LikelistService;
import com.example.first_project.service.ProgramService;
import com.example.first_project.service.ReplyService;
import com.example.first_project.service.UserService;

@Controller
@RequestMapping("/program/*")
public class ProgramController {

	@Autowired
	private ProgramService programService;
	
	@Autowired
	private CastmatesService cService;

	
	@Autowired
	private LikelistService likeService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ReplyService replyService;
	
	//프로그램 추가폼
	@GetMapping("insert")
	public String insert() {
		return "/program/insert";
	}
	
	//프로그램 추가
	@PostMapping("insert")
	public String insert(Program program) {
		programService.save(program);
		return "home";
	}
	
	//전체보기
	@GetMapping("list")
	public String list(Model model) {
		List<Program> lists=programService.findAll();
		model.addAttribute("lists",lists);
		return "/program/list";
	}

	//영화전체보기
	@GetMapping("movielist")
	public String Movielist(Model model) {
		String category="movie";
		List<Program> lists=programService.findByCategory(category);
		model.addAttribute("lists",lists);
		return "/program/list";
	}
	
	//프로그램전체보기
	@GetMapping("programlist")
	public String Programlist(Model model) {
		String category="programs";
		List<Program> lists=programService.findByCategory(category);
		model.addAttribute("lists",lists);
		return "/program/list";
	}
	
	
	//상세보기
	@GetMapping("view/{num}")
	public String view(@PathVariable Long num, Model model) {
		List<Castmates> castlist = cService.list(num);
		Program program=programService.hitcount(num);
		
		model.addAttribute("castlist",castlist);
		model.addAttribute("program",program);
		model.addAttribute("replys",replyService.findAVG(num));
		return "/program/view";
	}
	

	    //프로그램 수정폼
		@GetMapping("update/{num}")
		public String update(@PathVariable Long num, Model model) {
			model.addAttribute("program", programService.findById(num));
			return "/program/update";
		}
		
		//프로그램 수정
		@PutMapping("update")
		@ResponseBody
		public String update(@RequestBody Program program) {
			programService.update(program);
			return "success";
		}
		
		//프로그램 삭제 
		@DeleteMapping("delete/{num}")
		@ResponseBody
		public String delete(@PathVariable Long num) {
			programService.delete(num);
			return "success";
		}
	
		//댓글 수정폼
		@GetMapping("commentUpdate/{cnum}")
		public String commentUpdate(@PathVariable Long cnum,Model model) {
			model.addAttribute("reply", replyService.findByCNum(cnum));
			return "/program/commentUpdate";
		}
		
		//댓글 수정
		@PutMapping("commentUpdate")
		@ResponseBody
		public String commentUpdate(@RequestBody Reply reply) {
			replyService.commentUpdate(reply);
			return "success";
		}	
		
		
	//출연진
	@ResponseBody
	@GetMapping("castmates/{num}")
	public List<Castmates> castmates(@PathVariable Long num) {
		List<Castmates> castlist = cService.list(num);
		return castlist;
	}
	
	
	//like라이크기능
	@ResponseBody
	@PostMapping("likes/{num}")
	public String likes(@PathVariable Long num, Authentication authentication) {
		likeService.likes(num, authentication.getName());
		return "success";
	}

	//unlike기능
	@ResponseBody
	@PostMapping("unlikes/{num}")
	public String unLikes(@PathVariable Long num, Authentication authentication) {
		likeService.unLikes(num, authentication.getName());
		return "success";
	}

	//라이크 보기
	@PostMapping("like/view/{num}")
	@ResponseBody
	private int like_view(Model model, @PathVariable Long num, Authentication authentication) throws Exception {
		
		User user = userService.findByUsername(authentication.getName());
		Program program=programService.findById(num);
		
 		// 현재 로그인 유저가 좋아요를 눌렀는지 1 = 누름, 0 = 안누름
		if( likeService.findLikelistByProgramAndUser(program, user)==null) {
			return 0;
		}else {
			return 1;
		}
		
	}
	
}


