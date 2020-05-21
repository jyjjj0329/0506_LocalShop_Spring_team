<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 정보 수정</title>
</head>
<body>
	<form action="buyerSignUpOK" name="buyerSignUp" method="post"
		enctype="multipart/form-data">

		<table align="center" border="1">
			<tr>
				<td><h2>${BuyerVO.id}님의 정보변경</h2></td>
			</tr>
			<tr>
				<th>이 름</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="nickname"></td>
			</tr>
			<tr>
				<td>나 이</td>
				<td><input type="text" name="age"></td>
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
				<td>지역구</td>
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
				<td><button type="button" onclick="location.href='addresscg'">주소
						변경</button></td>
			<tr>
				<th>카드 번호</th>
				<td><input id="card" type="text" /></td>
			</tr>


		</table>

	</form>
</body>
</html>