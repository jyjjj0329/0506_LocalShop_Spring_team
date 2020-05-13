<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<!-- Bootstrap CSS -->

<link rel="stylesheet" href="resources/css/style-mainpage.css" />


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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


	<ul class="nav nav-tabs nav-justified">
		<li class="nav-item"><a class="nav-link active tab-color"
			data-toggle="tab" href="#map">지도에서 클릭하여 검색</a></li>
		<li class="nav-item"><a class="nav-link tab-color"
			data-toggle="tab" href="#choice">이름을 선택하여 검색</a></li>
	</ul>
	<!-- 지도부분 -->
	<div class="tab-content">
		<div class="tab-pane fade show active region" id="map">
			<img id="mainMap" name="mainMap" src="resources/map.gif" />
			<form action="category" method="post">
				<!-- 도봉구 --><button type="submit" class="btn btn-lg btn-dobong" name="area" value="도봉"></button>
				<!-- 노원구 --><button type="submit" class="btn btn-lg btn-nowon" name="area" value="노원"></button>
				<!-- 강북구 --><button type="submit" class="btn btn-lg btn-gangbuk" name="area" value="강북"></button>
				<!-- 성북구 --><button type="submit" class="btn btn-lg btn-sungbuk" name="area" value="성북"></button>
				<!-- 은평구 --><button type="submit" class="btn btn-lg btn-eunpyeong" name="area" value="은평"></button>
				<!-- 서대문구 --><button type="submit" class="btn btn-lg btn-seodaemun" name="area" value="서대문"></button>
				<!-- 종로구 --><button type="submit" class="btn btn-lg btn-jongro" name="area" value="종로"></button>
				<!-- 동대문구 --><button type="submit" class="btn btn-lg btn-dongdaemun" name="area" value="동대문"></button>
				<!-- 중랑구 --><button type="submit" class="btn btn-lg btn-jungrang" name="area" value="중랑"></button>
				<!-- 중구 --><button type="submit" class="btn btn-lg btn-jung" name="area" value="중"></button>
				<!-- 마포구 --><button type="submit" class="btn btn-lg btn-mapo" name="area" value="마포"></button>
				<!-- 용산구 --><button type="submit" class="btn btn-lg btn-yongsan" name="area" value="용산"></button>
				<!-- 성동구 --><button type="submit" class="btn btn-lg btn-sungdong" name="area" value="성동"></button>
				<!-- 광진구 --><button type="submit" class="btn btn-lg btn-gwangjin" name="area" value="광진"></button>
				<!-- 강서구--><button type="submit" class="btn btn-lg btn-gangseo" name="area" value="강서"></button>
				<!-- 양천구 --><button type="submit" class="btn btn-lg btn-yangcheon" name="area" value="양천"></button>
				<!-- 구로구 --><button type="submit" class="btn btn-lg btn-guro" name="area" value="구로"></button>
				<!-- 영등포구 --><button type="submit" class="btn btn-lg btn-yeongdeungpo" name="area" value="영등포"></button>
				<!-- 금천구 --><button type="submit" class="btn btn-lg btn-geumcheon" name="area" value="금천"></button>
				<!-- 동작구 --><button type="submit" class="btn btn-lg btn-dongjak" name="area" value="동작"></button>
				<!-- 관악구 --><button type="submit" class="btn btn-lg btn-gwanak" name="area" value="관악"></button>
				<!-- 서초구 --><button type="submit" class="btn btn-lg btn-seocho" name="area" value="서초"></button>
				<!-- 강남구 --><button type="submit" class="btn btn-lg btn-gangnam" name="area" value="강남"></button>
				<!-- 송파구 --><button type="submit" class="btn btn-lg btn-songpa" name="area" value="송파"></button>
				<!-- 강동구 --><button type="submit" class="btn btn-lg btn-gangdong" name="area" value="강동"></button>
			</form>
		</div>

		<div class="tab-pane fade" id="choice" align="center">
			<p>현재 없는 페이지임 이건</p>
		</div>

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