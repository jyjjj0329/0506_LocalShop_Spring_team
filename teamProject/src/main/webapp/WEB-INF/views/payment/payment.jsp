<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>  
<jsp:include page="/WEB-INF/layout/nav.jsp"/>
<script type="text/javascript" src="resources/js/payment.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>	
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<form name="paymentForm" action="paymentOK">
	<div align="center" style="margin: 50px; padding: 20px;">
	<table>
		<tr style="padding: 50px;">
			<th>이름</th>
			<td><input type="text" name="name" style="width: 300px;"/></td>
		</tr>
		<tr>
			<th>핸드폰번호</th>
			<td>
			<select name="phonenum1" style="width: 50px;">
				<option value="SKT">SKT</option>
				<option value="LG">LG</option>
				<option value="KT">KT</option>
			</select>
				<input type="text" name="phonenum2" style="width: 50px;"/> - 
				<input type="text" name="phonenum3"/> - 
				<input type="text" name="phonenum4"/>
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input type="text" id="postcode" name="postcode" placeholder="우편번호" readonly style="width: 100px">
				<input type="button" onclick="addressAPI()" value="우편번호 찾기"><br>
				<input type="text" id="address1" name="address1" placeholder="도로명주소" readonly style="width: 250px;">
				<input type="hidden" id="address2" name="address2" placeholder="지번주소" readonly>
				<input type="text" id="address3" name="address3" placeholder="상세주소">
				<span id="guide" style="color:#999;display:none"></span>
			</td>
		<tr>
		<tr>
			<th colspan="2">
			<input type="button" value="결제하기" name="paymentOK" onclick="payment()"/> 
			<input type="button" value="취소" name="Cancle" onclick="location.href='mainpage'"> 
			</th>
		</tr>
	</table>
	</div>
	<input type="hidden" value="${sellerGdsVO.name }" name="sellName"/>
	<input type="hidden" value="${sellerGdsVO.price }" name="price"/>
	<input type="hidden" value="${sellerGdsVO.idx }" name="sellerGdsVO_idx"/>
	<input type="hidden" value="${num}" name="num"/>
</form>

