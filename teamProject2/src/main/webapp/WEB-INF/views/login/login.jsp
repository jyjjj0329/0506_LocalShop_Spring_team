<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>    
<jsp:include page="/WEB-INF/layout/nav.jsp"/>

<form action="loginResult" method="post">
	<table>
		<tr>
			<th>로그인</th>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pw"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="로그인">
				<input type="button" value="뒤로가기" onclick="history.back()">
			</td>
		</tr>
	</table>
</form>

<%-- <jsp:include page="/WEB-INF/layout/footer.jsp"/> --%>