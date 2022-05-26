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
import com.jsp.demo5.entity.User;
import com.jsp.demo5.service.UserService;


@Controller
public class UserController {
	@Autowired
	UserService userservice;
	


    @RequestMapping(value={"/users"})
    ModelAndView postlist(@RequestParam(value="i2", required=false, defaultValue = "1") Integer i1,
    		           @RequestParam(value="iduserposts", required=false, defaultValue = "0")Integer iduserposts,
    		           @RequestParam(value="idusercomments", required=false, defaultValue = "0")Integer idusercomments,
    		           @RequestParam(value="search", required=false, defaultValue = "")String search)  {
        
        ModelAndView model = new ModelAndView("users");       
    	Map<String, Integer> vararr = userservice.getpagination(i1,search);
    	
    	model.addObject("offset" , vararr.get("offset"));
    	model.addObject("steps" , vararr.get("steps"));
    	model.addObject("totalrest" , vararr.get("totalrest"));
    	model.addObject("i1" , vararr.get("i1"));
    	model.addObject("total" , vararr.get("total"));
    	model.addObject("search" , search);
    	model.addObject("pageurl" , "users");
    	
    	model.addObject("iduserposts" , iduserposts);
    	model.addObject("idusercomments" , idusercomments);
    	
    	if (iduserposts!=0) {
    		List<Post> listposts = userservice.getpostsByUsers(iduserposts); 
    		model.addObject("listposts" , listposts);
    	}else if (idusercomments!=0) {
            List<Comment> listcomments = userservice.getcommentsByUsers(idusercomments); 
            model.addObject("listcomments" , listcomments);
    	}else
    		model.addObject("listposts" , userservice.getpostsByUsers(-1));        
    	 
        
        ArrayList  list = userservice.getAllUsers(vararr.get("offset"),vararr.get("steps"),search); 
    	
    	model.addObject("userlist",list);
    	
    	
        return model;
    }

}
