<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="resources/js/buySignUp.js"></script>
</head>
<body>
	<form action="buyerSignUpOK" name="buyerSignUp" method="post"
		enctype="multipart/form-data">
		<table align="center">
			<tr>
				<td>ID</td>
				<td><input type="text" name="id" id="id" /> <input
					type="button" value="중복확인" onclick="CheckID()"> <input
					type="hidden" name="hidden" id="hidden" value="unCheck"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw" /></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="pwCheck" /></td>
			</tr>
			<tr>
				<td>이  름</td>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input type="text" name="nickname" /></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><label><input type="radio" name="gender"
						value="true">남자</label> <label><input type="radio"
						name="gender" value="false">여자</label></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="number" name="age" /></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email1" /> @ <input type="text"
					name="email2" id="email2" /> <select name="eamil3" id="email3"
					onchange="emailChange()">
						<option value="직접입력" selected>직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="google.com">google.com</option>
						<option value="daum.net">daum.net</option>
				</select></td>
			</tr>
			<tr>
				<th>휴대폰번호</th>
				<td><select name="phone">
						<option value="skt">SKT</option>
						<option value="kt">KT</option>
						<option value="lg">LG</option>
				</select> <input type="tel" name="phonenum" /></td>
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
				<th>주소</th>
				<td><input type="text" id="postcode" name="postcode"
					placeholder="우편번호" readonly style="width: 100px"> <input
					type="button" onclick="addressAPI()" value="우편번호 찾기"><br>
					<input type="text" id="address1" name="address1"
					placeholder="도로명주소" readonly style="width: 250px;"> <input
					type="hidden" id="address2" name="address2" placeholder="지번주소"
					readonly> <span id="guide"
					style="color: #999; display: none"></span> <input type="text"
					id="address3" name="address3" placeholder="상세주소"></td>
			</tr>
			<tr>
				<th>카드 번호</th>
				<td><input id="card" type="text" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center" style="margin-top: 10px">
			<input type="button" value="회원가입" onclick="buySignUp()"/>
			<input type="reset" value="초기화"/>
			<input type="button" value="뒤로가기" onclick="history.back()"/>
		</td>
			</tr>
		</table>
	</form>
</body>
</html>