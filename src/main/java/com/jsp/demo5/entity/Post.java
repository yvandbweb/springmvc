package com.jsp.demo5.entity;

import java.math.BigInteger;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.ColumnResult;
import javax.persistence.Entity;
import javax.persistence.EntityResult;
import javax.persistence.FieldResult;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SqlResultSetMapping;
import javax.persistence.ConstructorResult;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Entity
@Table(name = "post")
@SqlResultSetMapping(
        name = "OrderResults",
        entities = @EntityResult(
                entityClass = Post.class,
                fields = {
                    @FieldResult(name = "id", column = "id"),
                    @FieldResult(name = "txt", column = "txt"),
                    @FieldResult(name = "user", column = "user_id"),
                    @FieldResult(name = "dateCreated", column = "datetime")}),
        		columns = @ColumnResult(name = "cnt", type = BigInteger.class)            
                
        		)

@SqlResultSetMapping(
        name = "OrderResults2",
        entities = @EntityResult(
                entityClass = Post.class,
                fields = {
                    @FieldResult(name = "id", column = "id"),
                    @FieldResult(name = "txt", column = "txt"),
                    @FieldResult(name = "user", column = "user_id"),
                    @FieldResult(name = "dateCreated", column = "datetime")})      
                
        		)

@SqlResultSetMapping(
name = "OrderResultsmonths",  // same as resultSetMapping above in NativeQuery
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

public class Post
{
    @Id 
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Integer id;
    
    private String txt;
    
    @ManyToOne
    @JoinColumn(name="user_id")
    private User user;
    
    @Column(name="datetime")
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date dateCreated;
    

    
	public Integer getId() {
		return id;
	}    

	public String getTxt() {
		return txt;
	}

	public void setTxt(String txt) {
		this.txt = txt;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public java.util.Date getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(java.util.Date dateCreated) {
		this.dateCreated = dateCreated;
	}

    
    
}