<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>A java jsp hibernate spring jpa bootstrap app</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="<c:url value="/css/sb-admin-2.min.css" />" rel="stylesheet">
  <link href="<c:url value="/css/custom.css" />" rel="stylesheet">
  <mvc:resources mapping="/robots.txt" location="/WEB-INF/robots.txt" order="0"/>	

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Demo app spring jpa jsp hibernate</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="<c:url value = "/"/>">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>
      
      <hr class="sidebar-divider">
      
      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="<c:url value = "posts"/>">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Posts</span></a>
      </li>  
      
       <hr class="sidebar-divider"> 
      
      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="<c:url value = "users"/>">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Users</span></a>
      </li>
                   
      <!-- Divider -->
      <hr class="sidebar-divider">

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>
          
          <form style="float:left;" method="get" action="<c:url value = "${pageurl}"/>">
                <button style="float:left;" class="btn btn-primary" type="submit">
                  <i class="fas fa-search fa-sm">Reset</i>
                </button>             
          </form>          

          <!-- Topbar Search -->
          <form method="get" style="float:left;" action="<c:url value = "${pageurl}"/>" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group">
           	  <input type="hidden" value="1" name="i1">
              <input type="text" name="search" value="${search}" class="form-control bg-light border-0 small" placeholder="Search for ${pageurl}" aria-label="Search" aria-describedby="basic-addon2">
              <div class="input-group-append">
                <button class="btn btn-primary" type="submit">
                  <i class="fas fa-search fa-sm">Search ${pageurl}</i>
                </button>             
              </div>
            </div>
          </form>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">



         

