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

public class Postmonths{
    private BigInteger cnt;
    
    private String mname;

    
    
    public Postmonths(BigInteger cnt,String mname){
    	this.cnt=cnt;
    	this.mname=mname;
    }



	public BigInteger getCnt() {
		return cnt;
	}



	public void setCnt(BigInteger cnt) {
		this.cnt = cnt;
	}



	public String getMname() {
		return mname;
	}



	public void setMname(String mname) {
		this.mname = mname;
	}
    


}
