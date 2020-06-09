<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page session="false" %>
<link rel="stylesheet" href="resources/css/style-mainpage.css" />
<link rel="stylesheet" type ="text/css" href="resources/css/common.css">
<jsp:include page="/WEB-INF/layout/nav.jsp"/>
<script type="text/javascript" src="resources/js/main.js"></script>
<head>
<style >
		#btn-name1{
			border-top-left-radius: 100px;
		  border-bottom-left-radius: 200px;
		   margin-right:-4px; } 
		   #btn btn-name2{ 
		   border-top-right-radius: 100px;
		    border-bottom-right-radius: 200px; 
		    margin-left:-3px; } 
	
		    #btn_group button{ 
		    border: 1px solid black; 
		   height: 100px;
    		width: 200px;
		    background-color: rgba(0,0,0,0); 
		    color: black; padding: 5px; } 
		    #btn_group button:hover{
		     color:white;
		     background-color: gray;
		     height: 100px;
    		width: 200px; }
    		
	
	}
</style>
</head>

	<ul class="nav nav-tabs nav-justified">
		<li class="nav-item"><a class="nav-link active tab-color"
			data-toggle="tab" href="#choice">이름을 선택하여 검색</a></li>
		<li class="nav-item"><a class="nav-link tab-color"
			data-toggle="tab" href="#map">지도에서 클릭하여 검색</a></li>
	</ul>
	
	<div class="tab-content">
		<!-- 이름 부분 -->
		<div class="tab-pane fade show active " id="chsoice" align="center">
			<div class="region" id="btn_group">
			<table>
				<form action="buyerList?page=1" method="post">
				 <tr>
				 <td>   
				 <div>
	     			<h2>
					<p style="margin-top: 12px;text-align: center;">서울 지역화폐 결제 매장 검색</h1>
					</h2>
					<!-- <img id="search_img"  src="resources/imgae/search_img.png" /> -->
					<p style="margin-top: 10px;text-align: center;">사회적 거리두기를 실천해 주세요! </p>
	       			<p style="margin-top: 9px;text-align: center;">해당 지역을 선택해 주세요</p>
				</div>
				<div>
	            <!-- 도봉구 --><button type="submit" class="btn btn-name1" name="area" value="도봉구" >도봉구</button>
	            <!-- 노원구 --><button type="submit" class="btn btn-name2" name="area" value="노원구" >노원구</button>	            
	            <!-- 성북구 --><button type="submit" class="btn btn-name4" name="area" value="성북구" >성북구</button>
	            <!-- 은평구 --><button type="submit" class="btn btn-name5" name="area" value="은평구" >은평구</button>
	            <!-- 서대문구 --><button type="submit" class="btn btn-name6" name="area" value="서대문구" >서대문구</button>
	            </div>
	            <div>
	            <!-- 종로구 --><button type="submit" class="btn btn-name7" name="area" value="종로구" >종로구</button>
	            <!-- 동대문구 --><button type="submit" class="btn btn-name8" name="area" value="동대문구" >동대문구</button>
	            <!-- 중랑구 --><button type="submit" class="btn btn-name9" name="area" value="중랑구" >중랑구</button>
	            <!-- 중구 --><button type="submit" class="btn btn-name10" name="area" value="중구" >중구</button>
	            <!-- 마포구 --><button type="submit" class="btn btn-name11" name="area" value="마포구" >마포구</button>
	            </div>
	            <div>
	            <!-- 용산구 --><button type="submit" class="btn btn-name12" name="area" value="용산구" >용산구</button>
	            <!-- 성동구 --><button type="submit" class="btn btn-name13" name="area" value="성동구" >성동구</button>
	            <!-- 광진구 --><button type="submit" class="btn btn-name14" name="area" value="광진구" >광진구</button>
	            <!-- 강서구 --><button type="submit" class="btn btn-name15" name="area" value="강서구" >강서구</button>
	            <!-- 양천구 --><button type="submit" class="btn btn-name16" name="area" value="양천구" >양천구</button>
	            </div>
	            <div>
				<!-- 구로구 --><button type="submit" class="btn btn-name17" name="area" value="구로구" >구로구</button>
				<!-- 영등포구 --><button type="submit" class="btn btn-name18" name="area" value="영등포구" >영등구</button>
				<!-- 금천구 --><button type="submit" class="btn btn-name19" name="area" value="금천구" >금천구</button>
				<!-- 동작구 --><button type="submit" class="btn btn-name20" name="area" value="동작구" >동작구</button>
				<!-- 관악구 --><button type="submit" class="btn btn-name21" name="area" value="관악구" >관악구</button>
				</div>
				<div>
				<!-- 서초구 --><button type="submit" class="btn btn-name22" name="area" value="서초구" >서초구</button>
				<!-- 강남구 --><button type="submit" class="btn btn-name23" name="area" value="강남구" >강남구</button>
				<!-- 송파구 --><button type="submit" class="btn btn-name24" name="area" value="송파구" >송파구</button>
				<!-- 강동구 --><button type="submit" class="btn btn-name25" name="area" value="강동구" >강동구</button>
				 <!-- 강북구--><button type="submit" class="btn btn-name3" name="area" value="강북구" >강북구</button>
				</div>
				</td>     
         		</tr>
            </form>
            </table>
             <!-- 버튼을 누를시에 해당 정보를 가지고 페이지 이동 입력 코드 넣어야함. -->
         </div>
         </div>
         
         <!-- 지도 부분 -->
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
	
	<div class = "admin_sts2" id="admin_sts"></div>
	<!-- 본인의  업체 출력 -등록해둔 물품 목록 출력, 각 목록 수정/삭제 가능-->
</div>
</body>

</html>