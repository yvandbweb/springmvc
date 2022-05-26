<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>A java jsp hibernate spring jpa bootstrap app</title>

  <!-- Custom fonts for this template-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

  <link href="<c:url value="/css/custom.css" />" rel="stylesheet">
  <mvc:resources mapping="/robots.txt" location="/WEB-INF/robots.txt" order="0"/>	

</head>

<body id="page-top">
    <div class="page-container ">
        <div class="content-wrap">         
        <div class="centered container">
        <div class="topul">
		    <ul>
		        <li><a href="<c:url value = "/"/>"><u>Stats</u></a></li>
		        <li><a href="<c:url value = "posts"/>"><u>Posts</u></a></li>
		        <li><a href="<c:url value = "users"/>"><u>Users</u></a></li>
		    </ul>        
        </div>
        <div class="clear"></div>
        <div class="topsrchcolor">
	        <form class="form-inline" method="get" action="<c:url value = "${pageurl}"/>">
	        <div class="form-group">
		         <input type="text" class="form-check-input" id="tta" name="search" placeholder="Search for ${pageurl}" >                    
		         <button type="submit" class="form-check-input btn btn-info">Submit</button> 
		         <button type="submit" onclick="document.getElementById('tta').value=''" class="form-check-input btn btn-danger">Reset</button>
		         </div>   
	        </form>  
        </div>   

 


         

