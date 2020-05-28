<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type ="text/css" href="resources/css/layout.css">
<<<<<<< HEAD
<c:if test="${sessionScope.seller_id != null }">
	<jsp:include page="/WEB-INF/layout/sellerNav.jsp"/>
</c:if>
<c:if test="${sessionScope.seller_id == null }">
	<jsp:include page="/WEB-INF/layout/nav.jsp"/>
	<caption><h5 style="margin: 10px">${area } >> ${category } >> </h5></caption>
</c:if>

<c:set var="list" value="${sellerGdsListVO.sellerGdsVO}"/>

<!-- 들어있는 갯수만큼 table로 뽑아온다. 5개 이상이면 paging을 만들자. -->
<c:if test="${list.size() == 0}">
	<h1>판매 물품이없습니다.</h1>
</c:if>
<c:if test="${list.size() != 0 }">
<div class="container">
<div class="card-deck" style="margin: 30px;">
<c:forEach var="vo" items="${list }">
<c:if test="${sessionScope.seller_id != null }">
<a href="gdsUpdate?idx=${vo.idx }">
</c:if>
<div class="container" style="width:24%; display: inline-table; margin: 0px auto;">
<div class="card" style="border: 0; outline: none; margin: 10px; padding: 0px;">
    <%-- <div class="card-header">
      ${vo.name }
    </div> --%>
    <img class="card-img-top" src="resources/image/${vo.image_name}" alt="Card image" style=" width: 100%; height: 20vw; object-fit: hidden;">
    <div class="card-body"style="padding: 0px;">
       <p class="card-text" style="font-size: 25px; text-align: left;">${vo.name }</p> 
       <p class="card-text" style="margin-top: -13px">${vo.price }원</p> 
       <p class="card-text" style="font-size: 13px; text-align: right;">${vo.category }</p> 
    </div>
  </div>
</div>
<c:if test="${sessionScope.seller_id != null }">
	</a>
</c:if>
</c:forEach>
</div>
<!-- 페이징 -->
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item">
    <c:if test="${sellerGdsListVO.currentPage > 3}">
		<c:if test="${sessionScope.seller_id != null }">
			<a class="page-link" aria-label="Previous" href="sellerList?page=${sellerGdsListVO.currentPage - 3 }">
		</c:if>
		<c:if test="${sessionScope.seller_id == null }">
			<a class="page-link" aria-label="Previous" href="buyerList?page=${sellerGdsListVO.currentPage - 3 }&area=${area}&category=${category}">
		</c:if>
			<span aria-hidden="true">&laquo;</span>
	        <span class="sr-only">Previous</span>
	     	</a>
	</c:if>
    </li>
    <c:if test="${sellerGdsListVO.currentPage > 2}">
	    <li class="page-item">
			<c:if test="${sessionScope.seller_id != null }">
				<a class="page-link" href="sellerList?page=${sellerGdsListVO.currentPage - 2 }">
			</c:if>
			<c:if test="${sessionScope.seller_id == null }">
				<a class="page-link" href="buyerList?page=${sellerGdsListVO.currentPage - 2 }&area=${area}&category=${category}">
			</c:if>
					${sellerGdsListVO.currentPage - 2 }
				</a>
	    </li>
	</c:if>
    <li class="page-item">
    	<c:if test="${sellerGdsListVO.currentPage > 1}">
			<c:if test="${sessionScope.seller_id != null }">
				<a class="page-link" href="sellerList?page=${sellerGdsListVO.currentPage - 1 }">
			</c:if>
			<c:if test="${sessionScope.seller_id == null }">
				<a class="page-link" href="buyerList?page=${sellerGdsListVO.currentPage - 1 }&area=${area}&category=${category}">
			</c:if>
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
			<c:if test="${sessionScope.seller_id != null }">
				<a class="page-link" href="sellerList?page=${sellerGdsListVO.currentPage + 1 }">
			</c:if>
			<c:if test="${sessionScope.seller_id == null }">
				<a class="page-link" href="buyerList?page=${sellerGdsListVO.currentPage + 1 }&area=${area}&category=${category}">
			</c:if>
					${sellerGdsListVO.currentPage + 1 }
				</a>
		</c:if>
    </li>
    <li class="page-item">
    	<c:if test="${sellerGdsListVO.currentPage + 1 < sellerGdsListVO.totalPage}">
			<c:if test="${sessionScope.seller_id != null }">
				<a class="page-link" href="sellerList?page=${sellerGdsListVO.currentPage + 2 }">
			</c:if>
			<c:if test="${sessionScope.seller_id == null }">
				<a class="page-link" href="buyerList?page=${sellerGdsListVO.currentPage + 2 }&area=${area}&category=${category}">
			</c:if>
					${sellerGdsListVO.currentPage + 2 }
				</a>
		</c:if>
    </li>
    <c:if test="${sellerGdsListVO.currentPage + 2 < sellerGdsListVO.totalPage}">
    <li class="page-item">
		<c:if test="${sessionScope.seller_id != null }">
			<a class="page-link" aria-label="Next" href="sellerList?page=${sellerGdsListVO.currentPage + 3 }">
		</c:if>
		<c:if test="${sessionScope.seller_id == null }">
			<a class="page-link" aria-label="Next" href="buyerList?page=${sellerGdsListVO.currentPage + 3 }&area=${area}&category=${category}">
		</c:if>
	        <span aria-hidden="true">&raquo;</span>
	        <span class="sr-only">Next</span>
        </a> </li>
     </c:if>
  </ul>
