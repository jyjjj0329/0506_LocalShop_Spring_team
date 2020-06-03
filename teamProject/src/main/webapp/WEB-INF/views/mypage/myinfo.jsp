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
</head>
<body>
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
			<th><button type="button" onclick="location.href='pwchange'">비밀번호변경</button></th>
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
	<button type="button" onclick="location.href='infochange'">수 정</button>
	<button type="button" onclick="location.href='buyhistory'">구매내역</button>
	<button type="button" onclick="location.href='infodelete'">탈 퇴</button>

</body>
</html>