<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/layout/nav.jsp"/>
<link type="text/css" href="resources/css/style-consumerFAQ.css" rel="stylesheet"/>
<title>고객센터</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("b").click(function() {
	//		1. 단순히 메뉴만 열리게 할 때
	//		$(this).next().show();
	//		2. 클릭하면 메뉴가 열리고 다시 클릭하면 메뉴가 닫히게 할 때
			$(this).next().slideToggle();
	//		3. 클릭하면 메뉴가 열리고 기존에 열려있던 다른 메뉴는 닫히게 할 때
	//		$(this).next().slideDown();
	//		$(this).parent().siblings().find("ul").slideUp();
	//		위의 2줄을 1줄로 표현하면 아래와 같이 사용할 수 있다.
	//		$(this).next().slideDown().end().parent().siblings().find("ul").slideUp();
		})
	});
</script>
</head>
<body>
<div class="container" id="container">
	<!-- FAQ 탭 버튼  -->
	<ul class="nav nav-tabs" >
		<li class="nav-item" >
			<a class="nav-link active" data-toggle="tab" href="#consumerFAQ" >소비자 FAQ</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" data-toggle="tab" href="#sellerFAQ">판매자 FAQ</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" data-toggle="tab" href="#etcFAQ">기타 FAQ</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" data-toggle="tab" href="#indivFAQ">일대일 문의</a>
		</li>
	</ul>
	<!-- 탭 버튼 누를 시 출력되는 내용 -->
	<div class="tab-content" >
		<!-- 소비자 FAQ -->
		<div class="tab-pane fade show active" id="consumerFAQ">
			<ul type="square" class="main_menu">
				<li class="sub_menu1"><b>1. 배송 완료가 떴는데 물품이 도착하지 않았어요.</b>
					<ul type="disc" class="sub_menu2">
						<li>답변 1</li>
					</ul></li>
				<li class="sub_menu1"><b>2. 구매한 물품을 교환 또는 환불하고 싶어요.</b>
					<ul type="disc" class="sub_menu2">
						<li>답변 2</li>
					</ul></li>
				<li class="sub_menu1"><b>3. 물품 구매 시 결제 창이 뜨지 않아요.</b>
					<ul type="disc" class="sub_menu2">
						<li>답변 3</li>
					</ul></li>
			</ul>
		</div>
		<!-- 판매자 FAQ -->
		<div class="tab-pane fade" id="sellerFAQ">
			<ul type="square" class="main_menu">
				<li class="sub_menu1"><b>1. 물품 이미지 등록이 되지 않아요.</b>
					<ul type="disc" class="sub_menu2">
						<li>답변 1</li>
					</ul></li>

				<li class="sub_menu1"><b>2. 가게 위치, 사업자 등록번호 등 정보를 수정하고
						싶어요.</b>
					<ul type="disc" class="sub_menu2">
						<li>답변 2</li>
					</ul></li>
			</ul>
		</div>
		<!-- 기타 FAQ -->
		<div class="tab-pane fade" id="etcFAQ">
			<ul type="square" class="main_menu">
				<li class="sub_menu1"><b>1. 회원 탈퇴를 하고 싶어요.</b>
					<ul type="disc" class="sub_menu2">
						<li>답변 1</li>
					</ul></li>

				<li class="sub_menu1"><b>2. 질문 2</b>
					<ul type="disc" class="sub_menu2">
						<li>답변 2</li>
					</ul></li>

				<li class="sub_menu1"><b>3. 질문 3</b>
					<ul type="disc" class="sub_menu2">
						<li>답변 3</li>
					</ul></li>
			</ul>
		</div>
		<!-- 일대일 문의 -->
		<div class="tab-pane fade" id="indivFAQ">
			<a onclick="window.open('https://open.kakao.com/o/stRP7dcc','NewWindow','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,copyhistory=no,width=550,height=800')">
				<img class="img" src="resources/image/kakaotalk_icon.png" width="73" height="73">
			</a>
			<a onclick="window.open('https://www.instagram.com/accounts/login/?hl=ko','NewWindow','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,copyhistory=no,width=550,height=800')">
				<img class="img" src="resources/image/instagram_icon.png" width="100" height="100" >
			</a>
		</div>
	</div>
</div>	
		
</body>
</html>