<%@page import="kr.or.kpc.dao.ParkDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.kpc.dto.ParkDto"%>
<%@ page pageEncoding="utf-8"%>
<%@ include file="../inc/header.jsp"%>
<%
	ParkDto dto = new ParkDto();
	ParkDao dao = ParkDao.getInstance();
	
	ArrayList<ParkDto> list = dao.resall();
	int size = list.size();
%>
<nav aria-lavel="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="/index.jsp">홈</a></li>
		<li class="breadcrumb-item"><a href="/index.jsp">디렉토리</a></li>
		<li class="breadcrumb-item active" aria-current="page">Data</li>
	</ol>
</nav>
<!-- container start -->
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<!-- table start -->
			<h3>공원 맵</h3>
			<div class="table-responsive">
				<%--pagination start--%>
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<li class="page-item disabled"><a class="page-link" href="#"
							tabindex="-1" aria-disabled="true">Previous</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">Next</a>
						</li>
					</ul>
				</nav>
				<%--pagination end--%>
				<div class="text-right">
					<a class="btn btn-success" href="write.jsp" role="button">글쓰기</a>
				</div>
			</div>
			<!-- table end -->
			<!-- 지도를 표시할 div 입니다 -->
			<div id="map" style="width: 100%; height: 550px;"></div>

			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=14f150998f9d2432105a8538735eee0f"></script>
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
					<%
						int index=0;
						for(ParkDto dto1 : list){
						index++;
					%>
				    {
				        title: '<%=dto1.getPname()%>', 
				        latlng: new kakao.maps.LatLng(<%=dto1.getLan()%>, <%=dto1.getLen()%>)
				    }<%if(size != index) out.print(",");%>
				   <%}%>
				];
				positions.add
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
				}
			</script>
		</div>
	</div>
</div>
<%@ include file="../inc/footer.jsp"%>