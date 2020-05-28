<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>    
<%@ page session="false" %>
<jsp:include page="/WEB-INF/layout/header.jsp">
	<jsp:param name="title" value="메인페이지!"/>
</jsp:include>

<!-- 본문 부분 -->
<h2> Welcome! </h2>
<h3> 나의 홈페이지! </h3>
<h5> 이곳은 메인페이지입니다.</h5>




<jsp:include page="/WEB-INF/layout/footer.jsp"/>