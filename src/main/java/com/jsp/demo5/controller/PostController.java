package com.jsp.demo5.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.demo5.entity.Comment;
import com.jsp.demo5.entity.Post;
import com.jsp.demo5.service.CommentService;
import com.jsp.demo5.service.PostService;


@Controller
public class PostController {
	@Autowired
	PostService postservice;
	
	@Autowired
	CommentService commentservice;	

    @RequestMapping(value={"/posts"})
    ModelAndView postlist(@RequestParam(value="i2", required=false, defaultValue = "1") Integer i1,
    		           @RequestParam(value="idpost", required=false, defaultValue = "-1")Integer idpost1,
    		           @RequestParam(value="search", required=false, defaultValue = "")String search)  {
        
        ModelAndView model = new ModelAndView("posts");    
    	model.addObject("getfirstpost" , postservice.getfirstpost(idpost1));        
    	Map<String, Integer> vararr = postservice.getpagination(i1,search);
    	
    	model.addObject("offset" , vararr.get("offset"));
    	model.addObject("steps" , vararr.get("steps"));
    	model.addObject("totalrest" , vararr.get("totalrest"));
    	model.addObject("i1" , vararr.get("i1"));
    	model.addObject("total" , vararr.get("total"));
    	model.addObject("search" , search);
    	model.addObject("pageurl" , "posts");
    	model.addObject("postid" , idpost1);
  
        List<Comment> listcom = commentservice.getAllCommments(idpost1);     
        model.addObject("listcom" , listcom);    	
        ArrayList  list = postservice.getAllPost(vararr.get("offset"),vararr.get("steps"),search);        
    	
    	model.addObject("postlist",list);
    	
    	
        return model;
    }

}
