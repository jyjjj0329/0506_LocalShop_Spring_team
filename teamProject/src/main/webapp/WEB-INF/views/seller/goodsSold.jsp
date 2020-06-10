<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>  
<jsp:include page="/WEB-INF/layout/sellerNav.jsp"/>

<c:set var="list" value="${goodsSoldList.goodsSoldVO}"/>
<c:if test="${list.size() == 0}">
	<h1>판매된 물품이 없습니다.</h1>
	<div class="push"></div>
</c:if>
<c:if test="${list.size() != 0}">
 <c:forEach var="vo" items="${list }">
<div class="card" style="text-align: center; display: inline-block;">
  <img class="card-img-top" src="resources/image/${vo.img_name }${vo.extension }" 
  alt="" style="width: 300px; align-items: center; height: 250px;">
  <div class="card-body">
    <h4 class="card-title">${vo.goods_name }</h4>
    <p class="card-text">${vo.buyer_id }님</p>
    <p class="card-text">${vo.name }</p>
    <p class="card-text">${vo.phonenum }</p>
    <p class="card-text">${vo.address }</p>
    <p class="card-text">${vo.del_status }</p>
    <a href="start_DEL?idx=${vo.idx }" class="btn btn-primary">배송 시작</a>
    <a href="complate_DEL?idx=${vo.idx }" class="btn btn-primary">배송 완료</a>
  </div>
</div>

</c:forEach> 
<!-- 페이징 -->
<nav aria-label="Page navigation example" style="margin: 5px;">
<div align="center">
  <ul class="pagination" style="align-items: center;">
    <li class="page-item">
    <c:if test="${goodsSoldList.currentPage > 3}">
		<a class="page-link" aria-label="Previous" href="goodsSold?page=${goodsSoldList.currentPage - 3 }">
			<span aria-hidden="true">&laquo;</span>
	        <span class="sr-only">Previous</span>
     	</a>
	</c:if>
    </li>
    <c:if test="${goodsSoldList.currentPage > 2}">
	    <li class="page-item">
			<a class="page-link" href="goodsSoldList?page=${goodsSoldList.currentPage - 2 }">
				${goodsSoldList.currentPage - 2 }
			</a>
	    </li>
	</c:if>
    <li class="page-item">
    	<c:if test="${goodsSoldList.currentPage > 1}">
			<a class="page-link" href="goodsSold?page=${goodsSoldList.currentPage - 1 }">
				${goodsSoldList.currentPage - 1 }
			</a>
		</c:if>
    </li>
    <li class="page-item disabled">
    	<a class="page-link" href="#">
    		${goodsSoldList.currentPage}
    	</a>
    </li>
    <li class="page-item">
    	<c:if test="${goodsSoldList.currentPage < goodsSoldList.totalPage}">
			<a class="page-link" href="goodsSold?page=${goodsSoldList.currentPage + 1 }">
				${goodsSoldList.currentPage + 1 }
			</a>
		</c:if>
    </li>
    <li class="page-item">
    	<c:if test="${goodsSoldList.currentPage + 1 < goodsSoldList.totalPage}">
			<a class="page-link" href="goodsSold?page=${goodsSoldList.currentPage + 2 }">
				${goodsSoldList.currentPage + 2 }
			</a>
		</c:if>
    </li>
    <c:if test="${goodsSoldList.currentPage + 2 < goodsSoldList.totalPage}">
    <li class="page-item">
		<a class="page-link" aria-label="Next" href="goodsSold?page=${goodsSoldList.currentPage + 3 }">
	        <span aria-hidden="true">&raquo;</span>
	        <span class="sr-only">Next</span>
        </a> </li>
     </c:if>
  </ul>
</div>
</nav>
</c:if>


<jsp:include page="/WEB-INF/layout/sellerFooter.jsp"/>
