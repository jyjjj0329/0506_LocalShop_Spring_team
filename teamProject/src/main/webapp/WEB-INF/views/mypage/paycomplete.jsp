<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div style="text-align: center;">
		<h1>충전 완료</h1>
		
		<input type="button" value="창닫기" onclick="closethis()"/>
		
		<input type="button" value="구매하러 가기" onclick="movethis()"/>
		
	</div>

<script type="text/javascript">
	function closethis() {
		 if (window.opener && !window.opener.closed) {
			 window.opener.location.reload();
			window.close();
		}
	}	 
	function movethis(){
		 if (window.opener && !window.opener.closed) {
			window.opener.location = "category"; 
			window.close();
		 }
	}
</script>
</body>
</html>