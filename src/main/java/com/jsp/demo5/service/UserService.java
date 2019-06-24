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
import com.jsp.demo5.entity.Post;
import com.jsp.demo5.entity.User;
import com.jsp.demo5.repository.CommentRepoImpl;
import com.jsp.demo5.repository.PostRepoImpl;
import com.jsp.demo5.repository.UserRepoImpl;




	@Service
	public class UserService {
		@Autowired
		UserRepoImpl user;	
		
		@Autowired
		CommentRepoImpl comment;	
		
		@Autowired
		PostRepoImpl post;					

		public List<Post> getpostsByUsers(Integer id){
			return post.getpostsByUsers(id);
		}
		
		
		public List<Comment> getcommentsByUsers(Integer id){							
				List<Comment> results= comment.getcommentsByUsers(id);			
				return results;
	    }	
		
		public Map<String, Integer> getpagination(Integer i1,String search) {
			Map<String, Integer> vararr = new HashMap<String, Integer>();

			
			List<User> results = user.getcountnumberofusers(search);
			
			
			vararr.put("offset" , 0);
			vararr.put("steps" , 6);
			vararr.put("totalrest" , (int) Math.ceil(results.size()/vararr.get("steps")));
			vararr.put("i1" , 1);

			vararr.put("total" , (int) results.size());
			
	          

		    if (i1!=null){        
		        vararr.put("i1" , i1);
		        vararr.put("offset" , (i1 - 1)*vararr.get("steps"));
		    }
		    
		    return vararr;
	    
		}			
				

		
		
		public ArrayList  getAllUsers(Integer y, Integer z,String search){
			List<Object[]> results = user.getAllUsers(y,z,search);

				List a = new ArrayList();
	        	results.stream().forEach((record) -> {
	
			        
			        Map b =  new HashMap();
			        
			        b.put("u" , (User)record[0]);
			        b.put("cntcomments" , (BigInteger)record[1]);
			        b.put("cntposts" , (BigInteger)record[2]);
			        
			        a.add(b);  
			        
			});
				return (ArrayList) a;		
		
		}
	}
	

