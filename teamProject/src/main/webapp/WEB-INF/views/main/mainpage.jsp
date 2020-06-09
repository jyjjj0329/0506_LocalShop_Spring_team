<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page session="false" %>
<link rel="stylesheet" href="resources/css/style-mainpage.css" />
<link rel="stylesheet" type ="text/css" href="resources/css/common.css">
<jsp:include page="/WEB-INF/layout/nav.jsp"/>
<script type="text/javascript" src="resources/js/main.js"></script>

	<ul class="nav nav-tabs nav-justified">
		<li class="nav-item"><a class="nav-link tab-color active"
			data-toggle="tab" href="#choice">이름을 선택하여 검색</a></li>
		<li class="nav-item"><a class="nav-link tab-color"
			data-toggle="tab" href="#map">지도에서 클릭하여 검색</a></li>
	</ul>
	<!-- 지도부분 -->
	<div class="tab-content">
		<div class="tab-pane fade region" id="map">
			<img id="mainMap" name="mainMap" src="resources/image/map.gif" />
			<form action="buyerList?page=1" method="post">
				<!-- 도봉구 --><button type="submit" class="btn btn-lg btn-dobong" name="area" value="도봉구"></button>
				<!-- 노원구 --><button type="submit" class="btn btn-lg btn-nowon" name="area" value="노원구"></button>
				<!-- 강북구 --><button type="submit" class="btn btn-lg btn-gangbuk" name="area" value="강북구"></button>
				<!-- 성북구 --><button type="submit" class="btn btn-lg btn-sungbuk" name="area" value="성북구"></button>
				<!-- 은평구 --><button type="submit" class="btn btn-lg btn-eunpyeong" name="area" value="은평구"></button>
				<!-- 서대문구 --><button type="submit" class="btn btn-lg btn-seodaemun" name="area" value="서대문구"></button>
				<!-- 종로구 --><button type="submit" class="btn btn-lg btn-jongro" name="area" value="종로구"></button>
				<!-- 동대문구 --><button type="submit" class="btn btn-lg btn-dongdaemun" name="area" value="동대문구"></button>
				<!-- 중랑구 --><button type="submit" class="btn btn-lg btn-jungrang" name="area" value="중랑구"></button>
				<!-- 중구 --><button type="submit" class="btn btn-lg btn-jung" name="area" value="중구"></button>
				<!-- 마포구 --><button type="submit" class="btn btn-lg btn-mapo" name="area" value="마포구"></button>
				<!-- 용산구 --><button type="submit" class="btn btn-lg btn-yongsan" name="area" value="용산구"></button>
				<!-- 성동구 --><button type="submit" class="btn btn-lg btn-sungdong" name="area" value="성동구"></button>
				<!-- 광진구 --><button type="submit" class="btn btn-lg btn-gwangjin" name="area" value="광진구"></button>
				<!-- 강서구--><button type="submit" class="btn btn-lg btn-gangseo" name="area" value="강서구"></button>
				<!-- 양천구 --><button type="submit" class="btn btn-lg btn-yangcheon" name="area" value="양천구"></button>
				<!-- 구로구 --><button type="submit" class="btn btn-lg btn-guro" name="area" value="구로구"></button>
				<!-- 영등포구 --><button type="submit" class="btn btn-lg btn-yeongdeungpo" name="area" value="영등포구"></button>
				<!-- 금천구 --><button type="submit" class="btn btn-lg btn-geumcheon" name="area" value="금천구"></button>
				<!-- 동작구 --><button type="submit" class="btn btn-lg btn-dongjak" name="area" value="동작구"></button>
				<!-- 관악구 --><button type="submit" class="btn btn-lg btn-gwanak" name="area" value="관악구"></button>
				<!-- 서초구 --><button type="submit" class="btn btn-lg btn-seocho" name="area" value="서초구"></button>
				<!-- 강남구 --><button type="submit" class="btn btn-lg btn-gangnam" name="area" value="강남구"></button>
				<!-- 송파구 --><button type="submit" class="btn btn-lg btn-songpa" name="area" value="송파구"></button>
				<!-- 강동구 --><button type="submit" class="btn btn-lg btn-gangdong" name="area" value="강동구"></button>
			</form>
		</div>

		<div class="tab-pane fade show active " id="choice" align="center">
			<div id="list_area">
            <div class="area_list">
                <ul>
                        <li data-id="1"><span>도봉구</span></li>
                        <li data-id="2"><span>노원구</span></li>
                        <li data-id="3"><span>강북구</span></li>                        
                        <li data-id="4"><span>성북구</span></li>
                        <li data-id="5"><span>은평구</span></li>
                        <li data-id="6"><span>서대문구</span></li>                        
                        <li data-id="7"><span>종로구</span></li>
                        <li data-id="8"><span>동대문구</span></li>
                        <li data-id="9"><span>중랑구</span></li>
                        <li data-id="11"><span>마포구</span></li>
                        <li data-id="13"><span>용산구</span></li>
                        <li data-id="14"><span>성동구</span></li>
                        <li data-id="16"><span>광진구</span></li>
                        <li data-id="19"><span>강서구</span></li>
                        <li data-id="10"><span>양천구</span></li>
                        <li data-id="12"><span>구로구</span></li>
                        <li data-id="15"><span>영등포구</span></li>
                        <li data-id="17"><span>금천구</span></li>
                        <li data-id="18"><span>동작구</span></li>
                        <li data-id="20"><span>관악구</span></li>
                        <li data-id="21"><span>서초구</span></li>
                        <li data-id="23"><span>강남구</span></li>
                        <li data-id="25"><span>송파구</span></li>
                        <li data-id="28"><span>강동구</span></li>
                    
                </ul>
            </div>
             <!-- 버튼을 누를시에 해당 정보를 가지고 페이지 이동 입력 코드 넣어야함. -->
            <div class="btn_wrap">
                <a href="javascript:void(0);" class="btn_select btn_black">선택완료</a>
                <a href="javascript:void(0);" class="btn_cancel btn_white">선택취소</a>
            </div>
           </div>

	</div>
	
	<div class = "admin_sts2" id="admin_sts"></div>
	<!-- 본인의  업체 출력 -등록해둔 물품 목록 출력, 각 목록 수정/삭제 가능-->
</div>
</body>

</html>