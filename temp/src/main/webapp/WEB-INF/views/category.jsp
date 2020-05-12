<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<title>분류</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/style-category.css" />
<!-- Bootstrap CSS -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

	$(function() {
		// 전체선택 체크박스 체크된 상태 일 경우
		$("#all").click(function() {
			if ($("#all").prop("checked")) {
				$("input[type=checkbox]").prop("checked", true);
				// 해제된 경우
			} else {
				$("input[type=checkbox]").prop("checked", false);
			}
		})
	})

</script>
</head>
<body>
	<!--상단 네비게이션 바-->
	<div id="navbar">
		<nav class="navbar bg-dark navbar-dark">
			<!-- Brand -->
			<b><a class="navbar-brand" href="mainpage">지역 화폐</a></b>

			<!-- Dropdown -->
			<div class="btn-group dropdown navbar-right">
				<a class="btn dropdown-toggle" href="#" data-toggle="dropdown">
					<span class="navbar-toggler-icon"></span>
				</a>
				<ul class="dropdown-menu dropdown-menu-right">
					<li><a class="dropdown-item" href="mypage">마이페이지</a></li>
					<li><a class="dropdown-item" href="cs">고객지원</a></li>
					<li><a class="dropdown-item" href="login" target="_blank">로그인</a></li>
				</ul>
			</div>
		</nav>
	</div>

	<div class="row">
		<div class="areaname">
			<h1>${area}구</h1>
			<button type="button" class="btn btn-lg btn-dark back"
				onclick="location.href='mainpage'">변 경</button>
		</div>
		<form action="list" method="post">
			<input type="hidden" name="area" value="${area }" >
			<div class="categorylist">

				<h1>
					<input type="checkbox" id="clothes" value="clothes" name="category">
					<label for="clothes" class="categoryname">의 류</label>
				</h1>
				<h1>
					<input type="checkbox" id="food" value="food" name="category">
					<label for="food" class="categoryname">음 식</label>
				</h1>
				<h1>
					<input type="checkbox" id="furniture" value="furniture" name="category">
					<label for="furniture" class="categoryname">가 구</label>
				</h1>
				<h1>
					<input type="checkbox" id="toy" value="toy" name="category">
					<label for="toy" class="categoryname">완 구</label>
				</h1>
				<h1>
					<input type="checkbox" id="electronic" value="electronic" name="category">
					<label for="electronic" class="categoryname">전자 제품</label>
				</h1>
				<h1>
					<input type="checkbox" id="traditional" value="traitional" name="category">
					<label for="traditional" class="categoryname">전통 시장</label>
				</h1>
				<h1>
					<input type="checkbox" id="etc" value="etc" name="category">
					<label for="etc" class="categoryname">기 타</label>
				</h1>
				<h1>
					<input type="checkbox" id="all" value="all">
					<label for="all" class="categoryall">전 체</label>
				</h1>

			</div>

			<button type="submit" class="btn btn-lg btn-dark btn-ok" value="전송">보기</button>
			<button type="reset" class="btn btn-lg btn-dark btn-ok" value="리셋">리셋</button>
		</form>

	</div>


	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>

</html>