<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<jsp:include page="/WEB-INF/layout/header.jsp">
	<jsp:param name="title" value="메인페이지!"/>
</jsp:include>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/sellSignUp.js"></script>
<form action="sellerSignUpOK" name="sellerSignUp" method="post" enctype="multipart/form-data">
<table>
	<tr>
		<td>ID</td>
		<td>
			<input type="text" name="id" id="id"/> 
			<input type="button" value="중복확인" onclick="CheckID()"> 
			<input type="hidden" name="hidden" value="unCheck">
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="pw"/></td>
	</tr>
	<tr>
		<td>비밀번호 확인</td>
		<td><input type="password" name="pwCheck"/></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name"/></td>
	</tr>
	<tr>
		<td>성별</td>
		<td>
			<input type="radio" name="gender" value="men">남자
			<input type="radio" name="gender" value="women">여자
		</td>
	</tr>
	<tr>
		<td>나이</td>
		<td><input type="number" name="age"/></td>
	</tr>
	<tr>
		<td>Email</td>
		<td>
			<input type="text" name="email1"/> @ 
			<input type="text" name="email2" id="email2"/>
			<select name="eamil" id="email" onchange="emailChange()">
				<option value="직접입력" selected>직접입력</option>
				<option value="naver.com">naver.com</option>
				<option value="google.com">google.com</option>
				<option value="daum.net">daum.net</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>폰번호</td>
		<td>
			<select name="phone">
				<option value="skt">SKT</option>
				<option value="kt">KT</option>
				<option value="lg">LG</option>
			</select>
			<input type="tel" name="phonenum"/>
		</td>
	</tr>
	<tr>
		<td>사업자 등록번호</td>
		<td><input type="text" name="regnum"/></td>
	</tr>
	<tr>
		<td>가게 지역구</td>
		<td><select name="area">
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
		<td>가게 상호명</td>
		<td><input type="text" name="store"/></td>
	</tr>
	<tr>
		<td>가게 주소</td>
		<td><input type="text" id="postcode" placeholder="우편번호" readonly style="width: 100px">
		<input type="button" onclick="addressAPI()" value="우편번호 찾기"><br>
		<input type="text" id="address1" placeholder="도로명주소" readonly style="width: 250px;">
		<input type="hidden" id="address2" placeholder="지번주소" readonly>
		<span id="guide" style="color:#999;display:none"></span>
		<input type="text" id="address3" placeholder="상세주소"></td>
	</tr>
	<tr>
		<td>가게 사진</td>
		<td>
			<input type="file" id="storeImg"/>
			<div id="addImg"></div>
			<input type="button" value="이미지 추가하기." onclick="addInput()"> 
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center" style="margin-top: 10px">
			<input type="button" value="회원가입" onclick="sellSignUp()"/>
			<input type="reset" value="초기화"/>
			<input type="button" value="뒤로가기" onclick="history.back()"/>
		</td> 
	</tr>
</table>
</form>

<jsp:include page="/WEB-INF/layout/footer.jsp"/>