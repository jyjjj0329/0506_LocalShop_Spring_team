<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
	<title>Yeji's : ${param.title != null ? param.title : "My WebPage!"}</title>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <!-- sellerFooter css -->
	  <link rel="stylesheet" type="text/css" href="resources/css/seller.css">
	  <!-- 부트스트랩 링크 -->
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body> 
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="mainpage">지역화페</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="seller">판매자 Home</a></li>
      <li><a href="sellerInsert">판매 물품 등록</a></li>
      <li><a href="sellerList?page=1">물품 리스트</a></li>
      <li><a href="goodsSold?page=1">판매된 물품</a></li>
    </ul>
	<ul class="nav nav-pills">
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
			style="color: white; background: none; width: 150px; margin-top: 5px;">
			<span class="glyphicon glyphicon-user"></span>
		      &nbsp;${sessionScope.seller_id }</a>
		    <div class="dropdown-menu">
		      <a class="dropdown-item" href="logout">로그아웃</a><br/>
		      <a class="dropdown-item" href="#">마이페이지</a>
		    </div>
	  	</li>
  	</ul>
  </div>
</nav>
