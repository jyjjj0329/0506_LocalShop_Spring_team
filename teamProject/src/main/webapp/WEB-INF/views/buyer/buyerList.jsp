<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type ="text/css" href="layout/layout.css">
<jsp:include page="/WEB-INF/layout/nav.jsp"/>

<script type="text/javascript">
function search() {
	var search = document.getElementById("search").value.trim();
	document.location.href = "buyerList?page=1&area="+ '${area}' + "&category=" + '${category}' + "&search=" + search;
}
</script>

<caption>
	<h5 style="margin: 10px">${area } >> ${category } >> </h5>
</caption>
<c:set var="list" value="${sellerGdsListVO.sellerGdsVO}"/>

<div align="right" class="search">
<input type="text" placeholder="이름 검색" id="search"/>
<input type="button" value="검색" onclick="search()"> 
</div>
<!-- 들어있는 갯수만큼 table로 뽑아온다. 5개 이상이면 paging을 만들자. -->
<c:if test="${list.size() == 0}">
	<h1>판매 물품이없습니다.</h1>
</c:if>
<c:if test="${list.size() != 0 }">
<div class="container">
<div class="card-deck" style="margin: 30px;">
<c:forEach var="vo" items="${list }">
<div class="container" style="width:24%; display: inline-table; margin: 0px auto;">
<div class="card" style="border: 0; outline: none; margin: 10px; padding: 0px;">
    <img class="card-img-top" src="resources/image/${vo.image_name}" alt="Card image" style=" width: 100%; height: 20vw; object-fit: hidden;">
    <div class="card-body"style="padding: 0px;">
       <p class="card-text" style="font-size: 25px; text-align: left;">${vo.name }</p> 
       <p class="card-text" style="margin-top: -13px">${vo.price }원</p> 
       <p class="card-text" style="font-size: 13px; text-align: right;">${vo.category }</p> 
    </div>
  </div>
</div>
</c:forEach>
</div>
<!-- 페이징 -->
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item">
    <c:if test="${sellerGdsListVO.currentPage > 3}">
		<a class="page-link" aria-label="Previous" href="buyerList?page=${sellerGdsListVO.currentPage - 3 }&area=${area}&category=${category}">
			<span aria-hidden="true">&laquo;</span>
	        <span class="sr-only">Previous</span>
     	</a>
	</c:if>
    </li>
    <c:if test="${sellerGdsListVO.currentPage > 2}">
	    <li class="page-item">
			<a class="page-link" href="buyerList?page=${sellerGdsListVO.currentPage - 2 }&area=${area}&category=${category}">
				${sellerGdsListVO.currentPage - 2 }
			</a>
	    </li>
	</c:if>
    <li class="page-item">
    	<c:if test="${sellerGdsListVO.currentPage > 1}">
			<a class="page-link" href="buyerList?page=${sellerGdsListVO.currentPage - 1 }&area=${area}&category=${category}">
				${sellerGdsListVO.currentPage - 1 }
			</a>
		</c:if>
    </li>
    <li class="page-item disabled">
    	<a class="page-link" href="#">
    		${sellerGdsListVO.currentPage}
    	</a>
    </li>
    <li class="page-item">
    	<c:if test="${sellerGdsListVO.currentPage < sellerGdsListVO.totalPage}">
			<a class="page-link" href="buyerList?page=${sellerGdsListVO.currentPage + 1 }&area=${area}&category=${category}">
				${sellerGdsListVO.currentPage + 1 }
			</a>
		</c:if>
    </li>
    <li class="page-item">
    	<c:if test="${sellerGdsListVO.currentPage + 1 < sellerGdsListVO.totalPage}">
			<a class="page-link" href="buyerList?page=${sellerGdsListVO.currentPage + 2 }&area=${area}&category=${category}">
				${sellerGdsListVO.currentPage + 2 }
			</a>
		</c:if>
    </li>
    <c:if test="${sellerGdsListVO.currentPage + 2 < sellerGdsListVO.totalPage}">
    <li class="page-item">
		<a class="page-link" aria-label="Next" href="buyerList?page=${sellerGdsListVO.currentPage + 3 }&area=${area}&category=${category}">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
        </a> </li>
     </c:if>
  </ul>
</nav>
</div>
</c:if>
</body>
</html>
