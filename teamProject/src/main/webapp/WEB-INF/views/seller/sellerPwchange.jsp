<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>

<body>
<form action="sellerPwchk" method="post" name="pwchk">
<h2>현재 비밀번호를 입력하세요~~</h2>
<input type="hidden" name="bpwchk" value="${sessionScope.seller_pw}"/>
<input type="password" name="beforepw"/>
<h2>바꾸고자 하는 비밀번호를 입력하시오!</h2>
<input type="password" name="afterpw"/>
<h2>바꾸고자 하는 비밀번호를 한번 더 입력하시오</h2>
<input type="password" name="afterpwchk"/>
<br/>
<input type="button" value="비밀번호변경" onclick="pwc()"/>
</form>

</body>

<script type="text/javascript">
	function pwc() {
		
		var bpw = pwchk.beforepw.value.trim();
		var pw = pwchk.afterpw.value.trim();
		var pwCheck = pwchk.afterpwchk.value.trim();
		var bpwchk = pwchk.bpwchk.value.trim();
		
		if(bpw == ""){
			alert("현재 비밀번호를 입력하시오.");
		}else if(bpw != bpwchk){
			alert("현재 비밀번호가 틀립니다.");
		}else if(pw == ""){
			alert("바꿀 비밀번호를 입력해주세요.");
		}else if(!/^[A-Za-z0-9]{6,12}$/.test(pw)){
			alert("비밀번호는 영대,소문자, 숫자를 포함한 6 ~ 12자사이만 가능합니다.");
		}else if(pw == bpw){
			alert("전에 쓰던 비밀번호와는 다르게 해주시길 바랍니다.")
		}else if(!pw == pwCheck){
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		}else{
			alert("비밀번호가 변경되었습니다.");
			alert("다시 로그인 해주시길 바랍니다.");
			
			
			pwchk.submit();
						
		}
	}

</script>
</html>