<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/layout/nav.jsp" />
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="resources/css/style-myinfo.css" rel="stylesheet" />
</head>
<body>
	<h1 class="info">회원정보 조회</h1>
	<p class="info2">${buyerVO.id}님께서가입하신 회원정보입니다.</p>
	<div class="information">
		<div class="pinfo">
			<div class="div_left">이 름</div>
			<div class="div_right">${buyerVO.name}</div>
		</div>
		<div class="pinfo">
			<div class="div_left">닉네임</div>
			<div class="div_right">${buyerVO.nickname}</div>
		</div>
		<div class="pinfo">
			<div class="div_left">성 별</div>
			<div class="div_right">
				<c:if test="${buyerVO.gender == true}">남성</c:if>
				<c:if test="${buyerVO.gender == false}">여성</c:if>
			</div>
		</div>
		<div class="pinfo">
			<div class="div_left">나 이</div>
			<div class="div_right">${buyerVO.age}</div>
		</div>
		<div class="pinfo">
			<div class="div_left">이메일</div>
			<div class="div_right">${buyerVO.email}</div>
		</div>
		<div class="pinfo">
			<div class="div_left">휴대폰</div>
			<div class="div_right">(${buyerVO.carrier})${buyerVO.phonenum}</div>
		</div>
		<div class="pinfo">
			<div class="div_left">카 드</div>
			<div class="div_right">(${buyerVO.creditcard})${buyerVO.cardNum}</div>
		</div>
		<div class="pinfo">
			<div class="div_left">지 역</div>
			<div class="div_right">${buyerVO.area}</div>
		</div>
		<div class="pinfo">
			<div class="div_left">주 소</div>
			<div class="div_right">${buyerVO.address}</div>
		</div>
		<div class="pinfo">
			<div class="div_left">잔 액</div>
			<div class="div_right">${buyerVO.money}</div>
		</div>
		<div class="btn-div">
			<button type="button" class="btn-myinfo btn-buy" onclick="location.href='buyhistory'">구매내역</button>
			<button type="button" class="btn-myinfo" onclick="location.href='pwchange'">비밀번호변경</button>
			<button type="button" class="btn-myinfo" onclick="location.href='infochange'">수정</button>
			<button type="button" class="btn-myinfo" onclick="location.href='infodelete'">탈퇴</button>
		</div>
	</div>
</body>
</html>