<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>    
<jsp:include page="/WEB-INF/layout/sellerNav.jsp"/>
<script type="text/javascript" src="resources/js/upload.js"></script>

<form action="gdsUpdateResult" name="gdsUpdateForm">
<input type="hidden" value="${sellerGdsVO.idx }" name="idx">
<div align="center">
	<table border="1" style="margin:30px; width: 75%;">
		<tr>
			<th>판매자</th>
			<td>${sellerGdsVO.seller_id }</td>
			<th>물품 이름</th>
			<td>${sellerGdsVO.name }</td>
		</tr>
		<tr>
			<th width="100px">물품 분류</th>
			<td>${sellerGdsVO.category }</td>
			<th width="100px;">물품 원산지</th>
			<td><input type="text" name="origin" value="${sellerGdsVO.origin }"></td>
		</tr>
		<tr>
			<th>물품 가격</th>
			<td><input type="number" name="price" value="${sellerGdsVO.price }"></td>
			<th>물품 수량</th>
			<td><input type="number" name="num" value="${sellerGdsVO.num }"></td>
		</tr>
		<tr>
			<th>물품</th>
			<td ><img class="img" alt="" src="resources/image/${sellerGdsVO.image_name}" align="middle"></td>
			<td colspan="2"><textarea rows="10px" cols="42px" name="content">${sellerGdsVO.content }</textarea></td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<input type="button" value="수정" onclick="gdsUpdate('${sessionScope.pw}')">
				<input type="button" value="삭제" onclick="gdsDelete('${sessionScope.pw}')">
			</td>
		</tr>
	</table>
</div>
</form>

