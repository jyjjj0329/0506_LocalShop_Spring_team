<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- 헤드 부분 -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- param을 받아 타이틀이 조금씩 다르게 만들었음. -->
	<!-- 
		제가 임의로 만든거라 yeji's : 를 기본으로 했었는데 개인적으로 바꾸셔도 되고 나중에 기능 다 
		구현 한 후 디자인 손 볼때 팀 이름 정해서 바꿔도 괜찮을꺼 같아요!
	 -->
	<title>Yeji's : ${param.title != null ? param.title : "My WebPage!"}</title>
	<link rel="stylesheet" type="text/css" href="layout/layout.css">
</head>
<body>
	<div align="center">
		<div class = "header" align="center">
		<a href="sellerInsert">판매 물품 등록</a>  | 
		<a href="sellerList?page=1">판매 리스트</a>
		<input type="button" value="로그인" onclick="location.href='login'">
		<input type="button" value="회원가입" onclick="location.href='signUp'">
		</div>
		<div class="main" align="center">