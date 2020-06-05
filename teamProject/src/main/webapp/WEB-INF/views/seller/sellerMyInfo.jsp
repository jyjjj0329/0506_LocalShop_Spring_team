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
<title>판매자 마이페이지</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>${sellerVO.id}님</th>
		</tr>
		<tr>
			<th>이 름 : ${sellerVO.name}</th>
		</tr>
	
		<tr>
			<th><button type="button" onclick="location.href='sellerPwchange'">비밀번호변경</button></th>
		</tr>
		<tr>
			<th>성 별 : <c:if test="${sellerVO.gender == true}">남성</c:if> 
			<c:if test="${sellerVO.gender == false}">여성</c:if>
			</th>
		</tr>
		<tr>
			<th>나 이 : ${sellerVO.age}</th>
		</tr>
		<tr>
			<th>이메일: ${sellerVO.email}</th>
		</tr>
		<tr>
			<th>휴대폰: ${sellerVO.phonenum}</th>
		</tr>
		<tr>
			<th>사업자 등록번호 : ${sellerVO.regnum}</th>
		</tr>
		<tr>
			<th>상호명 : ${sellerVO.store}</th>
		</tr>
		<tr>
			<th>지 역 : ${sellerVO.area}</th>
		</tr>
		<tr>
			<th>주 소 : ${sellerVO.storeaddress}</th>
		</tr>
		

	</table>
	<button type="button" onclick="location.href='sellerInfochange'">수 정</button>
	<button type="button" onclick="location.href='sellerInfodelete'">탈 퇴</button>

</body>
</html>