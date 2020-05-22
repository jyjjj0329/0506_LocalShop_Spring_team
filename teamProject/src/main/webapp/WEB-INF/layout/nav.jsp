<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>

<link rel="stylesheet" type="text/css" href="layout/layout.css">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<!-- Bootstrap CSS -->

<link rel="stylesheet" href="resources/css/style-mainpage.css" />


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

</head>
<body>
	<!--상단 네비게이션 바-->
	<div id="navbar">
		<nav class="navbar bg-dark navbar-dark">
			<!-- Brand -->
			<b><a class="navbar-brand" href="mainpage">지역 화폐</a></b>

			<!-- Dropdown -->
			<div class="btn-group dropdown navbar-right">
				<a class="btn dropdown-toggle" href="#" data-toggle="dropdown">
					<span class="navbar-toggler-icon"></span>
				</a>
				<ul class="dropdown-menu dropdown-menu-right">
					<li><a class="dropdown-item" href="#">고객지원</a></li>
					<li><a class="dropdown-item" href="#">마이페이지</a></li>
					<li><a class="dropdown-item" href="login">로그인</a></li>
					<li><a class="dropdown-item" href="signUp">회원가입</a></li>
					<c:if test="${sessionScope.seller_id != null }">
						<li><a class="dropdown-item" href="sellerInsert">판매 물품 등록</a></li>
						<li><a class="dropdown-item" href="sellerList?page=1">판매 리스트</a></li>
					</c:if>
				</ul>
			</div>
		</nav>
	</div>