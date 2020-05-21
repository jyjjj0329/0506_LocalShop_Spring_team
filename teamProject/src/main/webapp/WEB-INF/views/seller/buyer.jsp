<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type ="text/css" href="resources/css/layout.css">
<c:if test="${seller_id != null }">
	<jsp:include page="/WEB-INF/layout/sellerNav.jsp"/>
</c:if>
<c:if test="${seller_id == null }">
	<jsp:include page="/WEB-INF/layout/nav.jsp"/>
</c:if>

<c:set var="list" value="${sellerGdsListVO.sellerGdsVO}"/>
<caption><h2>판매목록</h2></caption>
<!-- 들어있는 갯수만큼 table로 뽑아온다. 5개 이상이면 paging을 만들자. -->
<c:if test="${list.size() == 0}">
	<h1>판매 물품이없습니다.</h1>
</c:if>
<c:if test="${list.size() != 0 }">
<c:forEach var="vo" items="${list }">
<div class="container" style="width:20%; display: inline-table;">
<div class="card" style="border: 0; outline: none;">
    <%-- <div class="card-header">
      ${vo.name }
    </div> --%>
    <img class="card-img-top" src="resources/image/${vo.image_name}" alt="Card image" style="width:100%">
    <div class="card-body">
       <p class="card-text">${vo.price }원</p> 
       <p class="card-text">${vo.origin }</p> 
       <p class="card-text">${vo.category }</p> 
    </div>
  </div>
</div>
</c:forEach>

</c:if>
</body>
</html>
