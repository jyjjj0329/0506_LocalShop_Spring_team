<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>  
<<<<<<< HEAD
=======
<link rel="stylesheet" type="text/css" href="resources/css/seller.css">  
>>>>>>> refs/heads/parkc
<jsp:include page="/WEB-INF/layout/sellerNav.jsp"/>

<div class="container">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <c:forEach var="i" begin="2" end="${count }">
      <li data-target="#myCarousel" data-slide-to="${count }-1"></li>
      </c:forEach>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">

      <div class="item active">
<<<<<<< HEAD
        <img src="resources/storeImage/${sessionScope.store}/1-1${extension[1]}" alt="1번째 slide" class="img">
      </div>

	<c:forEach var="i" begin="2" end="${count }">
      <div class="item">
        <img src="resources/storeImage/${sessionScope.store}/1-${i}${extension[i]}" alt="${i }번째 slide" class="img">
=======
        <img src="resources/storeImage/${store}/1-1${extension[1]}" alt="1번째 slide" class="img">
      </div>

	<c:forEach var="i" begin="2" end="${count }">
      <div class="item">
        <img src="resources/storeImage/${store}/1-${i}${extension[i]}" alt="${i }번째 slide" class="img">
>>>>>>> refs/heads/parkc
      </div>
     </c:forEach>
    
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

<jsp:include page="/WEB-INF/layout/sellerFooter.jsp"/>
