<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% request.setCharacterEncoding("UTF-8"); %>
<link rel="stylesheet" href="resources/css/style-category.css" />
<jsp:include page="/WEB-INF/layout/nav.jsp"/>

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

	<div class="row">
		<div class="areaname">
			<h1>${area}</h1>
			<button type="button" class="btn btn-lg btn-dark back"
				onclick="location.href='mainpage'">변 경</button>
		</div>
		<form action="buyerList?page=1" method="post">
			<input type="hidden" name="area" value="${area }" >
			<div class="categorylist">

				<h1>
					<input type="submit" id="clothes" value="의류" name="category">
				</h1>
				<h1>
					<input type="submit" id="food" value="음식" name="category">
				</h1>
				<h1>
					<input type="submit" id="furniture" value="가구" name="category">
				</h1>
				<h1>
					<input type="submit" id="toy" value="완구" name="category">
				</h1>
				<h1>
					<input type="submit" id="electronic" value="전자제품" name="category">
				</h1>
				<h1>
					<input type="submit" id="traditional" value="전통시장" name="category">
				</h1>
				<h1>
					<input type="submit" id="etc" value="기타" name="category">
				</h1>

			</div>
		</form>

	</div>

</body>

</html>