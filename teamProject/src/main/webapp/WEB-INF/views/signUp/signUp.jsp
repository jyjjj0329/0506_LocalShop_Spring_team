<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>    
<jsp:include page="/WEB-INF/layout/nav.jsp"/>

<link type="text/css" href="resources/css/style-signUp.css" rel="stylesheet"/>
<body>
	<div class="signUp" id="signUp">
		<a href="buyerSignUp">
			<img alt="소비자 로그인" src="resources/image/consumerImage.jpg" class="imgSize1" >
			<span class="buyer">소비자</span>
		</a>
		<a href="sellerSignUp">
			<img alt="판매자 로그인" src="resources/image/marketImage.jpg" class="imgSize2" >
			<span class="seller">판매자</span>
		</a>
	</div>
</body>



<%-- <jsp:include page="/WEB-INF/layout/footer.jsp"/> --%>