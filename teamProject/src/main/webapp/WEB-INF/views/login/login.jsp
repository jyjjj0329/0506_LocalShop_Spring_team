<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/layout/nav.jsp"></jsp:include>
<div class="tab_wrap">
  <div class="tab_menu_container">
    <button class="tab_menu_btn on" type="button">소비자</button>
    <button class="tab_menu_btn" type="button">판매자</button>
  </div> <!-- tab_menu_container e -->

  <div class="tab_box_container">
    <form action="buyerLoginResult" name="buyerForm" method="post">
    <div class="tab_box on">
		<table>
		<tr align="center">
			<th>아이디</th>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pw"></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="button" value="로그인" onclick="buyer()">
				<input type="button" value="뒤로가기" onclick="history.back()">
				</td>
			</tr>
		</table>
    	</div>
		</form>
    <form action="sellerLoginResult" name="sellerForm" method="post">
    <div class="tab_box">
		<table>
			<tr align="center">
				<th>아이디</th>
				<td><input type="text" name="id" class="input"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pw"></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="button" value="로그인" onclick="seller()">
				<input type="button" value="뒤로가기" onclick="history.back()">
				</td>
			</tr>
		</table>
    </div>
	</form>
  </div> <!-- tab_box_container e -->
</div> <!-- tab_wrap e -->
</body>
<script>
$('.tab_menu_btn').on('click',function(){
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

