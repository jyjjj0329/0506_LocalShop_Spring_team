<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>  
<jsp:include page="/WEB-INF/layout/sellerNav.jsp"/>

<c:set var="list" value="${goodsSoldList.goodsSoldVO}"/>
<c:if test="${list.size() == 0}">
	<h1>판매된 물품이 없습니다.</h1>
</c:if>
<c:if test="${list.size() != 0}">
	<h1>있습니다.</h1>
</c:if>

<jsp:include page="/WEB-INF/layout/sellerFooter.jsp"/>
