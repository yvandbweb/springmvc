package com.jsp.demo5.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.jsp.demo5.entity.Post;

import  com.jsp.demo5.repository.PostRepository;

@Component
public class PostRepoImpl {
	  @Autowired
	  private PostRepository repository;
	  
		
		@PersistenceContext
		private EntityManager entityManager;	  
	  
		public ArrayList  getAllPost(Integer y, Integer z,String search){
			List<Object[]> results = entityManager
					.createNativeQuery("SELECT p.id as id,user_id as user_id,p.txt as txt,p.datetime as datetime,"
							+ "(select count(c.id) from comment c where p.id=c.post_id) as cnt "
							+ "FROM post p WHERE p.txt LIKE :search ORDER BY p.datetime DESC LIMIT :y,:z", "OrderResults" )
					.setParameter("search", "%"+search+"%")
					.setParameter("y", y)
					.setParameter("z", z)
					.getResultList();
			
			return (ArrayList) results;
		}
		
		public Post getfirstpost(Integer idpost){
			return repository.findById(idpost).orElse(null);
			
		}	
		
		public List<Post> getcountnumberofpostsquery(String search) {			
			List<Post> results = entityManager
					.createNativeQuery("SELECT  * FROM post p WHERE p.txt LIKE :search ORDER BY p.datetime DESC", Post.class  )
					.setParameter("search", "%"+search+"%")
					.getResultList();
		    
		    return results;
	    
		}			
		
		public List<Post> toposters(){			
			
			List<Post> results = entityManager
					.createNativeQuery("SELECT count(p.id) as cnt,u.nameuser as mname FROM post p LEFT JOIN user u ON (u.id=p.user_id) GROUP BY p.user_id ORDER BY cnt DESC LIMIT 3", "OrderResultsmonths" )
					.getResultList();
			
			return results;
		}	
		
		public List<Post> getmonths(){

			List<Post> results = entityManager
					.createNativeQuery("SELECT count(p.id) as cnt,MONTHNAME(ANY_VALUE(p.datetime)) as mname FROM post p GROUP BY  MONTH(p.datetime)", "OrderResultsmonths" )
					.getResultList();
			
			return results;
		}
		
		public List<Post> getpostsByUsers(Integer id){
			List<Post> results = entityManager
					.createQuery("SELECT p FROM Post p WHERE p.user.id=:id" )
					.setParameter("id", id)
					.getResultList();
			
			return results;
		}		
				
		


}
