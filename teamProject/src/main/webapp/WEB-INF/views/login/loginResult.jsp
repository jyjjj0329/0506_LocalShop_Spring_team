<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="resources/js/sellSignUp.js"></script>

<c:if test="${sellerResult == 1 }">
	<body onload="sucSeller('${sessionScope.seller_id}')">
</c:if>
<c:if test="${sellerResult != 1 }">
	<c:if test="${buyerResult == 1 }">
		<body onload="sucBuyer('${sessionScope.buyer_id}')">
	</c:if>
	<c:if test="${buyerResult != 1 }">
		<body onload="fail()">
	</c:if>
</c:if>
