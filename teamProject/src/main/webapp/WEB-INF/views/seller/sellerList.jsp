<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type ="text/css" href="resources/css/layout.css">
<c:if test="${seller_id != null }">
	<jsp:include page="/WEB-INF/layout/sellerNav.jsp"/>
</c:if>
<c:if test="${seller_id == null }">
	<jsp:include page="/WEB-INF/layout/nav.jsp"/>
</c:if>

<c:set var="list" value="${sellerGdsListVO.sellerGdsVO}"/>
<caption><h2>판매목록</h2></caption>
<!-- 들어있는 갯수만큼 table로 뽑아온다. 5개 이상이면 paging을 만들자. -->
<c:if test="${list.size() == 0}">
	<h1>판매 물품이없습니다.</h1>
</c:if>
<c:if test="${list.size() != 0 }">
<table border="1">
	<tr>
		<th>물품</th>
		<c:forEach var="vo" items="${list}">
			<td><img class="img" alt="" src="resources/image/${vo.image_name}"></td>
		</c:forEach>
	</tr>
	<tr>
		<th width="100px" height="30px">물품 이름</th>
		<c:if test="${seller_id != null }">
		<c:forEach var="vo" items="${list }">
			<td align="center"><a href="gdsUpdate?idx=${vo.idx }">${vo.name }</a></td>
		</c:forEach>
		</c:if>
	</tr>
	<tr>
		<th  height="30px">물품 가격</th>
		<c:forEach var="vo" items="${list }">
			<td align="center">${vo.price }원</td>
		</c:forEach>
	</tr>
	<tr>
		<th  height="30px">물품 원산지</th>
		<c:forEach var="vo" items="${list }">
			<td  align="center">${vo.origin }</td>
		</c:forEach>
	</tr>
	<tr>
		<th>물품 분류</th>
		<c:forEach var="vo" items="${list }">
			<td align="center">${vo.category }</td>
		</c:forEach>
	</tr> 
	<tr>
		<td colspan="5" align="center">
			<c:if test="${sellerGdsListVO.currentPage > 3}">
			<c:if test="${seller_id != null }">
				<a href="sellerList?page=${sellerGdsListVO.currentPage - 3 }">
			</c:if>
			<c:if test="${seller_id == null }">
				<a href="buyerList?page=${sellerGdsListVO.currentPage - 3 }&area=${area}&category=${category}">
			</c:if>
					[이전]
				</a>
			</c:if>
			<c:if test="${sellerGdsListVO.currentPage > 2}">
			<c:if test="${seller_id != null }">
				<a href="sellerList?page=${sellerGdsListVO.currentPage - 2 }">
			</c:if>
			<c:if test="${seller_id == null }">
				<a href="buyerList?page=${sellerGdsListVO.currentPage - 2 }&area=${area}&category=${category}">
			</c:if>
					${sellerGdsListVO.currentPage - 2 }
				</a>
			</c:if>
			<c:if test="${sellerGdsListVO.currentPage > 1}">
			<c:if test="${seller_id != null }">
				<a href="sellerList?page=${sellerGdsListVO.currentPage - 1 }">
			</c:if>
			<c:if test="${seller_id == null }">
				<a href="buyerList?page=${sellerGdsListVO.currentPage - 1 }&area=${area}&category=${category}">
			</c:if>
					[${sellerGdsListVO.currentPage - 1 }]
				</a>
			</c:if>
				[${sellerGdsListVO.currentPage}]
			<c:if test="${sellerGdsListVO.currentPage < sellerGdsListVO.totalPage}">
			<c:if test="${seller_id != null }">
				<a href="sellerList?page=${sellerGdsListVO.currentPage + 1 }">
			</c:if>
			<c:if test="${seller_id == null }">
				<a href="buyerList?page=${sellerGdsListVO.currentPage + 1 }&area=${area}&category=${category}">
			</c:if>
					[${sellerGdsListVO.currentPage + 1 }]
				</a>
			</c:if>
			<c:if test="${sellerGdsListVO.currentPage + 1 < sellerGdsListVO.totalPage}">
			<c:if test="${seller_id != null }">
				<a href="sellerList?page=${sellerGdsListVO.currentPage + 2 }">
			</c:if>
			<c:if test="${seller_id == null }">
				<a href="buyerList?page=${sellerGdsListVO.currentPage + 2 }&area=${area}&category=${category}">
			</c:if>
					[${sellerGdsListVO.currentPage + 2 }]
				</a>
			</c:if>
			<c:if test="${sellerGdsListVO.currentPage + 2 < sellerGdsListVO.totalPage}">
			<c:if test="${seller_id != null }">
				<a href="sellerList?page=${sellerGdsListVO.currentPage + 3 }">
			</c:if>
			<c:if test="${seller_id == null }">
				<a href="buyerList?page=${sellerGdsListVO.currentPage + 3 }&area=${area}&category=${category}">
			</c:if>
					[다음]
				</a>
			</c:if>
		</td>
	</tr>
	
</table>
</c:if>

