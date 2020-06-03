<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<link rel="stylesheet" href="resources/css/style-category.css" />
<jsp:include page="/WEB-INF/layout/nav.jsp" />

<script type="text/javascript">
   $(function() {
      // 전체선택 체크박스 체크된 상태 일 경우
      $("#all").click(function() {
         if ($("#all").prop("checked")) {
            $("input[type=checkbox]").prop("checked", true);
            // 해제된 경우
         } else {
            $("input[type=checkbox]").prop("checked", false);
         }
      })
   })

   function showlist() {
      var item = $(this).attr("category");
      /* item.innerHTML="<iframe src='buyerList?page=1'></iframe>" */
    	console.log(item);
   }
</script>
</head>
<body>

	<div class="floating">
		<div class="areaname">
			<h1>${area}</h1>
			<button type="button" class="btn btn-lg btn-dark back"
				onclick="location.href='mainpage'">변 경</button>
		</div>
		<form action="buyerList?page=1" method="post" target="_self">
			<input type="hidden" name="area" value="${area}">
			<div class="categorylist">

				<h2>
					<a id="clothes" class="category" onclick="showlist()" value="clothes">의 류</a>
				</h2>
				<h2>
					<!-- <a id="food" class="category" onclick="showlist(food)">음 식</a> -->
					<input type="submit" id="food" name="category" onclick="showlist()">
				</h2>
				<h2>
					<a id="furniture" class="category" onclick="showlist()">가 구</a>
					<!-- <input type="submit" id="furniture" value="가구" name="category"> -->
				</h2>
				<h2>
					<a id="toy" class="category" onclick="showlist()">완 구</a>
					<!-- <input type="submit" id="toy" value="완구" name="category"> -->
				</h2>
				<h2>
					<a id="electronic" class="category" onclick="showlist()">전자 제품</a>
					<!-- <input type="submit" id="electronic" value="전자제품" name="category"> -->
				</h2>
				<h2>
					<a id="traditional" class="category" onclick="showlist()">전통 시장</a>
					<!-- <input type="submit" id="traditional" value="전통시장" name="category"> -->
				</h2>
				<h2>
					<a id="etc" class="category" onclick="showlist()">기 타</a>
					<!-- <input type="submit" id="etc" value="기타" name="category"> -->
				</h2>

			</div>
		</form>
	</div>
	<%-- <div id="list-div">
      <c:set var="list" value="${sellerGdsListVO.sellerGdsVO}" />

      <!-- 들어있는 갯수만큼 table로 뽑아온다. 5개 이상이면 paging을 만들자. -->
      <c:if test="${list.size() == 0}">
         <h1>판매 물품이없습니다.</h1>
      </c:if>
      <c:if test="${list.size() != 0 }">
         <div class="container">
            <div class="card-deck" style="margin: 30px;">
               <c:forEach var="vo" items="${list }">
                  <div class="container"
                     style="width: 24%; display: inline-table; margin: 0px auto;">
                     <div class="card"
                        style="border: 0; outline: none; margin: 10px; padding: 0px;">
                        <img class="card-img-top" src="resources/image/${vo.image_name}"
                           alt="Card image"
                           style="width: 100%; height: 20vw; object-fit: hidden;">
                        <div class="card-body" style="padding: 0px;">
                           <p class="card-text" style="font-size: 25px; text-align: left;">${vo.name }</p>
                           <p class="card-text" style="margin-top: -13px">${vo.price }원</p>
                           <p class="card-text"
                              style="font-size: 13px; text-align: right;">${vo.category }</p>
                        </div>
                     </div>
                  </div>
               </c:forEach>
            </div>
            <!-- 페이징 -->
            <nav aria-label="Page navigation example">
               <ul class="pagination justify-content-center">
                  <li class="page-item"><c:if
                        test="${sellerGdsListVO.currentPage > 3}">
                        <a class="page-link" aria-label="Previous"
                           href="buyerList?page=${sellerGdsListVO.currentPage - 3 }&area=${area}&category=${category}">
                           <span aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
                        </a>
                     </c:if></li>
                  <c:if test="${sellerGdsListVO.currentPage > 2}">
                     <li class="page-item"><a class="page-link"
                        href="buyerList?page=${sellerGdsListVO.currentPage - 2 }&area=${area}&category=${category}">
                           ${sellerGdsListVO.currentPage - 2 } </a></li>
                  </c:if>
                  <li class="page-item"><c:if
                        test="${sellerGdsListVO.currentPage > 1}">
                        <a class="page-link"
                           href="buyerList?page=${sellerGdsListVO.currentPage - 1 }&area=${area}&category=${category}">
                           ${sellerGdsListVO.currentPage - 1 } </a>
                     </c:if></li>
                  <li class="page-item disabled"><a class="page-link" href="#">
                        ${sellerGdsListVO.currentPage} </a></li>
                  <li class="page-item"><c:if
                        test="${sellerGdsListVO.currentPage < sellerGdsListVO.totalPage}">
                        <a class="page-link"
                           href="buyerList?page=${sellerGdsListVO.currentPage + 1 }&area=${area}&category=${category}">
                           ${sellerGdsListVO.currentPage + 1 } </a>
                     </c:if></li>
                  <li class="page-item"><c:if
                        test="${sellerGdsListVO.currentPage + 1 < sellerGdsListVO.totalPage}">
                        <a class="page-link"
                           href="buyerList?page=${sellerGdsListVO.currentPage + 2 }&area=${area}&category=${category}">
                           ${sellerGdsListVO.currentPage + 2 } </a>
                     </c:if></li>
                  <c:if
                     test="${sellerGdsListVO.currentPage + 2 < sellerGdsListVO.totalPage}">
                     <li class="page-item"><a class="page-link" aria-label="Next"
                        href="buyerList?page=${sellerGdsListVO.currentPage + 3 }&area=${area}&category=${category}">
                           <span aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
                     </a></li>
                  </c:if>
               </ul>
            </nav>
         </div>
      </c:if>
   </div> --%>
	<!-- <iframe src="buyerList?page=1"></iframe> -->

</body>

</html>