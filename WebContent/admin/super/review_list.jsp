<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <div class="card">
        <div class="card-body">
            <div class="d-flex pb-4 mb-4 border-bottom">
                <div class="d-flex align-items-center">
                    <h5 class="page-title mb-n2">리뷰관리</h5>
                    <p class="mt-1 mb-n1 ml-3 text-muted"></p>
                </div>
                <form class="ml-auto d-flex align-items-stretch w-50 justify-content-end" name='frm_list' id= 'frm_list' method='post'>
                    <input type="text" class="form-control w-50" placeholder="Search"name='findStr' id='findStr' value='${p.findStr }'/>
                    <input type="button" class="btn btn-success no-wrap ml-4" id='btnFind' value='Search'/>
                	<input type='hidden' id = 'nowPage' name='nowPage' value='${p.nowPage }'/>
                </form> 
            </div>
            <div class="nav-scroller">
                <ul class="nav nav-tabs tickets-tab-switch mb-5" role="tablist">
                    
                    <li class="nav-item" style='width:100% !important'>
                        <a class="nav-link" id="onhold-tab" data-toggle="tab" href="#onhold-tickets" role="tab" aria-controls="onhold-tickets" aria-selected="true">전체 리뷰 <div class="badge">${count } </div></a>
                    </li>
                </ul>
            </div>
            
            <div id='contain'>
            	
             
            
            
            
         
            </div>
        </div>
    </div>

