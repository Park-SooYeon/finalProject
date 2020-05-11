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
                <a class="nav-link" href="../super/index.jsp">
                    <i class="menu-icon typcn typcn-document-text"></i>
                    <span class="menu-title">Dashboard</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../super/user_list.jsp">
                    <i class="menu-icon typcn typcn-document-text"></i>
                    <span class="menu-title">회원관리</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../super/partner_list.jsp">
                    <i class="menu-icon typcn typcn-document-text"></i>
                    <span class="menu-title">파트너관리</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../super/review_list.jsp">
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
                            <a class="nav-link" href="../super/out.jsp">회원탈퇴 승인</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../super/join.jsp">파트너 가입 승인</a>
                        </li>
                    </ul>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../super/site.jsp">
                    <i class="menu-icon typcn typcn-document-text"></i>
                    <span class="menu-title">홈페이지관리</span>
                </a>
            </li>
            <!-- super end -->
            
            
            <!-- partner menu -->
            <li class="nav-item">
                <a class="nav-link" href="index.jsp">
                    <i class="menu-icon typcn typcn-document-text"></i>
                    <span class="menu-title">Dashboard</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="collapse" href="#hotel" aria-expanded="false" aria-controls="hotel">
                    <i class="menu-icon typcn typcn-coffee"></i>
                    <span class="menu-title">호텔관리</span>
                    <i class="menu-arrow"></i>
                </a>
                <div class="collapse" id="hotel">
                    <ul class="nav flex-column sub-menu">
                        <li class="nav-item">
                            <a class="nav-link" href="../partner/hotel_comp_list.jsp">호텔관리</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../partner/hotel_room_list.jsp">객실관리</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../partner/hotel_order_list.jsp">예약관리</a>
                        </li>
                    </ul>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="collapse" href="#rent" aria-expanded="false" aria-controls="rent">
                    <i class="menu-icon typcn typcn-coffee"></i>
                    <span class="menu-title">렌트관리</span>
                    <i class="menu-arrow"></i>
                </a>
                <div class="collapse" id="rent">
                    <ul class="nav flex-column sub-menu">
                        <li class="nav-item">
                            <a class="nav-link" href="../partner/rent_comp_list.jsp">회사관리</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../partner/rent_car_list.jsp">차량관리</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../partner/rent_order_list.jsp">예약관리</a>
                        </li>
                    </ul>
                </div>
            </li>
            <!-- partner end -->
        </ul>
    </nav>