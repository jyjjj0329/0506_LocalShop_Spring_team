<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 마이페이지</title>
<script type="text/javascript">
	function pwCheck(){
		if(document.getElementById("pw").value == document.getElementById("pwc").value){
			alert("성공")
			
			if (window.opener && !window.opener.closed){
				console.log(window.opener);
				console.log(window.opener.closed);
				window.opener.location.href = "sellerMyInfo";
				
				window.close();
			}
		}
		if(document.getElementById("pw").value != document.getElementById("pwc").value){
		;
			alert("비밀번호가 틀립니다.");
		}
	}
</script>
</head>
<body>

	<c:if test="${sessionScope.seller_id != null }">
		<input type="password" id="pw" name="pw" placeholder="비밀번호를 입력해주세요.">
		
		<input type="hidden" id="pwc" name="pwc" value="${sessionScope.seller_pw}">
		<input type="button" value="확인" onclick="pwCheck()">
	</c:if>
	<c:if test="${sessionScope.seller_id == null }">
		<input type="button" value="뒤로가기" onclick="history.back()" />
		<input type="button" value="로그인" onclick="location.href='login'" />

	</c:if>

</body>
</html>