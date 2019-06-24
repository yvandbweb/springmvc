package com.jsp.demo5.entity;


import java.math.BigInteger;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import com.jsp.demo5.entity.User;

public class Postresult{
    private Integer id;
    
    private String txt;
    
    private String nameuser;
    
    

    private BigInteger user;
    
    private java.util.Date datetime;    
    
    
    public Postresult(Integer id,String txt, BigInteger user_id,java.util.Date  datetime, String nameuser){
    	this.id=id;
    	this.txt=txt;
    	this.user=user_id;
    	this.datetime=datetime;
    	this.nameuser=nameuser;
    }
    


}
