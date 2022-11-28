<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <div class="nav-left-sidebar sidebar-dark">
            <div class="menu-list">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="d-xl-none d-lg-none" href="./adminStoreList.us">List</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav flex-column">
                            <li class="nav-divider">
                                Menu
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link active" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1" aria-controls="submenu-1"><i class="fa fa-fw fa-user-circle"></i>Admin <span class="badge badge-success">6</span></a>
                                <div id="submenu-1" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="./adminGenMemList.us">회원 목록</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="./adminStoreList.us">가게 목록</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="./adminReportList.us?s=1">신고 목록</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="./ApiStore.ap">api 가게 목록</a>
                                        </li>
                                        
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-6" aria-controls="submenu-6"><i class="fas fa-fw fa-table"></i>공지</a>
                                <div id="submenu-6" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="./adminReservList.us">예약 목록</a>
                                            <a class="nav-link" href="./adminReservList.us">예약 & 결제 목록</a>
                                        </li>
                                        <li class="nav-item">
	                                        <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-11" aria-controls="submenu-11">공지 & 이벤트</a>
	                                        <div id="submenu-11" class="collapse submenu" style="">
	                                            <ul class="nav flex-column">
	                                                <li class="nav-item">
			                                            <a class="nav-link" href="./adminNoticeList.us">목록</a>
			                                        </li>
	                                                <li class="nav-item">
			                                            <a class="nav-link" href="./adminNoticeWrite.us">작성</a>
			                                        </li>
	                                            </ul>
	                                        </div>
	                                    </li>
                                        
                                        
                                    </ul>
                                </div>
                            </li>
                            
                        </ul>
                    </div>
                </nav>
            </div>
        </div>