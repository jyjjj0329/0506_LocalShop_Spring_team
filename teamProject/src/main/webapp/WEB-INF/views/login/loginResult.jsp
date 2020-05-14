<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/layout/header.jsp">
	<jsp:param name="title" value="메인페이지!"/>
</jsp:include>

<c:if test="${result == 1 }">
	<h2>${sessionScope.id }님 환영합니다.</h2>
</c:if>
<c:if test="${result != 1 }">
	<h2>로그인에 실패하셨습니다.</h2>
	<input type="button" value="뒤로가기" onclick="history.back()">
</c:if>
<jsp:include page="/WEB-INF/layout/footer.jsp"/>