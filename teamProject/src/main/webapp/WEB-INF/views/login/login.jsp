<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/layout/nav.jsp"></jsp:include>
<div class="tab_wrap">
	<div class="tab_menu_container">
		<button class="tab_menu_btn on tab_teduri" type="button">소비자</button>
		<button class="tab_menu_btn tab_teduri" type="button">판매자</button>
	</div>
	<!-- tab_menu_container e -->

	<div class="tab_box_container">
		<form action="buyerLoginResult" name="buyerForm" method="post">
			<div class="tab_box on">
				<table class="table_vis">
					<tr>
						<td><input type="text" name="id" class="inputcss"
							placeholder="아이디"></td>
					</tr>
					<tr>
						<td><input type="password" name="pw" class="inputcss"
							placeholder="비밀번호"></td>
					</tr>
					<tr>
						<td>
						<input type="button" class="btnlogin" value="로그인 >>" onclick="buyer()"> 
						</td>
					</tr>
				</table>
			</div>
		</form>
		<form action="sellerLoginResult" name="sellerForm" method="post">
			<div class="tab_box">
				<table class="table_vis">
					<tr>
						<td><input type="text" name="id" class="input inputcss"
							placeholder="아이디"></td>
					</tr>
					<tr>
						<td><input type="password" name="pw" class="inputcss"
							placeholder="비밀번호"></td>
					</tr>
					<tr>
						<td><input type="button" class="btnlogin" value="로그인 >>"
							onclick="seller()"></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	<!-- tab_box_container e -->
</div>
<!-- tab_wrap e -->
</body>
<script>
	$('.tab_menu_btn').on('click', function() {
		//버튼 색 제거,추가
		$('.tab_menu_btn').removeClass('on');
		$(this).addClass('on')

		//컨텐츠 제거 후 인덱스에 맞는 컨텐츠 노출
		var idx = $('.tab_menu_btn').index(this);

		$('.tab_box').hide();
		$('.tab_box').eq(idx).show();
	});
</script>
</html>

