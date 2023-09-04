<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>Electro - HTML Ecommerce Template</title>

		<!-- Google font -->
		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

		<!-- Bootstrap -->
		<link type="text/css" rel="stylesheet" href="/resources/css/bootstrap.min.css"/>

		<!-- Slick -->
		<link type="text/css" rel="stylesheet" href="/resources/css/slick.css"/>
		<link type="text/css" rel="stylesheet" href="/resources/css/slick-theme.css"/>

		<!-- nouislider -->
		<link type="text/css" rel="stylesheet" href="/resources/css/nouislider.min.css"/>

		<!-- Font Awesome Icon -->
		<link rel="stylesheet" href="/resources/css/font-awesome.min.css">

		<!-- Custom stlylesheet -->
		<link type="text/css" rel="stylesheet" href="/resources/css/style.css"/>

		<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous"> -->

		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

		
			
		<style>
			.product-image {
				width: 100%;
				height: auto;
				max-height: 200px; /* Set the maximum height of the image */
				object-fit: cover; /* Maintain aspect ratio and cover area */
			}
			
		</style>
			
		


    </head>
	<body>
		
<!-- HEADER -->
<header>
    <!-- TOP HEADER -->
    <div id="top-header">
        <div class="container">
            
			
			<ul class="header-links pull-right">
				<c:choose>
					<c:when test="${not empty member}">
						<li class="nav-item text-white me-3"><a href="../member/logout">로그아웃</a></li>

						<li class="nav-item text-white me-3"><a href="../my/mypage">mypage</a></li>

						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle  me-3" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
								마이페이지
							</a>
							<ul class="dropdown-menu" aria-labelledby="userDropdown" style="background-color: #000000; color: #ffffff;">
								<li><a class="dropdown-item" href="">내 상품</a></li>
								<li><a class="dropdown-item" href="">찜한 상품</a></li>
								<li><a class="dropdown-item" href="">고객센터</a></li>
								<li><a class="dropdown-item" href="">계정 설정</a></li>
							</ul>
						</li>

					</c:when>
					<c:otherwise>
						<li class="nav-item text-white me-3"><a href="../member/login">로그인</a></li>
						<li class="nav-item text-white me-3"><a href="../member/signUp">회원가입</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
			
			
			
        </div>
    </div>
    <!-- /TOP HEADER -->

    <!-- MAIN HEADER -->
    <div id="header">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- LOGO -->
                <div class="col-md-3">
                    <div class="header-logo">
                        <a href="#" class="logo">
                            <img src="/resources/img/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->
                <div class="col-md-6">
                    <div class="header-search">
                        <form>
                            <select name="kind" id="k" class="input-select" data-kind="${pager.kind}" aria-label="Default select example">
                                <option class="kind" value="proName">상품명</option>
                                <option class="kind" value="proContents">상품설명</option>
                                <option class="kind" value="userId">이름</option>
                            </select>
                            <input class="input" placeholder="Search here">
                            <button class="search-btn">Search</button>
                        </form>
                    </div>
                </div>
                <!-- <div class="col-md-6">
                    <div class="header-search">
                        <form action="./list" method="get" id="frm">
                            <input type="hidden" value="${pager.page}" id="page" name="page">		
                            <select name="kind" id="k" class="input-select" data-kind="${pager.kind}" aria-label="Default select example">
                                <option class="kind" value="proName">상품명</option>
                                <option class="kind" value="proContents">상품설명</option>
                                <option class="kind" value="userId">이름</option>
                            </select>
                               <input type="text" name="search" value="${pager.search}" class="form-control" aria-label="Amount (to the nearest dollar)">
                                <button type="submit" class="search-btn">검색</button>
                               
                           </form>
                            
                    </div>
                </div> -->
                <!-- /SEARCH BAR -->

                <!-- ACCOUNT -->
                <div class="col-md-3 clearfix">
                    <div class="header-ctn">
                        <!-- Wishlist -->
                        <div>
                            <a href="../product/add">
                                <span>상품등록</span>
                            </a>
                        </div>
                        <!-- /Wishlist -->

                        <!-- Cart -->
                        <div class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                <i class="fa fa-shopping-cart"></i>
                                <span>Your Cart</span>
                                <div class="qty">3</div>
                            </a>
                            <div class="cart-dropdown">
                                <div class="cart-list">
                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="./img/product01.png" alt="">
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                            <h4 class="product-price"><span class="qty">1x</span>$980.00</h4>
                                        </div>
                                        <button class="delete"><i class="fa fa-close"></i></button>
                                    </div>

                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="/resources/img/product02.png" alt="">
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                            <h4 class="product-price"><span class="qty">3x</span>$980.00</h4>
                                        </div>
                                        <button class="delete"><i class="fa fa-close"></i></button>
                                    </div>
                                </div>
                                <div class="cart-summary">
                                    <small>3 Item(s) selected</small>
                                    <h5>SUBTOTAL: $2940.00</h5>
                                </div>
                                <div class="cart-btns">
                                    <a href="#">View Cart</a>
                                    <a href="#">Checkout  <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- /Cart -->

                        <!-- Menu Toogle -->
                        <div class="menu-toggle">
                            <a href="#">
                                <i class="fa fa-bars"></i>
                                <span>Menu</span>
                            </a>
                        </div>
                        <!-- /Menu Toogle -->
                    </div>
                </div>
                <!-- /ACCOUNT -->
            </div>
            <!-- row -->
        </div>
        <!-- container -->
    </div>
    <!-- /MAIN HEADER -->