</nav>
</div>
</c:if>
<c:if test="${sessionScope.seller_id != null }">
	<jsp:include page="/WEB-INF/layout/sellerFooter.jsp"/>
</c:if>
<c:if test="${sessionScope.seller_id == null }">
</body>
</html>
</c:if>
=======
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
<table border="1">
	<tr>
		<th>물품</th>
		<c:forEach var="vo" items="${list}">
			<td><img class="img" alt="" src="resources/image/${vo.image_name}"></td>
		</c:forEach>
	</tr>
	<tr>
		<th width="100px" height="30px">물품 이름</th>
		<c:if test="${seller_id != null }">
		<c:forEach var="vo" items="${list }">
			<td align="center"><a href="gdsUpdate?idx=${vo.idx }">${vo.name }</a></td>
		</c:forEach>
		</c:if>
	</tr>
	<tr>
		<th  height="30px">물품 가격</th>
		<c:forEach var="vo" items="${list }">
			<td align="center">${vo.price }원</td>
		</c:forEach>
	</tr>
	<tr>
		<th  height="30px">물품 원산지</th>
		<c:forEach var="vo" items="${list }">
			<td  align="center">${vo.origin }</td>
		</c:forEach>
	</tr>
	<tr>
		<th>물품 분류</th>
		<c:forEach var="vo" items="${list }">
			<td align="center">${vo.category }</td>
		</c:forEach>
	</tr> 
	<tr>
		<td colspan="5" align="center">
			<c:if test="${sellerGdsListVO.currentPage > 3}">
			<c:if test="${seller_id != null }">
				<a href="sellerList?page=${sellerGdsListVO.currentPage - 3 }">
			</c:if>
			<c:if test="${seller_id == null }">
				<a href="buyerList?page=${sellerGdsListVO.currentPage - 3 }&area=${area}&category=${category}">
			</c:if>
					[이전]
				</a>
			</c:if>
			<c:if test="${sellerGdsListVO.currentPage > 2}">
			<c:if test="${seller_id != null }">
				<a href="sellerList?page=${sellerGdsListVO.currentPage - 2 }">
			</c:if>
			<c:if test="${seller_id == null }">
				<a href="buyerList?page=${sellerGdsListVO.currentPage - 2 }&area=${area}&category=${category}">
			</c:if>
					${sellerGdsListVO.currentPage - 2 }
				</a>
			</c:if>
			<c:if test="${sellerGdsListVO.currentPage > 1}">
			<c:if test="${seller_id != null }">
				<a href="sellerList?page=${sellerGdsListVO.currentPage - 1 }">
			</c:if>
			<c:if test="${seller_id == null }">
				<a href="buyerList?page=${sellerGdsListVO.currentPage - 1 }&area=${area}&category=${category}">
			</c:if>
					[${sellerGdsListVO.currentPage - 1 }]
				</a>
			</c:if>
				[${sellerGdsListVO.currentPage}]
			<c:if test="${sellerGdsListVO.currentPage < sellerGdsListVO.totalPage}">
			<c:if test="${seller_id != null }">
				<a href="sellerList?page=${sellerGdsListVO.currentPage + 1 }">
			</c:if>
			<c:if test="${seller_id == null }">
				<a href="buyerList?page=${sellerGdsListVO.currentPage + 1 }&area=${area}&category=${category}">
			</c:if>
					[${sellerGdsListVO.currentPage + 1 }]
				</a>
			</c:if>
			<c:if test="${sellerGdsListVO.currentPage + 1 < sellerGdsListVO.totalPage}">
			<c:if test="${seller_id != null }">
				<a href="sellerList?page=${sellerGdsListVO.currentPage + 2 }">
			</c:if>
			<c:if test="${seller_id == null }">
				<a href="buyerList?page=${sellerGdsListVO.currentPage + 2 }&area=${area}&category=${category}">
			</c:if>
					[${sellerGdsListVO.currentPage + 2 }]
				</a>
			</c:if>
			<c:if test="${sellerGdsListVO.currentPage + 2 < sellerGdsListVO.totalPage}">
			<c:if test="${seller_id != null }">
				<a href="sellerList?page=${sellerGdsListVO.currentPage + 3 }">
			</c:if>
			<c:if test="${seller_id == null }">
				<a href="buyerList?page=${sellerGdsListVO.currentPage + 3 }&area=${area}&category=${category}">
			</c:if>
					[다음]
				</a>
			</c:if>
		</td>
	</tr>
	
</table>
</c:if>

>>>>>>> refs/heads/parkc
