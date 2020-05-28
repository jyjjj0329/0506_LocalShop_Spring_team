<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소비자 회원가입</title>
<script type="text/javascript" src="resources/js/buyerUpdate.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<form action="buyerSignUpOK" id="buyerSignUp" method="post" enctype="multipart/fomr-data">
		<h2 align="center">소비자 회원가입</h2>
		<table align="center">
			<tr>
				<th>이름</th>
				<td><input id="name" type="text"/></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td height="40px">
					<input id="id" name="id" type="text"/>
					<input type="submit" value="중복확인" onclick="CheckID()">
					<input type="hidden" name="hidden1" id="hidden1" value="unCheck">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input id="pw" type="password"/></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<input id="pwCheck" type="password"/>
				</td>
			</tr>
			<tr>
				<th>별명</th>
				<td>
					<input id="nickname" type="text"/>
					<input type="submit" value="중복확인" onclick="CheckNickname()">
					<input type="hidden" name="hidden2"	id="hidden2" value="unCheck">
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input name="gender" type="radio" value="true"/>남&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="gender" type="radio" value="false"/>여
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input id="age" type="number"/></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input id="email1" type="text" style="width:80px"/>@&nbsp;
					<input id="email2" type="text" style="width:80px"/>
					<select name="eamil3" id="email3" onchange="emailChange()">
						<option value="직접입력" selected>직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="google.com">google.com</option>
						<option value="daum.net">daum.net</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>*전화번호</th>
				<td>
					<select id="phone">
						<option value="skt">SKT</option>
						<option value="kt">KT</option>
						<option value="lg">LG</option>
					</select>
					<input name="phonenum" type="tel" style="width:90px;"/>
				</td>
			</tr>
			<tr>
				<th>카드 번호</th>
				<td>
					<select id="creditcard">
						<option value="신한">신한</option>
						<option value="KB국민">KB국민</option>
						<option value="하나">하나</option>
						<option value="롯데">롯데</option>
						<option value="BC">BC</option>
						<option value="NH농협">NH농협</option>
						<option value="삼성">삼성</option>
						<option value="현대">현대</option>
					</select>
					<input name="cardNum" type="text" style="width:40px"/>
					<input name="cardNum" type="text" style="width:40px"/>
					<input name="cardNum" type="text" style="width:40px"/>
					<input name="cardNum" type="text" style="width:40px"/>
				</td>
			</tr>
			<tr>
				<th>지역</th>
				<td>
					<select id="area" style="height:20px">
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
					</select>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" id="postcode" name="postcode" placeholder="우편번호" readonly style="width: 100px">
					<input type="button" onclick="addressAPI()" value="우편번호 찾기"><br>
					<input type="text" id="address1" name="address1" placeholder="도로명주소" readonly style="width: 250px;">
					<input type="hidden" id="address2" name="address2" placeholder="지번주소" readonly>
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" id="address3" name="address3" placeholder="상세주소">
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
</body>
</html>