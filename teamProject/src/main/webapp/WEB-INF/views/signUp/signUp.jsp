<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>    
<jsp:include page="/WEB-INF/layout/header.jsp">
	<jsp:param name="title" value="메인페이지!"/>
</jsp:include>

<a href="#"> <img alt="소비자 로그인" src="resources/image/buyerImage.png" class="imgSize"></a>
<a href="sellerSignUp"> <img alt="판매자 로그인" src="resources/image/sellerImage.png" class="imgSize"></a>



<jsp:include page="/WEB-INF/layout/footer.jsp"/>