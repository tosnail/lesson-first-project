<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<header>
        <!-- Header Start -->
       <div class="header-area header-transparrent ">
            <div class="main-header header-sticky">
                <div class="container">
                    <div class="row align-items-center">
                        <!-- Logo -->
                        <div class="col-xl-2 col-lg-2 col-md-2">
                            <div class="logo">
                                <a href="/"><img src="https://cdn-icons-png.flaticon.com/512/5957/5957034.png" style='width: 100px; height: 100px;'></a>
                            </div>
                            
                            
                            
                            
                            
                        </div>
                        <div class="col-xl-10 col-lg-10 col-md-10">
                            <!-- Main-menu -->
                            <div class="main-menu f-right d-none d-lg-block">
                                <nav>
                                    <ul id="navigation">    
                                        
                                         
                                        <li><a href="#">LIST</a>
                                            <ul class="submenu">
                                                <li><a href="/program/movielist">영화</a></li>
                                        		<li><a href="/program/programlist">방송</a></li>
                                            </ul>
                                        </li>
                                        
                                        <sec:authorize access="hasRole('ROLE_ADMIN')" >
	                                        <li><a href="#">ADMIN</a>
	                                            <ul class="submenu">
	                                                <li class="nav-item"><a class="nav-link" href="/program/list">프로그램 전체목록</a></li>
													<li class="nav-item"><a class="nav-link" href="/fileinsert">포스터이미지 추가</a></li>
													<li class="nav-item"><a class="nav-link" href="/studioinsert">제작사 추가</a></li>	
													<li class="nav-item"><a class="nav-link" href="/actorinsert">배우 추가</a></li>
													<li class="nav-item"><a class="nav-link" href="/directorinsert">감독 추가</a></li>
													<li class="nav-item"><a class="nav-link" href="/program/insert">프로그램 추가</a></li>
													<li class="nav-item"><a class="nav-link" href="/castmatesinsert">출연진 추가</a></li>
													<li class="nav-item"><a class="nav-link" href="/alist">전체목록</a></li>
													<li class="nav-item"><a class="nav-link" href="/userlist">사용자목록</a></li>
	                                            </ul>
	                                        </li>
										</sec:authorize>
                                        
                                        
                                        
                                        
                                        <sec:authorize access="isAuthenticated()">
											<li class="nav-item"><a class="nav-link" href="/mypage/list">MYPAGE</a></li>
										</sec:authorize>
										<sec:authorize access="isAuthenticated()">
											<li class="nav-item">
											<a class="nav-link" href="/logout">
											🔓LOGOUT(<sec:authentication property="principal.user.username"/>)</a>
											</li>
									 	</sec:authorize>
									 	<sec:authorize access="isAnonymous()">
											<li class="nav-item"><a class="nav-link" href="/login">🔒LOGIN</a>
											</li>
										</sec:authorize>
                                        
                                    </ul>
                                    
                                    
                                </nav>
                            </div>
                        </div>
                        <!-- Mobile Menu -->
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
       </div>
        <!-- Header End -->
    </header>