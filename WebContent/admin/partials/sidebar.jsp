<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
            <li class="nav-item nav-profile">
                <a href="#" class="nav-link">
                    <div class="profile-image">
                        <img class="img-xs rounded-circle" src="../../assets/images/faces/face8.jpg" alt="profile image">
                        <div class="dot-indicator bg-success"></div>
                    </div>
                    <div class="text-wrapper">
                        <p class="profile-name">Allen Moreno</p>
                        <p class="designation">Premium user</p>
                    </div>
                </a>
            </li>
            <li class="nav-item nav-category">Main Menu</li>
            
            <!-- super menu -->
            <li class="nav-item"> 
                <a class="nav-link" href="./?inc=dashboard.jsp">
                    <i class="menu-icon typcn typcn-document-text"></i>
                    <span class="menu-title">Dashboard</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="./?inc=user_list.jsp">
                    <i class="menu-icon typcn typcn-document-text"></i>
                    <span class="menu-title">회원관리</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="./?inc=partner_list.jsp">
                    <i class="menu-icon typcn typcn-document-text"></i>
                    <span class="menu-title">파트너관리</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="./?inc=review_list.jsp">
                    <i class="menu-icon typcn typcn-document-text"></i>
                    <span class="menu-title">리뷰관리</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                    <i class="menu-icon typcn typcn-coffee"></i>
                    <span class="menu-title">승인관리</span>
                    <i class="menu-arrow"></i>
                </a>
                <div class="collapse" id="ui-basic">
                    <ul class="nav flex-column sub-menu">
                        <li class="nav-item">
                            <a class="nav-link" href="./?inc=out.jsp">회원탈퇴 승인</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./?inc=join.jsp">파트너 가입 승인</a>
                        </li>
                    </ul>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="./?inc=site.jsp">
                    <i class="menu-icon typcn typcn-document-text"></i>
                    <span class="menu-title">홈페이지관리</span>
                </a>
            </li>
            <!-- super end -->
            
            
        </ul>
    </nav>