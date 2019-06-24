package com.jsp.demo5.entity;

import java.math.BigInteger;

import javax.persistence.Column;
import javax.persistence.ColumnResult;
import javax.persistence.ConstructorResult;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SqlResultSetMapping;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "comment")
@SqlResultSetMapping(
name = "commenttop",  // same as resultSetMapping above in NativeQuery
   classes = {
      @ConstructorResult( 
          targetClass = Postmonths.class,
          columns = {
               @ColumnResult( name = "cnt",type=BigInteger.class),  
               @ColumnResult( name = "mname",type=String.class), 
          }
      )
   } 
)
public class Comment {
	
    @Id 
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Integer id;
    
    private String text;	
    
    @ManyToOne
    @JoinColumn(name="user_id")
    private User user;
    
    @ManyToOne
    @JoinColumn(name="post_id")
    private Post post;    
    
    
    @Column(name="datetime")
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date dateCreated;


	public String getText() {
		return text;
	}


	public void setText(String text) {
		this.text = text;
	}


	public User getUser() {
		return user;
	}


	public void setUserId(User user) {
		this.user = user;
	}


	public Post getPost() {
		return post;
	}


	public void setPost(Post post) {
		this.post = post;
	}


	public java.util.Date getDateCreated() {
		return dateCreated;
	}


	public void setDateCreated(java.util.Date dateCreated) {
		this.dateCreated = dateCreated;
	}
    
    
    
    
    
    

}
