<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소비자 회원가입</title>
<script type="text/javascript" src="resources/js/buyerWarnings.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function fn_setAddr(){
	daum.postcode.load(function() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
				// 예제를 참고하여 다양한 활용법을 확인해 보세요.
			}
		}).open();
	})
}
</script>
</head>
<body>
	<form method="post">
		<h2 align="center">소비자 회원가입</h2>
		<table align="center">
			<tr>
				<th>이름</th>
				<td><input id="name" type="text"/></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td height="40px">
					<input id="id" type="text"/>
					<input type="submit" value="중복확인" onclick="">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input id="pw" type="text"/></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<input id="pwOK" type="text"/>
				</td>
			</tr>
			<tr>
				<th>별명</th>
				<td>
					<input id="nickname" type="text"/>
					<input type="submit" value="중복확인" onclick="">
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input name="gender" type="radio" value="남"/>남&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="gender" type="radio" value="여"/>여
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input id="phone" type="text"/></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input id="email1" type="text" style="width:80px"/>
					@&nbsp;<input id="email2" type="text" style="width:80px"/>
				</td>
			</tr>
			<tr>
				<th>*전화번호</th>
				<td>
					<select id="mobile">
						<option value="SKT">SKT</option>
						<option value="KT">KT</option>
						<option value="LG">LG</option>
					</select>
					<select id="phonenum1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="019">019</option>
					</select>
					<input name="phonenum" type="text" style="width:40px;"/>
					<input name="phonenum" type="text" style="width:40px;"/>
				</td>
			</tr>
			<tr>
				<th>카드 번호</th>
				<td>
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
					<input type="button" value="주소 검색" onclick="fn_setAddr()"/>
					
					<input id="address" type="text"/>
				</td>
			</tr>
			<tr>
				<td rowspan="2" colspan="2" align="center" style="height:50px">
					<input type="button" value="가입하기" onclick="signUp()"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>