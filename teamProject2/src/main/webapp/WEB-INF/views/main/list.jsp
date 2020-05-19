<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="kr.project.VO.SellerGdsVO" %>
<link rel="stylesheet" href="resources/css/style-list.css" />
<jsp:include page="/WEB-INF/layout/nav.jsp"/>

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
							document.querySelector('.item-wrap').appendChild(itemlist.cloneNode(true)); 
						} 
						
					</script>

</body>
</html>