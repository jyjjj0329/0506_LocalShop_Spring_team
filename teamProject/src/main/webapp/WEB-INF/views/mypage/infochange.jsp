<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 정보 수정</title>
<jsp:include page="/WEB-INF/layout/nav.jsp" />
<script type="text/javascript" src="resources/js/buyerUpdate.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<form action="infochangeOK" name="infochangeOK" method="post"
		enctype="multipart/form-data">

		<table align="center" border="1">
			<tr>
				<th><h2>${sessionScope.buyer_id}님의정보변경</h2></th>
			</tr>
			<tr>
				<th>이 름</th>
				<td><input type="text" name="name" value="${buyerVO.name}"
					onclick="this.value='';"
					onblur="if (this.value == '') {this.value = '${buyerVO.name}';}"></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="nickname"
					value="${buyerVO.nickname}" onclick="this.value='';"
					onblur="if (this.value == '') {this.value = '${buyerVO.nickname}';}">
					<input type="button" value="중복확인" onclick="CheckNickname()">
					<input type="hidden" name="hidden2"	id="hidden2" value="unCheck">
					</td>
			</tr>
			<tr>
				<td>성 별</td>
				<td>
				<c:if test="${buyerVO.gender == true}">남성</c:if>
				<c:if test="${buyerVO.gender == false}">여성</c:if>
				</td>
			</tr>
			<tr>
				<td>나 이</td>
				<td><input type="number" name="age" min="1" max="150" required="required"
					value="${buyerVO.age}" ></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
				<input id="email1" name="email1" type="text" style="width:80px" value="${buyerVO.email.split('@')[0]}" onclick="this.value='';"/>@&nbsp;
					<input id="email2" name="email2" type="text" style="width:80px" value="${buyerVO.email.split('@')[1]}" onclick="this.value='';"/>
					<select name="eamil3" id="email3" onchange="emailChange()">
						<option value="직접입력" selected>직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="google.com">google.com</option>
						<option value="daum.net">daum.net</option>
					</select></td>
			</tr>
			<tr>
				<th>휴대폰번호</th>
				<td><select name="carrier">
						<option value="${buyerVO.carrier}" selected>${buyerVO.carrier}</option>
						<option value="skt">SKT</option>
						<option value="kt">KT</option>
						<option value="lg">LG</option>
				</select> <input type="tel" name="phonenum" value="${buyerVO.phonenum}"
					onclick="this.value='';" placeholder="xxx-xxxx-xxxx"
					onblur="if (this.value == '') {this.value = '${buyerVO.phonenum}';}"
					maxlength="13" /></td>
			</tr>
			<tr>
				<td>지역구</td>
				<td><select name="area">
						<option value="${buyerVO.area}" selected="selected">${buyerVO.area}</option>
						<option value="강남구">강남구</option>
						<option value="강동구">강동구</option>
						<option value="강북구">강북구</option>
						<option value="강서구">강서구</option>
						<option value="관악구">관악구</option>
						<option value="광진구">광진구</option>
						<option value="구로구">구로구</option>
						<option value="금천구">금천구</option>
						<option value="노원구">노원구</option>
						<option value="도봉구">도봉구</option>
						<option value="동대문구">동대문구</option>
						<option value="동작구">동작구</option>
						<option value="마포구">마포구</option>
						<option value="서대문구">서대문구</option>
						<option value="서초구">서초구</option>
						<option value="성동구">성동구</option>
						<option value="성북구">성북구</option>
						<option value="송파구">송파구</option>
						<option value="양천구">양천구</option>
						<option value="영등포구">영등포구</option>
						<option value="용산구">용산구</option>
						<option value="은평구">은평구</option>
						<option value="종로구">종로구</option>
						<option value="중구">중구</option>
						<option value="중랑구">중랑구</option>
				</select></td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					기존 주소: ${buyerVO.address}<br/>
					<input type="text" id="postcode" name="postcode" placeholder="우편번호" readonly style="width: 100px">
					<input type="button" onclick="addressAPI()" value="우편번호 찾기"><br>
					<input type="text" id="address1" name="address1" placeholder="도로명주소" readonly style="width: 250px;">
					<input type="hidden" id="address2" name="address2" placeholder="지번주소" readonly>
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" id="address3" name="address3" placeholder="상세주소">
					
					
										
					
				</td>
			</tr>
			<tr>
				<th>카드 번호</th>
				<td><select name="creditcard">
						<option value="${buyerVO.creditcard }" selected>${buyerVO.creditcard }</option>
						<option value="신한">신한</option>
						<option value="KB국민">KB국민</option>
						<option value="하나">하나</option>
						<option value="롯데">롯데</option>
						<option value="BC">BC</option>
						<option value="NH농협">NH농협</option>
						<option value="삼성">삼성</option>
						<option value="현대">현대</option>
				</select> <input name="cardNum" type="text" value="${buyerVO.cardNum}" placeholder="16자리의 카드 번호"
					onclick="this.value='';"
					onblur="if (this.value == '') {this.value = '${buyerVO.cardNum}';}" /></td>
			</tr>
			<tr>
				<th><input type="button" value="수정하기" onclick="infochange()"/>
				<input type="reset" value="초기화"/></th>
			</tr>
		</table>

	</form>
</body>
</html>