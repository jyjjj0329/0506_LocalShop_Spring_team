<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세정보</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/star.css">

<jsp:include page="/WEB-INF/layout/nav.jsp"/>
	<div align="center" style="margin-top: 40px;">
	<table border="1">
		<tr>
			<td>
				<img src="resources/image/${sellerGdsVO.image_name}" width="340" height="300">
			</td>
			<td>
				<table border="1" style="height: 300px; width: 400px;">
					<tr align="center">
						<td>상품명</td>
						<td>${sellerGdsVO.name }</td>
					</tr>
					<tr align="center">
						<td>원산지</td>
						<td>${sellerGdsVO.origin }</td>
					</tr>
					<tr align="center">
						<td>분류</td>
						<td>${sellerGdsVO.category }</td>
					</tr>
					<tr align="center">
						<td>가격</td>
						<td><fmt:formatNumber value="${sellerGdsVO.price}" pattern="###,###,###"/></td>
					</tr>
					<tr align="center">
						<td>상품소개</td>
						<td>${sellerGdsVO.content}</td>
					</tr>
					<tr align="center">
						<td colspan="2">
							<form name="paymentForm" method="post" action="payment">
								<%-- <input type="hidden" name="productId" value="${vo.productId}"> --%>
								<select name="amount">
									<c:forEach begin="1" end="10" var="i">
										<option value="${i}">${i}</option>
									</c:forEach>
								</select>&nbsp;개
								<!-- <input type="submit" value="장바구니에 담기"> -->
								<input type="submit" value="구매">
							</form>
							
						</td>
					</tr>
				</table>
				</div>
			</td>
		</tr>
	</table>
	
	<!-- 댓글 별점 창 -->
	<c:set var="vo" value="${reviewsVO }"/>
	<p style="padding-top: 20px;">댓글 갯수(${reviewsCount})</p>
	<c:if test="${sessionScope.buyer_id != null }">
	<div align="center">
		<!-- 별 모양 -->
		<div class="star-box">
		  <span class="star star_left"></span>
		  <span class="star star_right"></span>
		
		  <span class="star star_left"></span>
		  <span class="star star_right"></span>
		
		  <span class="star star_left"></span>
		  <span class="star star_right"></span>
		
		 <span class="star star_left"></span>
		 <span class="star star_right"></span>
		
		 <span class="star star_left"></span>
		 <span class="star star_right"></span>
		</div>
		<p>평가하기</p>
		<p>${sessionScope.buyer_id }</div>
		<form action="reviews?sellgds_idx=${sellerGdsVO.idx}" method="post">
			<textarea rows="5" cols="80" name="content"></textarea>
			<input type="hidden" name="star">
			<input type="submit" value="입력"/>
		</form>
		</p>
	</div>
	<c:if test="${vo.size() == 0 }">
		<h4>댓글이 없습니다. 첫댓글의 주인공이 되어주세요.</h3>
	</c:if>
	</c:if>
	<c:if test="${sessionScope.buyer_id == null }">
		<h4>댓글은 로그인 하셔야만 작성하실 수 있습니다.</h3>
	</c:if>
	<c:if test="${vo.size() != 0 }">
		<table class="table table-stripped" id="reviews">
    <thead>
        <tr>
            <th width="300px;">별점</th> <!-- 평점 -->
            <th>ID</th>
            <th width="700px;">내용</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="review" items="${reviewsVO }" varStatus="status">
            <!-- 평점 기준 별표시 출력 -->
            <tr>
                <td>
                	<c:forEach begin="0" end="${review.star }">★</c:forEach>
                	(${review.star +1})
                </td>
                <td>${review.buyer_id }</td>
                <td>${review.content }</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
	</c:if>
	
</body>
<script type="text/javascript">

var star = 0;
$(".star").on('click',function(){
	star = $(this).index();
	$(".star").removeClass("on");
	  for(var i=0; i<=star; i++){
	     $(".star").eq(i).addClass("on");
	}
	$("input[type=hidden]").val(star);
});

</script>
</html>