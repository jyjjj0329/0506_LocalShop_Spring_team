<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/layout/nav.jsp"/>

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
		<c:forEach var="vo" items="${list }">
			<td align="center"><a href="gdsUpdate?idx=${vo.idx }">${vo.name }</a></td>
		</c:forEach>
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
				<a href="sellerList?page=${sellerGdsListVO.currentPage - 3 }">
					[이전]
				</a>
			</c:if>
			<c:if test="${sellerGdsListVO.currentPage > 2}">
				<a href="sellerList?page=${sellerGdsListVO.currentPage - 2 }">
					${sellerGdsListVO.currentPage - 2 }
				</a>
			</c:if>
			<c:if test="${sellerGdsListVO.currentPage > 1}">
				<a href="sellerList?page=${sellerGdsListVO.currentPage - 1 }">
					[${sellerGdsListVO.currentPage - 1 }]
				</a>
			</c:if>
				[${sellerGdsListVO.currentPage}]
			<c:if test="${sellerGdsListVO.currentPage < sellerGdsListVO.totalPage}">
				<a href="sellerList?page=${sellerGdsListVO.currentPage + 1 }">
					[${sellerGdsListVO.currentPage + 1 }]
				</a>
			</c:if>
			<c:if test="${sellerGdsListVO.currentPage + 1 < sellerGdsListVO.totalPage}">
				<a href="sellerList?page=${sellerGdsListVO.currentPage + 2 }">
					[${sellerGdsListVO.currentPage + 2 }]
				</a>
			</c:if>
			<c:if test="${sellerGdsListVO.currentPage + 2 < sellerGdsListVO.totalPage}">
				<a href="sellerList?page=${sellerGdsListVO.currentPage + 3 }">
					[다음]
				</a>
			</c:if>
		</td>
	</tr>
	
</table>
</c:if>

