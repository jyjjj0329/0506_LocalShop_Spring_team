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

	<c:if test="${ sessionScope.seller_id != null }">
		<form action="myinfo" method="post">
			비밀번호를 입력해주세요: <input type="password" name="pw" /> <input
				type="submit" value="확인"/>
		</form>
	</c:if>
	<c:if test="${sessionScope.seller_id == null }">
		<input type="button" value="뒤로가기" onclick="history.back()" />
		<input type="button" value="로그인" onclick="location.href='login'" />

	</c:if>

</body>
</html>