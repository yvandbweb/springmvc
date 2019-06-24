package com.jsp.demo5.service;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsp.demo5.entity.Comment;
import com.jsp.demo5.repository.CommentRepoImpl;




	@Service
	public class CommentService {
		@Autowired
		CommentRepoImpl comment;	
		
		@PersistenceContext
		private EntityManager entityManager;		

		public List<Comment> getAllCommments(Integer id){
			return comment.findAllComments1(id);
		}
		
		
		public List<Comment> topcommenters(){							
				List<Comment> results= comment.topcommenters();			
				return results;
	    }
		
		
		

	}
	

