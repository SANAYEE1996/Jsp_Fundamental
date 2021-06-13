<%@page import="kr.or.kpc.dao.ParkDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.kpc.dto.ParkDto"%>
<%@ page pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>
<%
ParkDto dto = new ParkDto();
ParkDao dao = ParkDao.getInstance();

ArrayList<ParkDto> list = dao.resall();
int size = list.size();
String s = null;
%>

<!-- container start -->
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<!-- table start -->
			<h3>공원 맵</h3>
			<div class="table-responsive">
				<div style="width: 300px; margin: 20px;">
					<label for="year">연령대</label> 
					<select class="form-control" id="years">
						<option value="age">10</option>
						<option value="age">20</option>
						<option value="age">30</option>
						<option value="age">40</option>
						<option value="age">50</option>
						<option value="age">60</option>
						<option value="age">70</option>
						<option value="age">80</option>
					</select><br> 
					<label for="addr">위치</label><br>
					<select class="form-control" id="dist">
						<option value="district">중구</option>
						<option value="district">종로구</option>
						<option value="district">용산구</option>
						<option value="district">은평구</option>
						<option value="district">서대문구</option>
						<option value="district">마포구</option>
						<option value="district">광진구</option>
						<option value="district">성동구</option>
						<option value="district">중랑구</option>
						<option value="district">동대문구</option>
						<option value="district">성북구</option>
						<option value="district">도봉구</option>
						<option value="district">강북구</option>
						<option value="district">노원구</option>
						<option value="district">강서구</option>
						<option value="district">구로구</option>
						<option value="district">영등포구</option>
						<option value="district">동작구</option>
						<option value="district">관악구</option>
						<option value="district">금천구</option>
						<option value="district">양천구</option>
						<option value="district">강남구</option>
						<option value="district">서초구</option>
						<option value="district">송파구</option>
						<option value="district">강동구</option>
					</select><br> 
					<input type="text" class="form-control" id="address" placeholder="주소 입력 하거라" size=30>
					<button id="btn" class="btn btn-outline-success"
						style="margin-top: 10px;">START</button>
				</div>
				<br>
				<!-- 지도 안 나오는 경우 문의 창 -->
				<p style="margin-top: -12px">
					<em class="link">
						<h5>
							혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
							<button id="btnbtn" class="btn btn-outline-danger"
								href="javascript:void(0);"
								onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">여기!</button>
						</h5>
					</em>
				</p>
				<!-- 지도 안 나오는 경우 문의 창 -->
			</div>
		</div>
	</div>
</div>

<!-- weather start -->
	<div id="js_weather"></div>
	<div class = "now"></div>
	<div class="max_min_temp"></div>
	<div id = "sel"></div>
<!-- weather end -->
<!-- container end -->

<!-- map start -->
<div id="map" style="width: 95%; height: 550px;"></div>
			<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=14f150998f9d2432105a8538735eee0f&libraries=services">
			</script>
			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(37.56778694776533,
							126.98229712096322), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};
				// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
				var map = new kakao.maps.Map(mapContainer, mapOption);
				
				// 마커를 표시할 위치와 title 객체 배열입니다 
				var positions = [
					<%int index = 0;
					for (ParkDto dto1 : list) {
						index++;%>
					    {
					        title: '<%=dto1.getPname()%>', 
					        latlng: new kakao.maps.LatLng(<%=dto1.getLan()%>, <%=dto1.getLen()%>)
					    }<%if (size != index)
					out.print(",");%>
			    	<%}%>
				];positions.add
				
				// 마커 이미지의 이미지 주소입니다
				var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
				
				for (var i = 0; i < positions.length; i ++) {
				    
				    // 마커 이미지의 이미지 크기 입니다
				    var imageSize = new kakao.maps.Size(24, 35); 
				    
				    // 마커 이미지를 생성합니다    
				    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
				    
				    // 마커를 생성합니다
				   var marker = new kakao.maps.Marker({
				        map: map, // 마커를 표시할 지도
				        position: positions[i].latlng, // 마커를 표시할 위치
				        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				        image : markerImage // 마커 이미지
				    });
				    
				   var infowindow = new kakao.maps.InfoWindow({
				        content: positions[i].title // 인포윈도우에 표시할 내용
				    });
				    // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저 생성
				    // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록
				    (function(marker, infowindow) {
				        //인포윈도우를 표시
				        kakao.maps.event.addListener(marker, 'mouseover', function() {
				            infowindow.open(map, marker);
				        });
				        //인포윈도우를 닫음
				        kakao.maps.event.addListener(marker, 'mouseout', function() {
				            infowindow.close();
				        });
				    })(marker, infowindow);
				}
				
				marker.setMap(map);
				
				var geocoder = new kakao.maps.services.Geocoder();
				// 클릭 이벤트로 주소 받고 좌표를 검색합니다	
				$('#btn').click(function(){
					geocoder.addressSearch($('#address').val(), function(result, status){
				
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				        // 결과값으로 받은 위치를 마커로 표시
				        var mark = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });
				        // 인포윈도우로 장소에 대한 설명을 표시
				        var infowindow = new kakao.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">고객님 위치</div>'
				        });
				        infowindow.open(map, mark);
				        // 지도의 중심을 결과값으로 받은 위치로 이동
				        map.setCenter(coords);
				    	}
					});
					$(function(){
						$('#sel').empty();
					});
				});//클릭이벤트로 주소받고 좌표 검색 끝
</script>
<!-- map end -->

	<div class="text-center" style="margin: 50px 0 0 0">
		<a class="btn btn-secondary" href="index.jsp" role="button">뒤로 가기</a>
	</div>
	
<script src="weather.js"></script>

<%@ include file="footer.jsp"%>