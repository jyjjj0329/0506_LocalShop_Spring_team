<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>    
<jsp:include page="/WEB-INF/layout/sellerNav.jsp"/>

<script type="text/javascript" src="resources/js/upload.js"></script>

<form action="sellerInsertOK" name="uploadForm" method="post" enctype="multipart/form-data">
<div align="center">
<table border="1">
	<tr><th colspan="2">*표시는 필수 입력 사항입니다.</th></tr>
	<tr>
		<th>물품 이름*</th>
		<td><input type="text" name="name" style="width:347px;"></td>
	</tr>
	<tr>
		<th>물품 가격*</th>
		<td><input type="text" name="price" style="width:347px;"></td>
	</tr>
	<tr>
		<th>물품 수량</th>
		<td><input type="text" name="num" style="width:347px;"></td>
	</tr>
	<tr>
		<th>물품 분류</th>
		<td><select name="category">
			<option value="음식">음식</option>
			<option value="의류">의류</option>
			<option value="가구">가구</option>
			<option value="완구">완구</option>
			<option value="전자제품">전자제품</option>
			<option value="기타">기타</option>
		</select> </td>
	</tr>
	<tr>
		<th>물품 원산지*</th>
		<td><input type="text" name="origin" style="width:347px;"></td>
	</tr>
	<tr>
		<th>물품 설명*</th>
		<td><textarea rows="13" cols="50" name="content"></textarea></td>
	</tr>
	<tr>
		<th>물품 사진</th>
		<td><input type="file" name="file"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="button" value="뒤로" onclick="history.back()">
			<input type="button" value="업로드" onclick="upload()">
		</td>
	</tr>
</table>
</div>
</form>
<jsp:include page="/WEB-INF/layout/sellerFooter.jsp"/>

