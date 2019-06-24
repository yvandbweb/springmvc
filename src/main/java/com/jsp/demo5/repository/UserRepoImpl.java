package com.jsp.demo5.repository;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.jsp.demo5.entity.Post;
import com.jsp.demo5.entity.User;

@Component
public class UserRepoImpl {
	
	  @Autowired
	  private UserRepository repository;
	  
		
		@PersistenceContext
		private EntityManager entityManager;		

		public ArrayList  getAllUsers(Integer y, Integer z,String search){
			List<Object[]> results = entityManager
					.createNativeQuery("SELECT u.id as id,u.nameuser as nameuser,u.datetime as datetime, "
							+ "(select count(c.id) from comment c where u.id=c.user_id) as cntcomments,"
							+ "(select count(p.id) from post p where u.id=p.user_id) as cntposts "
							+ "FROM user u WHERE u.nameuser LIKE :search ORDER BY u.nameuser ASC LIMIT :y,:z", "userResult" )
					.setParameter("search", "%"+search+"%")
					.setParameter("y", y)
					.setParameter("z", z)
					.getResultList();
			
			return (ArrayList) results;
		}

		public List<User> getcountnumberofusers(String search) {			
			List<User> results = entityManager
					.createNativeQuery("SELECT  * FROM user u WHERE u.nameuser LIKE :search ORDER BY u.nameuser DESC", User.class  )
					.setParameter("search", "%"+search+"%")
					.getResultList();
		    
		    return results;
	    
		}	
}
