package com.jsp.demo5.entity;

import java.math.BigInteger;

import javax.persistence.Column;
import javax.persistence.ColumnResult;
import javax.persistence.Entity;
import javax.persistence.EntityResult;
import javax.persistence.FieldResult;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SqlResultSetMapping;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "user")
@SqlResultSetMapping(
        name = "userResult",
        entities = @EntityResult(
                entityClass = User.class,
                fields = {
                    @FieldResult(name = "id", column = "id"),
                    @FieldResult(name = "nameuser", column = "nameuser"),
                    @FieldResult(name = "dateCreated", column = "datetime")}),
        		columns = {@ColumnResult(name = "cntcomments", type = BigInteger.class),
        				  @ColumnResult(name = "cntposts", type = BigInteger.class)}        
                
        		)
public class User
{
    @Id 
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Integer id;
    
    private String nameuser;
    
    @Column(name="datetime")
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date dateCreated;
    
    User(){
    	
    }
    
	public Integer getId() {
		return id;
	}       

	public String getNameuser() {
		return nameuser;
	}

	public void setNameuser(String nameuser) {
		this.nameuser = nameuser;
	}

	public java.util.Date getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(java.util.Date dateCreated) {
		this.dateCreated = dateCreated;
	}    
}