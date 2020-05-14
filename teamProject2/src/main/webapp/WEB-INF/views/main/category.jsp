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

</body>

</html>