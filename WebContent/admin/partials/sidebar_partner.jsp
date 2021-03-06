<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	
	//HttpSession session  = request.getSession();
	String member_id = (String) session.getAttribute("member_id");
	

%>
    <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
            <li class="nav-item nav-profile">
                <a href="#" class="nav-link">
                    <div class="profile-image">
                        <img class="img-xs rounded-circle" src="../../assets/images/faces/face8.jpg" alt="profile image">
                        <div class="dot-indicator bg-success"></div>
                    </div>
                    <div class="text-wrapper">
                        <p class="profile-name">${member_id }</p>
                        <p class="designation">Partner</p>
                    </div>
                </a>
            </li>
            <li class="nav-item nav-category">Main Menu</li>
            
            
            <!-- partner menu -->
            <!-- hotel menu -->
            <li class="nav-item">
                <a class="nav-link" href="./?inc=dashboard.ph">
                    <i class="menu-icon typcn typcn-document-text"></i>
                    <span class="menu-title">Dashboard</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="./?inc=hotel_comp_list.ph">
                    <i class="menu-icon typcn typcn-coffee"></i>
                    <span class="menu-title">호텔관리</span>
                </a>
            </li>
            <li class="nav-item">
            	<a class="nav-link" href="./?inc=hotel_room_list.ph">
                    <i class="menu-icon typcn typcn-coffee"></i>
                    <span class="menu-title">객실관리</span>
                </a>
            </li>
            <li class="nav-item">
            	<a class="nav-link" href="./?inc=hotel_order_list.ph">
                    <i class="menu-icon typcn typcn-coffee"></i>
                    <span class="menu-title">예약관리</span>
                </a>
            </li>
            <!-- end of hotel menu -->
            
            <!-- rent menu -->
            <li class="nav-item">
                <a class="nav-link" href="./?inc=dashboard.pr">
                    <i class="menu-icon typcn typcn-document-text"></i>
                    <span class="menu-title">Dashboard</span>
                </a>
            </li>
            <li class="nav-item">
            	<a class="nav-link" href="./?inc=rent_comp_list.pr">
                    <i class="menu-icon typcn typcn-coffee"></i>
                    <span class="menu-title">회사관리</span>
                </a>
            </li>
            <li class="nav-item">
            	<a class="nav-link" href="./?inc=rent_car_list.pr">
                    <i class="menu-icon typcn typcn-coffee"></i>
                    <span class="menu-title">차량관리</span>
                </a>
            </li>
            <li class="nav-item">
            	<a class="nav-link" href="./?inc=rent_order_list.pr">
                    <i class="menu-icon typcn typcn-coffee"></i>
                    <span class="menu-title">예약관리</span>
                </a>
            </li>
            <!-- end of rent menu -->
            <!-- partner end -->
        </ul>
    </nav>