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

import com.jsp.demo5.entity.Post;
import com.jsp.demo5.repository.PostRepoImpl;
import com.jsp.demo5.repository.UserRepository;





	@Service
	public class PostService {
		@Autowired
		PostRepoImpl post;
		
		@Autowired
		UserRepository user1;	
		
		@PersistenceContext
		private EntityManager entityManager;
		
		public Post getfirstpost(Integer idpost){
			return post.getfirstpost(idpost);
			
		}
		
		public Map<String, Integer> getpagination(Integer i1,String search) {
			Map<String, Integer> vararr = new HashMap<String, Integer>();

			
			List<Post> results = post.getcountnumberofpostsquery(search);
			
			
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
				

		
		
		public ArrayList  getAllPost(Integer y, Integer z,String search){
			List<Object[]> results = post.getAllPost(y,z,search);

				List a = new ArrayList();
	        	results.stream().forEach((record) -> {
	
			        
			        Map b =  new HashMap();
			        
			        b.put("p" , (Post)record[0]);
			        b.put("cnt" , (BigInteger)record[1]);
			        
			        a.add(b);  
			        
			});
			
			
			return (ArrayList) a;
		}		

		
		
		public List<Post> getmonths(){

			List<Post> results = post.getmonths();
			
			return results;
		}		
		
		public List<Post> toposters(){			
			
			List<Post> results = post.toposters();
			
			return results;
		}			

		

	}
	