</header>
<!-- /HEADER -->






		<!-- NAVIGATION -->
		<nav id="navigation">
			<!-- container -->
			<div class="container">
				<!-- responsive-nav -->
				<div id="responsive-nav">
					<!-- NAV -->
					<ul class="main-nav nav navbar-nav">
						<li class="active"><a href="/">Home</a></li>
						<li><a href="/product/categoryList?catNo=1001">에어컨</a></li>
						<li><a href="/product/categoryList?catNo=1002">냉장고</a></li>
						<li><a href="/product/categoryList?catNo=1003">세탁기</a></li>
						<li><a href="/product/categoryList?catNo=1004">TV</a></li>
						<li><a href="/product/categoryList?catNo=1005">노트북</a></li>
						<li><a href="/product/categoryList?catNo=1006">청소기</a></li>
					</ul>
					<!-- /NAV -->
				</div>
				<!-- /responsive-nav -->
			</div>
			<!-- /container -->
		</nav>
		<!-- /NAVIGATION -->



<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

				<!-- section title -->
			<div class="col-md-12">
				<div class="section-title">
					<div class="section-nav">
						<ul class="section-tab-nav tab-nav">
							<li class="active"><a href="#" onclick="changeCondition('최신순')">최신순</a></li>
							<li><a href="#" onclick="changeCondition('인기순')">인기순</a></li>
							<li><a href="#" onclick="changeCondition('저가순')">저가순</a></li>
							<li><a href="#" onclick="changeCondition('고가순')">고가순</a></li>
							
						</ul>
					</div>
				</div>
			</div>
			<section class="container mt-5">
				<div class="container">
					<div class="row">
						<c:forEach items="${list}" var="product" varStatus="status">
							<div class="col-md-4">
								<div class="product-card">
									<c:choose>
										<c:when test="${not empty product.fileDTOs}">
											<img src="${pageContext.request.contextPath}/resources/upload/product/${product.fileDTOs[0].originalName}" alt="" class="product-image">
										</c:when>
										<c:otherwise>
											<img src="/resources/images/이미지없음.jpg" alt="" class="product-image">
										</c:otherwise>
									</c:choose>
									<h4>${product.proName}</h4>
									<p>상품가격: ${product.proPrice}</p>
									<p class="product-content">${product.proContents}</p>
									<p>작성자: ${product.userId}</p>
									<p>작성일: ${product.createDate}</p>
									<p>조회수: ${product.hit}</p>
								</div>
							</div>
							<c:if test="${status.index % 3 == 2 || status.last}">
							</div></div><div class="row"> <!-- 5개 카드마다 row 닫고 새로운 row 열기 -->

							</c:if>
						</c:forEach>
					</div>
				</div>
				<!-- 페이징 및 검색 부분 -->
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<c:if test="${pager.pre}">
							<li class="page-item">
								<a class="page-link move" href="#" data-num="${pager.startNum-1}" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
						</c:if>
						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							<li class="page-item"><a class="page-link move" href="#" data-num="${i}">${i}</a></li>
						</c:forEach>
						<c:if test="${pager.next}">
							<li class="page-item">
								<a class="page-link move" href="#" data-num="${pager.lastNum+1}" aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</c:if>
					</ul>
				</nav>
			
				<!-- 검색 부분 -->
				<div class="input-group mb-3">
					<form action="./list" method="get" id="frm" class="d-flex">
						<input type="hidden" value="${pager.page}" id="page" name="page">
						<select name="kind" id="k" class="form-select" data-kind="${pager.kind}" aria-label="Default select example">
							<option class="kind" value="proName">상품명</option>
							<option class="kind" value="proContents">상품설명</option>
							<option class="kind" value="userId">이름</option>
						</select>
						<input type="text" name="search" value="${pager.search}" class="form-control" aria-label="Amount (to the nearest dollar)">
						<div class="col-auto">
							<button type="submit" class="btn btn-primary">검색</button>
						</div>
					</form>
				</div>
			
			</section>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->


  






<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="/resources/js/list.js"></script>
<script type="text/javascript">
    function changeCondition(condition) {
        // 원하는 URL로 이동, 예: 최신순 정렬
        window.location.href = '/product/list?condition=' + condition;
    }
</script>
</body>
</html>