package com.jsp.demo5.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.demo5.entity.Comment;
import com.jsp.demo5.entity.Post;
import com.jsp.demo5.entity.Postresult;
import com.jsp.demo5.service.CommentService;
import com.jsp.demo5.service.PostService;


@Controller
public class DashboardController {
	@Autowired
	PostService postservice;
	
	@Autowired
	CommentService commentservice;	

    @RequestMapping(value={"", "/", "/index"})    
    ModelAndView graph1() {
    	
        
       ModelAndView model = new ModelAndView("dashboard");     	
       List<Post>  listmonths = postservice.getmonths(); 
       model.addObject("monthlist",listmonths);
       List<Post>  listposters = postservice.toposters(); 
       model.addObject("listposters",listposters);
       List<Comment>  topcommenters = commentservice.topcommenters(); 
       model.addObject("topcommenters",topcommenters);
       model.addObject("pageurl" , "posts");
       
       
 /*      
        List<Post>  listposters = postservice.toposters(); 
    	
        List<Map<Object, Object>>  topcommenters = commentservice.topcommenters(); 
        
    	model.addObject("monthlist",listmonths);
    	
    	model.addObject("listposters",listposters);
    	
    	model.addObject("topcommenters",topcommenters);*/
    	
    	
        return model;
    }

}
