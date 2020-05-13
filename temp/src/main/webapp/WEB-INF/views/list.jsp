<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="temp.pbs.vo.SellgdsVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>판매 목록</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<!-- Bootstrap CSS -->

<link rel="stylesheet" href="resources/css/style-list.css" />


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {

	// 스크롤 감지
    var didScroll = false;
		
    $(window).on('scroll', function() { didScroll = true; });
    
    setInterval(function() {
        var bottomHeight = $(window).scrollTop() + $(window).height() + 600;
        var docHeight = $(document).height();

        if (didScroll) {
            didScroll = false;
            if (bottomHeight > docHeight) infiniteScrollContent();
        }
    }, 250);
    
    function infiniteScrollContent() {
      
        var scrollcon = '';
        for (var k = 0; k < 4; k++) {
            scrollcon += '<div class="product-item"><strong>상품이름</strong></div>';
        }			
        $("#productScroll").append(scrollcon);
    }
});
</script>
</head>
<body>
	<!--상단 네비게이션 바-->
	<div id="navbar">
		<nav class="navbar bg-dark navbar-dark">
			<!-- Brand -->
			<b><a class="navbar-brand" href="mainpage">지역 화폐</a></b>

			<!-- Dropdown -->
			<div class="btn-group dropdown navbar-right">
				<a class="btn dropdown-toggle" href="#" data-toggle="dropdown">
					<span class="navbar-toggler-icon"></span>
				</a>
				<ul class="dropdown-menu dropdown-menu-right">
					<li><a class="dropdown-item" href="mypage">마이페이지</a></li>
					<li><a class="dropdown-item" href="cs">고객지원</a></li>
					<li><a class="dropdown-item" href="login" target="_blank">로그인</a></li>
				</ul>
			</div>
		</nav>
	</div>
	<div id="content">
		<div id="productClass">
			<div class="page-body">		
				<div class="cateTit">
					<h2>현재 테스트</h2>		
				</div>
				<div class="item-wrap">
					
					<%-- <dl class="item-list">
						<dt class="thumb"></dt>
						<dd class="prd-info">
							<ul>
								<li class="prd-name">${sellgdsVO.getName()}</li>
								<li class="prd-price">
									<div class="left">
										<span class="price">${sellgdsVO.getPrice()}</span>
									</div>
								</li>
							
							
							
							</ul>
						</dd>
					</dl> --%>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
					<script>
						var itemlist = document.createElement('dl');
							itemlist.classList.add('item-list');
						var thumb = document.createElement('dt');
							thumb.classList.add('thumb');					
						var prdinfo = document.createElement('dd');
							prdinfo.classList.add('prd-info');						
						var ul = document.createElement('ul');							
						var liname = document.createElement('li');
							liname.classList.add('prd-name');
						var litxt = document.createTextNode('${sellgdsVO.getName()}');										
						var liprice = document.createElement('li');
							liprice.classList.add('prd-price');
						var divl = document.createElement('div');
							divl.classList.add('left');
						var spanprice = document.createElement('span');
							spanprice.classList.add('price');
						var spantxt = document.createTextNode('${sellgdsVO.getPrice()}');
						
						spanprice.appendChild(spantxt);
						divl.appendChild(spanprice);
						liname.appendChild(litxt);
						ul.appendChild(liname);
						liprice.appendChild(divl);
						ul.appendChild(liprice);
						prdinfo.appendChild(ul);						
						itemlist.appendChild(thumb);
						itemlist.appendChild(prdinfo);
						
						 for(var i = 0; i<20 ; i++){
							/* document.getElementByClassName("item-wrap").appendChild(itemlist); */
							document.querySelector('.item-wrap').appendChild(itemlist + '[i]'); 
						} 
						
					</script>
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>