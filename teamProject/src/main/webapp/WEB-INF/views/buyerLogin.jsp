<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/buyerWarnings.js"></script>
<script type="text/javascript" src="resources/js/buyerResults.js"></script>
</head>
<body>
	<form method="post">
		<h2 align="center">일반 회원가입(14세 이상)</h2>
		<table align="center">
			<tr>
				<th>이름</th>
				<td><input id="name" type="text"/></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td height="40px">
					<input id="id" type="text"/>
					<input type="submit" value="중복확인" onclick="popup1()">
				</td>
			</tr>
			<tr>
				<th>비밀번호 </th>
				<td><input id="password" type="text"/></td>
			</tr>
			<tr>
				<th>비밀번호 확인 </th>
				<td>
					<input id="passwordOK" type="text"/>
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input id="phone" type="text"/></td>
			</tr>
			<tr>
				<th>*전화번호</th>
				<td>
					<select>
						<option>SKT</option>
						<option>KT</option>
						<option>LG</option>
					</select>
					<select>
						<option>010</option>
						<option>011</option>
						<option>016</option>
						<option>017</option>
						<option>019</option>
					</select>
					<input id="phone1" type="text" style="width:40px;"/>
					<input id="phone2" type="text" style="width:40px;"/>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input id="email1" type="text" style="width:80px"/>
					@&nbsp;<input id="email2" type="text" style="width:80px"/>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input id="address" type="text"/></td>
			</tr>
			<tr>
				<th>카드 번호</th>
				<td><input id="card" type="text"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="가입하기" onclick="name2()"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>