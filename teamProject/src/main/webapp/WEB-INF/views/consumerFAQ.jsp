<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/layout/nav.jsp"/>
<style type="text/css">
	main_menu > li { width: 300px; }
	.sub_menu1 { cursor: pointer; }
	.sub_menu2 { display: none; }
</style>
<title>고객센터</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="resources/js/sendMessage.js"></script>
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
<script src="resources/js/kakao.js"></script>
<script>
    // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('476ddd4a6edb38d6f43f4012e8681c66');

    // SDK 초기화 여부를 판단합니다.
    console.log(Kakao.isInitialized());
</script>
</head>
<body>
	<h2>자주 묻는 질문</h2>
	
	<h3>1. 소비자 FAQ</h3>
	<ul type="square" class="main_menu">
		<li class="sub_menu1">
			<b>1. 배송 완료가 떴는데 물품이 도착하지 않았어요.</b>
			<ul type="disc" class="sub_menu2">
				<li>답변 1</li>
			</ul>
		</li>
		
		<li class="sub_menu1">
			<b>2. 구매한 물품을 교환 또는 환불하고 싶어요.</b>
			<ul type="disc" class="sub_menu2">
				<li>답변 2</li>
			</ul>
		</li>
		
		<li class="sub_menu1">
			<b>3. 물품 구매 시 결제 창이 뜨지 않아요.</b>
			<ul type="disc" class="sub_menu2">
				<li>답변 3</li>
			</ul>
		</li>
	</ul>
	
	<h3>2. 판매자 FAQ</h3>
	<ul type="square" class="main_menu">
		<li class="sub_menu1">
			<b>1. 물품 이미지 등록이 되지 않아요.</b>
			<ul type="disc" class="sub_menu2">
				<li>답변 1</li>
			</ul>
		</li>
		
		<li class="sub_menu1">
			<b>2. 가게 위치, 사업자 등록번호 등 정보를 수정하고 싶어요.</b>
			<ul type="disc" class="sub_menu2">
				<li>답변 2</li>
			</ul>
		</li>
	</ul>
	
	<h3>3. 기타 FAQ</h3>
	<ul type="square" class="main_menu">
		<li class="sub_menu1">
			<b>1. 회원 탈퇴를 하고 싶어요.</b>
			<ul type="disc" class="sub_menu2">
				<li>답변 1</li>
			</ul>
		</li>
		
		<li class="sub_menu1">
			<b>2. 질문 2</b>
			<ul type="disc" class="sub_menu2">
				<li>답변 2</li>
			</ul>
		</li>
		
		<li class="sub_menu1">
			<b>3. 질문 3</b>
			<ul type="disc" class="sub_menu2">
				<li>답변 3</li>
			</ul>
		</li>
	</ul>
	
	<br/>
	<h5>찾으시는 질문이 없으신가요?</h5><br/>
	1대 1 문의하기<br/>
	<a onclick="window.open('https://open.kakao.com/o/stRP7dcc','NewWindow','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,copyhistory=no,width=550,height=800')">
		<img src="resources/image/kakaotalk_icon.png" width="73" height="73">
	</a>
	<a onclick="window.open('https://www.instagram.com/accounts/login/?hl=ko','NewWindow','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,copyhistory=no,width=550,height=800')">
		<img src="resources/image/instagram_icon.png" width="100" height="100" >
	</a>
</body>
</html>