<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닉네임 중복체크</title>
</head>
<script type="text/javascript" src="resources/js/buySignUp.js"></script>
<body>

	<c:choose>
		<c:when test="${result == 1}">
			<input type="text" id="nickname" />
			<input type="button" value="중복확인" onclick="CheckNickname2()">
			<h4>이미 존재하는 닉네임입니다. 다른 닉네임을 입력해주세요.</h4>
		</c:when>
		<c:otherwise>
			<input type="text" value="${nickname}" readonly>
			<input type="button" value="사용" onclick="Nicknameok('${nickname}')">
			<input type="button" value="취소" onclick="window.close()">
			<h4>사용 가능한 닉네임입니다</h4>
		</c:otherwise>
	</c:choose>

</body>
</html>