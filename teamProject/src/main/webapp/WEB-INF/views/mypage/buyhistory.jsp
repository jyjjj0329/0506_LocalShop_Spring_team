<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 내역</title>
<jsp:include page="/WEB-INF/layout/nav.jsp" />
</head>
<body>
<div>
<h2>${sessionScope.buyer_id}님의 구매하신 목록입니다.</h2>
</div>
<c:set var="list" value="${purchaseGdsListVO.purchaseGdsVO}"/>
<c:if test="${list != null}">
<table border="1">
	<tr>
		<th>물품</th>
		<c:forEach var="vo" items="${list}">
			<td><img class="img" alt="" src="resources/image/${vo.image_name}" width="150px" height="150px"></td> 
		</c:forEach>
	</tr>
	<tr>
		<th width="100px" height="30px">물품 이름</th>
		<c:forEach var="vo" items="${list}">
			<td align="center"><a href="gdsInfo?gdsname=${vo.goods_name }">${vo.goods_name }</a></td>
		</c:forEach>
	</tr>
	<tr>
		<th  height="30px">물품 가격</th>
		<c:forEach var="vo" items="${list}">
			<td align="center">${vo.price}원</td>
		</c:forEach>
	</tr>
	<tr>
		<th>물품 분류</th>
		<c:forEach var="vo" items="${list}">
			<td align="right">${vo.category }</td>
		</c:forEach>
	</tr>
	<tr>
		<th>배송 상태</th>
		<c:forEach var="vo" items="${list}">
			<td align="center">${vo.del_status }</td>
		</c:forEach>
	</tr>
	<tr>
		<td colspan="13" align="center">
			<c:if test="${purchaseGdsListVO.currentPage > 3}">
				<a href="buyhistory?page=${purchaseGdsListVO.currentPage - 3 }">
					[이전]
				</a>
			</c:if>
			<c:if test="${purchaseGdsListVO.currentPage > 2}">
				<a href="buyhistory?page=${purchaseGdsListVO.currentPage - 2 }">
					${purchaseGdsListVO.currentPage - 2 }
				</a>
			</c:if>
			<c:if test="${purchaseGdsListVO.currentPage > 1}">
				<a href="buyhistory?page=${purchaseGdsListVO.currentPage - 1 }">
					[${purchaseGdsListVO.currentPage - 1 }]
				</a>
			</c:if>
				[${purchaseGdsListVO.currentPage}]
			<c:if test="${purchaseGdsListVO.currentPage < purchaseGdsListVO.totalPage}">
				<a href="buyhistory?page=${purchaseGdsListVO.currentPage + 1 }">
					[${purchaseGdsListVO.currentPage + 1 }]
				</a>
			</c:if>
			<c:if test="${purchaseGdsListVO.currentPage + 1 < purchaseGdsListVO.totalPage}">
				<a href="buyhistory?page=${purchaseGdsListVO.currentPage + 2 }">
					[${purchaseGdsListVO.currentPage + 2 }]
				</a>
			</c:if>
			<c:if test="${purchaseGdsListVO.currentPage + 2 < purchaseGdsListVO.totalPage}">
				<a href="buyhistory?page=${purchaseGdsListVO.currentPage + 3 }">
					[다음]
				</a>
			</c:if>
		</td>
	</tr>
	
</table>
</c:if>
<c:if test="${list == null}">
<h3>구입 내역이 없습니다.</h3>
</c:if>


</body>
</html>