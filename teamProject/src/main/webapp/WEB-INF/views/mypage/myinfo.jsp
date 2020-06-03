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
<link href="resources/css/style-myinfo.css" rel="stylesheet"/>
</head>
<body>
	<h1 class="info">회원정보 조회</h1>
	<h2 class="info2">  ${buyerVO.id}님께서 가입하신 회원정보입니다.</h2>
	<div class="pinfo">
		<p>이 름 : ${buyerVO.name}</p>
		<p>닉네임: ${buyerVO.nickname}</p>
		<p>성 별 : <c:if test="${buyerVO.gender == true}">남성</c:if> <c:if
					test="${buyerVO.gender == false}">여성</c:if></p>
		<p>나 이 : ${buyerVO.age}</p>
		<p>이메일: ${buyerVO.email}</p>
		<p>휴대폰: (${buyerVO.carrier})${buyerVO.phonenum}</p>
		<p>카 드 : (${buyerVO.creditcard})${buyerVO.cardNum}</p>
		<p>지 역 : ${buyerVO.area}</p>
		<p>주 소 : ${buyerVO.address}</p>
		<p>잔 액 : ${buyerVO.money}</p>
	</div>
<%-- 	
	
	<table border="1">
		<tr>
			<th>${buyerVO.id}님</th>
		</tr>
		<tr>
			<th>이 름 : ${buyerVO.name}</th>
		</tr>
		<tr>
			<th>닉네임: ${buyerVO.nickname}</th>
		</tr>
		<tr>
			<th>성 별 : <c:if test="${buyerVO.gender == true}">남성</c:if> <c:if
					test="${buyerVO.gender == false}">여성</c:if>
			</th>
		</tr>
		<tr>
			<th>나 이 : ${buyerVO.age}</th>
		</tr>
		<tr>
			<th>이메일: ${buyerVO.email}</th>
		</tr>
		<tr>
			<th>휴대폰: (${buyerVO.carrier})${buyerVO.phonenum}</th>
		</tr>
		<tr>
			<th>카 드 : (${buyerVO.creditcard})${buyerVO.cardNum}</th>
		</tr>
		<tr>
			<th>지 역 : ${buyerVO.area}</th>
		</tr>
		<tr>
			<th>주 소 : ${buyerVO.address}</th>
		</tr>
		<tr>
			<th>잔 액 : ${buyerVO.money}</th>
		</tr>

	</table>
 --%>	<button type="button" onclick="location.href='pwchange'">비밀번호변경</button>
	<button type="button" onclick="location.href='infochange'">수 정</button>
	<button type="button" onclick="location.href='buyhistory'">구매내역</button>
	<button type="button" onclick="location.href='infodelete'">탈 퇴</button>

</body>
</html>