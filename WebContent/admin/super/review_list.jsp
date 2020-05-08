<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="../../assets/vendors/lightgallery/css/lightgallery.css">

    <%@include file="../partials/header.jsp" %>
        <div class="content-wrapper">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex pb-4 mb-4 border-bottom">
                        <div class="d-flex align-items-center">
                            <h5 class="page-title mb-n2">리뷰관리</h5>
                            <p class="mt-1 mb-n1 ml-3 text-muted">230 Review</p>
                        </div>
                        <form class="ml-auto d-flex align-items-stretch w-50 justify-content-end">
                            <input type="name" class="form-control w-50" placeholder="Search">
                            <button type="submit" class="btn btn-success no-wrap ml-4">Search</button>
                        </form>
                    </div>
                    <div class="nav-scroller">
                        <ul class="nav nav-tabs tickets-tab-switch mb-5" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="open-tab" data-toggle="tab" href="#open-tickets" role="tab" aria-controls="open-tickets" aria-selected="true">미확인 신고 리뷰<div class="badge">13</div></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="pending-tab" data-toggle="tab" href="#pending-tickets" role="tab" aria-controls="pending-tickets" aria-selected="false">신고된 리뷰 <div class="badge">50 </div></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="onhold-tab" data-toggle="tab" href="#onhold-tickets" role="tab" aria-controls="onhold-tickets" aria-selected="false">전체 리뷰 <div class="badge">29 </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-content tab-content-basic">
                        <div class="tab-pane fade active show" id="open-tickets" role="tabpanel" aria-labelledby="open-tickets">
                            <a href="#" class="tickets-card row" data-toggle="modal" data-target="#modalReviewDt">
                                <div class="tickets-details col-md-8">
                                    <div class="wrapper">
                                        <h5><span id="admReviewNum">#39033</span> - <span id="admReviewSuj">Design Admin Dashboard</span></h5>
                                        <div class="badge badge-success font-weight-bold">미확인</div>
                                        <div class="badge badge-danger font-weight-bold">신고</div>
                                    </div>
                                    <div class="wrapper text-muted">
                                        <span id="admProdNm">워커힐 호텔 스위트 시티뷰</span>
                                        <i class="mdi mdi-clock-outline ml-2"></i>
                                        <span id="writeDt" class="ml-1">2020/05/12 03:34AM</span>
                                    </div>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <img class="img-xs rounded-circle" src="../../assets/images/faces/face16.jpg" alt="profile image">
                                    <span class="text-muted">Frank Briggs</span>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <i class="category-icon mdi mdi-folder-outline"></i>
                                    <span class="text-muted">호텔</span>
                                </div>
                            </a>
                            <a href="#" class="tickets-card row" data-toggle="modal" data-target="#modalReviewDt">
                                <div class="tickets-details col-md-8">
                                    <div class="wrapper">
                                        <h5>#39040 - Website Redesign</h5>
                                        <div class="badge badge-danger font-weight-bold">신고</div>
                                    </div>
                                    <div class="wrapper text-muted">
                                        <span>Assigned to</span>
                                        <img class="assignee-avatar" src="../../assets/images/faces/face18.jpg" alt="profile image">
                                        <span>Olivia Cross</span>
                                        <span><i class="mdi mdi-clock-outline"></i>04:23AM</span>
                                    </div>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <img class="img-xs rounded-circle" src="../../assets/images/faces/face14.jpg" alt="profile image">
                                    <span class="text-muted">Frank Briggs</span>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <i class="category-icon mdi mdi-folder-outline"></i>
                                    <span class="text-muted">Wireframe</span>
                                </div>
                            </a>
                            <a href="#" class="tickets-card row" data-toggle="modal" data-target="#modalReviewDt">
                                <div class="tickets-details col-md-8">
                                    <div class="wrapper">
                                        <h5>#39041 - Bootstrap Framework not working</h5>

                                    </div>
                                    <div class="wrapper text-muted">
                                        <span>Assigned to</span>
                                        <img class="assignee-avatar" src="../../assets/images/faces/face11.jpg" alt="profile image">
                                        <span>Leah Frank</span>
                                        <span><i class="mdi mdi-clock-outline"></i>04:24AM</span>
                                    </div>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <img class="img-xs rounded-circle" src="../../assets/images/faces/face10.jpg" alt="profile image">
                                    <span class="text-muted">Emilie Barnett</span>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <i class="category-icon mdi mdi-folder-outline"></i>
                                    <span class="text-muted">Deployed</span>
                                </div>
                            </a>
                            <a href="#" class="tickets-card row" data-toggle="modal" data-target="#modalReviewDt">
                                <div class="tickets-details col-md-8">
                                    <div class="wrapper">
                                        <h5>#39045 - Design Admin Dashboard</h5>
                                    </div>
                                    <div class="wrapper text-muted">
                                        <span>Assigned to</span>
                                        <img class="assignee-avatar" src="../../assets/images/faces/face18.jpg" alt="profile image">
                                        <span>Luella Sparks</span>
                                        <span><i class="mdi mdi-clock-outline"></i>12:54PM</span>
                                    </div>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <img class="img-xs rounded-circle" src="../../assets/images/faces/face6.jpg" alt="profile image">
                                    <span class="text-muted">Hunter Garza</span>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <i class="category-icon mdi mdi-folder-outline"></i>
                                    <span class="text-muted">Concept</span>
                                </div>
                            </a>
                            <a href="#" class="tickets-card row" data-toggle="modal" data-target="#modalReviewDt">
                                <div class="tickets-details col-md-8">
                                    <div class="wrapper">
                                        <h5>#29033 - Set up the marketplace strategy </h5>
                                    </div>
                                    <div class="wrapper text-muted">
                                        <span>Assigned to</span>
                                        <img class="assignee-avatar" src="../../assets/images/faces/face15.jpg" alt="profile image">
                                        <span>Mitchell Barber</span>
                                        <span><i class="mdi mdi-clock-outline"></i>4:19AM</span>
                                    </div>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <img class="img-xs rounded-circle" src="../../assets/images/faces/face7.jpg" alt="profile image">
                                    <span class="text-muted">Michael Campbell</span>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <i class="category-icon mdi mdi-folder-outline"></i>
                                    <span class="text-muted">Wireframe</span>
                                </div>
                            </a>
                            <a href="#" class="tickets-card row" data-toggle="modal" data-target="#modalReviewDt">
                                <div class="tickets-details col-md-8">
                                    <div class="wrapper">
                                        <h5>#29033 - Design Admin Dashboard</h5>

                                    </div>
                                    <div class="wrapper text-muted">
                                        <span>Assigned to</span>
                                        <img class="assignee-avatar" src="../../assets/images/faces/face13.jpg" alt="profile image">
                                        <span>Rhoda Jimenez</span>
                                        <span><i class="mdi mdi-clock-outline"></i>01:27PM</span>
                                    </div>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <img class="img-xs rounded-circle" src="../../assets/images/faces/face10.jpg" alt="profile image">
                                    <span class="text-muted">Maria Cook</span>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <i class="category-icon mdi mdi-folder-outline"></i>
                                    <span class="text-muted">Deployed</span>
                                </div>
                            </a>
                            <a href="#" class="tickets-card row" data-toggle="modal" data-target="#modalReviewDt">
                                <div class="tickets-details col-md-8">
                                    <div class="wrapper">
                                        <h5>#29033 - Compose newsletter for the big launch</h5>

                                    </div>
                                    <div class="wrapper text-muted">
                                        <span>Assigned to</span>
                                        <img class="assignee-avatar" src="../../assets/images/faces/face17.jpg" alt="profile image">
                                        <span>Alta Little</span>
                                        <span><i class="mdi mdi-clock-outline"></i>06:16PM</span>
                                    </div>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <img class="img-xs rounded-circle" src="../../assets/images/faces/face20.jpg" alt="profile image">
                                    <span class="text-muted">Juan Little</span>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <i class="category-icon mdi mdi-folder-outline"></i>
                                    <span class="text-muted">Concept</span>
                                </div>
                            </a>
                        </div>
                        <div class="tab-pane fade" id="pending-tickets" role="tabpanel" aria-labelledby="pending-tickets">
                            <a href="#" class="tickets-card row" data-toggle="modal" data-target="#modalReviewDt">
                                <div class="tickets-details col-md-8">
                                    <div class="wrapper">
                                        <h5>#39045 - Design Admin Dashboard</h5>
                                    </div>
                                    <div class="wrapper text-muted">
                                        <span>Assigned to</span>
                                        <img class="assignee-avatar" src="../../assets/images/faces/face18.jpg" alt="profile image">
                                        <span>Luella Sparks</span>
                                        <span><i class="mdi mdi-clock-outline"></i>12:54PM</span>
                                    </div>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <img class="img-xs rounded-circle" src="../../assets/images/faces/face6.jpg" alt="profile image">
                                    <span class="text-muted">Hunter Garza</span>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <i class="category-icon mdi mdi-folder-outline"></i>
                                    <span class="text-muted">Concept</span>
                                </div>
                            </a>
                            <a href="#" class="tickets-card row" data-toggle="modal" data-target="#modalReviewDt">
                                <div class="tickets-details col-md-8">
                                    <div class="wrapper">
                                        <h5>#39033 - Design Admin Dashboard</h5>

                                    </div>
                                    <div class="wrapper text-muted">
                                        <span>Assigned to</span>
                                        <img class="assignee-avatar" src="../../assets/images/faces/face13.jpg" alt="profile image">
                                        <span>Brett Gonzales</span>
                                        <span><i class="mdi mdi-clock-outline"></i>03:34AM</span>
                                    </div>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <img class="img-xs rounded-circle" src="../../assets/images/faces/face16.jpg" alt="profile image">
                                    <span class="text-muted">Frank Briggs</span>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <i class="category-icon mdi mdi-folder-outline"></i>
                                    <span class="text-muted">Wireframe</span>
                                </div>
                            </a>
                            <a href="#" class="tickets-card row" data-toggle="modal" data-target="#modalReviewDt">
                                <div class="tickets-details col-md-8">
                                    <div class="wrapper">
                                        <h5>#29033 - Compose newsletter for the big launch</h5>

                                    </div>
                                    <div class="wrapper text-muted">
                                        <span>Assigned to</span>
                                        <img class="assignee-avatar" src="../../assets/images/faces/face17.jpg" alt="profile image">
                                        <span>Alta Little</span>
                                        <span><i class="mdi mdi-clock-outline"></i>06:16PM</span>
                                    </div>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <img class="img-xs rounded-circle" src="../../assets/images/faces/face20.jpg" alt="profile image">
                                    <span class="text-muted">Juan Little</span>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <i class="category-icon mdi mdi-folder-outline"></i>
                                    <span class="text-muted">Concept</span>
                                </div>
                            </a>
                            <a href="#" class="tickets-card row" data-toggle="modal" data-target="#modalReviewDt">
                                <div class="tickets-details col-md-8">
                                    <div class="wrapper">
                                        <h5>#39040 - Website Redesign</h5>

                                    </div>
                                    <div class="wrapper text-muted">
                                        <span>Assigned to</span>
                                        <img class="assignee-avatar" src="../../assets/images/faces/face18.jpg" alt="profile image">
                                        <span>Olivia Cross</span>
                                        <span><i class="mdi mdi-clock-outline"></i>04:23AM</span>
                                    </div>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <img class="img-xs rounded-circle" src="../../assets/images/faces/face14.jpg" alt="profile image">
                                    <span class="text-muted">Frank Briggs</span>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <i class="category-icon mdi mdi-folder-outline"></i>
                                    <span class="text-muted">Wireframe</span>
                                </div>
                            </a>
                            <a href="#" class="tickets-card row" data-toggle="modal" data-target="#modalReviewDt">
                                <div class="tickets-details col-md-8">
                                    <div class="wrapper">
                                        <h5>#29033 - Set up the marketplace strategy </h5>
                                    </div>
                                    <div class="wrapper text-muted">
                                        <span>Assigned to</span>
                                        <img class="assignee-avatar" src="../../assets/images/faces/face15.jpg" alt="profile image">
                                        <span>Mitchell Barber</span>
                                        <span><i class="mdi mdi-clock-outline"></i>4:19AM</span>
                                    </div>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <img class="img-xs rounded-circle" src="../../assets/images/faces/face7.jpg" alt="profile image">
                                    <span class="text-muted">Michael Campbell</span>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <i class="category-icon mdi mdi-folder-outline"></i>
                                    <span class="text-muted">Wireframe</span>
                                </div>
                            </a>
                            <a href="#" class="tickets-card row" data-toggle="modal" data-target="#modalReviewDt">
                                <div class="tickets-details col-md-8">
                                    <div class="wrapper">
                                        <h5>#39041 - Bootstrap Framework not working</h5>

                                    </div>
                                    <div class="wrapper text-muted">
                                        <span>Assigned to</span>
                                        <img class="assignee-avatar" src="../../assets/images/faces/face11.jpg" alt="profile image">
                                        <span>Leah Frank</span>
                                        <span><i class="mdi mdi-clock-outline"></i>04:24AM</span>
                                    </div>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <img class="img-xs rounded-circle" src="../../assets/images/faces/face10.jpg" alt="profile image">
                                    <span class="text-muted">Emilie Barnett</span>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <i class="category-icon mdi mdi-folder-outline"></i>
                                    <span class="text-muted">Deployed</span>
                                </div>
                            </a>
                            <a href="#" class="tickets-card row" data-toggle="modal" data-target="#modalReviewDt">
                                <div class="tickets-details col-md-8">
                                    <div class="wrapper">
                                        <h5>#29033 - Design Admin Dashboard</h5>

                                    </div>
                                    <div class="wrapper text-muted">
                                        <span>Assigned to</span>
                                        <img class="assignee-avatar" src="../../assets/images/faces/face13.jpg" alt="profile image">
                                        <span>Rhoda Jimenez</span>
                                        <span><i class="mdi mdi-clock-outline"></i>01:27PM</span>
                                    </div>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <img class="img-xs rounded-circle" src="../../assets/images/faces/face10.jpg" alt="profile image">
                                    <span class="text-muted">Maria Cook</span>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <i class="category-icon mdi mdi-folder-outline"></i>
                                    <span class="text-muted">Deployed</span>
                                </div>
                            </a>
                        </div>
                        <div class="tab-pane fade" id="onhold-tickets" role="tabpanel" aria-labelledby="onhold-tickets">
                            <a href="#" class="tickets-card row" data-toggle="modal" data-target="#modalReviewDt">
                                <div class="tickets-details col-md-8">
                                    <div class="wrapper">
                                        <h5>#39040 - Website Redesign</h5>
                                    </div>
                                    <div class="wrapper text-muted">
                                        <span>Assigned to</span>
                                        <img class="assignee-avatar" src="../../assets/images/faces/face18.jpg" alt="profile image">
                                        <span>Olivia Cross</span>
                                        <span><i class="mdi mdi-clock-outline"></i>04:23AM</span>
                                    </div>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <img class="img-xs rounded-circle" src="../../assets/images/faces/face14.jpg" alt="profile image">
                                    <span class="text-muted">Frank Briggs</span>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <i class="category-icon mdi mdi-folder-outline"></i>
                                    <span class="text-muted">Wireframe</span>
                                </div>
                            </a>
                            <a href="#" class="tickets-card row" data-toggle="modal" data-target="#modalReviewDt">
                                <div class="tickets-details col-md-8">
                                    <div class="wrapper">
                                        <h5>#29033 - Design Admin Dashboard</h5>

                                    </div>
                                    <div class="wrapper text-muted">
                                        <span>Assigned to</span>
                                        <img class="assignee-avatar" src="../../assets/images/faces/face13.jpg" alt="profile image">
                                        <span>Rhoda Jimenez</span>
                                        <span><i class="mdi mdi-clock-outline"></i>01:27PM</span>
                                    </div>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <img class="img-xs rounded-circle" src="../../assets/images/faces/face10.jpg" alt="profile image">
                                    <span class="text-muted">Maria Cook</span>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <i class="category-icon mdi mdi-folder-outline"></i>
                                    <span class="text-muted">Deployed</span>
                                </div>
                            </a>
                            <a href="#" class="tickets-card row" data-toggle="modal" data-target="#modalReviewDt">
                                <div class="tickets-details col-md-8">
                                    <div class="wrapper">
                                        <h5>#29033 - Compose newsletter for the big launch</h5>
                                    </div>
                                    <div class="wrapper text-muted">
                                        <span>Assigned to</span>
                                        <img class="assignee-avatar" src="../../assets/images/faces/face17.jpg" alt="profile image">
                                        <span>Alta Little</span>
                                        <span><i class="mdi mdi-clock-outline"></i>06:16PM</span>
                                    </div>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <img class="img-xs rounded-circle" src="../../assets/images/faces/face20.jpg" alt="profile image">
                                    <span class="text-muted">Juan Little</span>
                                </div>
                                <div class="ticket-float col-md-2 col-6">
                                    <i class="category-icon mdi mdi-folder-outline"></i>
                                    <span class="text-muted">Concept</span>
                                </div>
                            </a>
                        </div>
                    </div>
                    <nav class="mt-4">
                        <ul class="pagination">
                            <li class="page-item">
                                <a class="page-link" href="#">
                                    <i class="mdi mdi-chevron-left"></i>
                                </a>
                            </li>
                            <li class="page-item active">
                                <a class="page-link" href="#">1</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="#">2</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="#">3</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="#">4</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="#">
                                    <i class="mdi mdi-chevron-right"></i>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>


        <!-- 리뷰 상세조회 modal -->
        <div class="modal fade" id="modalReviewDt" tabindex="-1" role="dialog" aria-labelledby="modalReviewDt" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel-2">리뷰 상세조회</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body pt-2">
                        <div class="wrapper d-flex align-items-center py-2 mb-3">
                            <img class="img-sm rounded-circle" src="../../assets/images/faces/face5.jpg" alt="profile">
                            <div class="wrapper ml-3">
                                <h6 class="ml-1 mb-1">Stella Davidson</h6>
                            </div>
                            <small class="time d-none d-sm-block ml-auto " id="ReviewRegDt">2018.02.05 작성됨</small>
                        </div>
                        <form class="row" name="usrInfoFrm">
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="">제목</label>
                                    <p id="ReviewSbj" class="">너무 좋아요~!</p>
                                </div>


                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="">내용</label>
                                    <p id="ReviewContent" class="">좋아요</p>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="">사진</label>
                                    <div id="lightgallery" class="row lightGallery">
                                        <a href="../../assets/images/samples/1280x768/1.jpg" class="image-tile">
                                            <img src="../../assets/images/samples/300x300/1.jpg" alt="image small">
                                        </a>
                                        <a href="../../assets/images/samples/1280x768/2.jpg" class="image-tile">
                                            <img src="../../assets/images/samples/300x300/2.jpg" alt="image small">
                                        </a>
                                        <a href="../../assets/images/samples/1280x768/3.jpg" class="image-tile">
                                            <img src="../../assets/images/samples/300x300/3.jpg" alt="image small">
                                        </a>
                                        <a href="../../assets/images/samples/1280x768/4.jpg" class="image-tile">
                                            <img src="../../assets/images/samples/300x300/4.jpg" alt="image small">
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="wrapper d-flex align-items-center py-2">
                                    <label class="mb-0">신고</label>
                                    <small id="reportTot" class="ml-auto">총 20건</small>
                                </div>
                                <div class="wrapper">
                                    <div class="d-flex align-items-center py-2 border-bottom">
                                        <p class="mb-0 "><a href="#" class="font-weight-bold" data-toggle="modal" data-target="#modalRptView">욕설/인신공격</a></p>
                                        <p class="badge badge-pill badge-danger ml-auto mb-0">5</p>
                                    </div>
                                    <div class="d-flex align-items-center py-2 border-bottom">

                                        <p class="mb-0 "><a href="#" class="font-weight-bold" data-toggle="modal" data-target="#modalRptView">기타</a></p>
                                        <p class="badge badge-pill badge-danger ml-auto mb-0">5</p>
                                    </div>
                                    <div class="d-flex align-items-center py-2">

                                        <p class="mb-0 "><a href="#" class="font-weight-bold" data-toggle="modal" data-target="#modalRptView">영리목적/홍보성</a></p>
                                        <p class="badge badge-pill badge-danger ml-auto mb-0">5</p>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-success" onclick="showSwal('warning-message-and-cancel')">게시글 삭제</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- end of 리뷰 상세조회 modal -->


        <!-- 신고내역 상세보기 modal -->
        <div class="modal fade" id="modalRptView" tabindex="-1" role="dialog" aria-labelledby="modalRptView" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header border-0 pb-2">
                        <h5 class="modal-title" id="exampleModalLabel-2">신고내용 조회</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body pt-2">
                        <div class="dropdown mb-4">
                            <button class="btn btn-outline-danger dropdown-toggle" type="button" id="dropdownMenuOutlineButton1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 욕설/인신공격 </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuOutlineButton1" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 35px, 0px);">
                                <a class="dropdown-item" href="#">욕설/인신공격</a>
                                <a class="dropdown-item" href="#">기타</a>
                                <a class="dropdown-item" href="#">영리목적/홍보성</a>
                            </div>
                        </div>
                        <div class="wrap report-wrap">
                            <div class="card aligner-wrapper col-12 mb-2">
                                <div class="card-body p-3">
                                    <div class="absolute left top bottom h-100 v-strock-2 bg-danger"></div>
                                    <p class="text-muted mb-2 text-small">2020-04-20 신고됨</p>

                                    <div class="d-flex align-items-center">
                                        <div class="bg-danger dot-indicator"></div>
                                        <p class="text-muted mb-0 ml-2 w-100">Payout for next week $100 </p>
                                    </div>
                                </div>
                            </div>
                            <div class="card aligner-wrapper col-12 mb-2">
                                <div class="card-body p-3">
                                    <div class="absolute left top bottom h-100 v-strock-2 bg-danger"></div>
                                    <p class="text-muted mb-2 text-small">2020-04-20 신고됨</p>

                                    <div class="d-flex align-items-center">
                                        <div class="bg-danger dot-indicator"></div>
                                        <p class="text-muted mb-0 ml-2 w-100">Payout for next week $100 </p>
                                    </div>
                                </div>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end of 신고내역 상세보기 modal -->


        <%@include file="../partials/footer.jsp" %>
            <!-- Plugin js for this page -->

            <!-- End plugin js for this page <-->
            <!-- Custom js for this page -->
            <script src="../../assets/js/shared/light-gallery.js"></script>

            <!-- End custom js for this page -->