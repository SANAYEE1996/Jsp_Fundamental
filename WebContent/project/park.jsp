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
<nav aria-label="breadcrumb" >
  <ol class="breadcrumb" style="background-color: green">
    <li class="breadcrumb-item"><a href="program.jsp" style="color:white">Home</a></li>
    <li class="breadcrumb-item">Program</li>
  <link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
 </ol>
</nav>


<!-- container start -->
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<!-- table start -->
			<br>
			<h3>공원 맵</h3>
			<div class="table-responsive">
				<div style="width: 40%; margin: 20px;">
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
					<div>
						<input type="text" class="form-control" id="address" placeholder="주소 입력 해주세요" size=30>
						<button id="btn" class="btn btn-outline-success" >START</button>
					</div>
				</div>
				<br>
				
			</div>
		</div>
	</div>
</div>
<!-- weather start -->
<div class = "row">
	<div class="col-md-12">
		<div class="input-group" style="width:71%; margin:0 auto">
		        <div class="input-group-prepend">
		          <span class="input-group-text"><img id = "icon"></img></span>
		        </div>
			    <div class="form-control" style=" height:auto">   
			        <strong>
			        	   <img id="weather1" src="https://media.istockphoto.com/vectors/thin-out-line-red-pin-location-gps-icon-geometric-marker-flat-shape-vector-id1160934392?k=6&m=1160934392&s=170667a&w=0&h=lEoHfCzvvA8vNisLpCln9GygHFGdsaV8gWmj2zh9KrE=" 
                   			 width="30px" height="23px" style="float:left; margin:0 0 0 45%;" >
                   		<div id="js_weather"></div>
              			<div  style="text-align:center;">
					      	<div class = "now"></div>
					      	<div class="feel"></div>
					      	<div class="max_min_temp"></div>
				     	 	<div class = "status"></div>
					      	<div id = "sel"></div>
					      	<div class = "comment"></div>
					      	<div id= "sel2"></div>
				      	</div>
			      	</strong>
		      </div>
		</div>
	</div>
</div>
<!-- weather end -->
<!-- container end -->
<!-- map start -->
<br><br>
<div id="map" style="width: 95%; height: 550px; margin:0 auto"></div>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=14f150998f9d2432105a8538735eee0f&libraries=services">
</script>
<script>
		var latitude = null;
		var longitude = null;
		var mapContainer = null;
		var map = null;
		var positions = null;
		var marker = null;
		var infowindow = null;
		var imageSrc = null;
		var imageSize = null;
		var markerImage = null;
		
		if (navigator.geolocation) {
		    navigator.geolocation.watchPosition (function(pos) {
		        latitude = pos.coords.latitude;
		        longitude = pos.coords.longitude;
		        //맵 생성
				mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(latitude,longitude), // 현재 위치의 좌표를 지도 중심으로
					level : 3 // 지도의 확대 레벨
				};
				
				// 지도를 표시할 div와  지도 옵션으로  지도를 생성
				map = new kakao.maps.Map(mapContainer, mapOption);
				
				// 마커를 표시할 위치와 title 객체 배열
				positions = [
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
				
				// 마커 이미지의 이미지 주소
				imageSrc = "https://kr.seaicons.com/wp-content/uploads/2015/10/Park-icon.png"; 
				
				///// 1977 개 마커 생성 시작
				for (var i = 0; i < positions.length; i ++) {
				    
				    // 마커 이미지의 이미지 크기
				    imageSize = new kakao.maps.Size(50, 65
				    		); 
				    
				    // 마커 이미지를 생성   
				    markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
				    
				    // 마커를 생성
				   marker = new kakao.maps.Marker({
				        map: map, // 마커를 표시할 지도
				        position: positions[i].latlng, // 마커를 표시할 위치
				        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시
				        image : markerImage // 마커 이미지
				    });
				    
				   infowindow = new kakao.maps.InfoWindow({
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
				///// 1977 개 마커 생성 종료
				
				//1977개 마커를 맵에 표시.
				marker.setMap(map);
		    });
		} else {
		    alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
		}
		
		$('#btn').click(function(){
				var geocoder = new kakao.maps.services.Geocoder();
				// 클릭 이벤트로 주소 받고 좌표를 검색
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
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">찾으시려는 위치</div>'
			        });
			        infowindow.open(map, mark);
			        // 지도의 중심을 결과값으로 받은 위치로 이동
			        map.setCenter(coords);
			    	}
				});
				$(function(){
					$('#sel').empty();
					$('#sel2').empty();
					$('#address').empty();
				});
			});//클릭이벤트로 주소받고 좌표 검색 끝
</script>
<!-- map end -->

<!-- 뒤로가기 버튼 시작 -->
<div class="text-center" style="margin: 50px 0 0 0">
	<button type="button" class="btn btn-success">
		<a class="button" href="q.jsp" role="button" style="color: white">첫 페이지</a>
	</button>
</div>
<!-- 뒤로가기 버튼 끝 -->
<script src="weather.js"></script>

<%@ include file="footer.jsp"%>