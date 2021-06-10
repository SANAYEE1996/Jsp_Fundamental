<%@page import="kr.or.kpc.dto.NoticeDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.kpc.dao.NoticeDao"%>
<%@ page pageEncoding="utf-8"%>
<%@ include file="../inc/header.jsp"%>
<%
	String tempPage = request.getParameter("page");
	int cPage = 0;
	if(tempPage == null || tempPage.length() == 0){
		cPage = 1;
	}
	cPage = Integer.parseInt(tempPage);
	
	int displayCount = 10;
	int start = 0 + (cPage-1)*10;
	NoticeDao dao = NoticeDao.getInstance();
	ArrayList<NoticeDto> list = dao.select(0,displayCount);
	
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
			<h3>공지사항 리스트</h3>
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">작성자</th>
							<th scope="col">제목</th>
							<th scope="col">날짜</th>
						</tr>
					</thead>
					<tbody>
					<%
                 for(NoticeDto dto : list){
		              %>
		                <tr>
		                  <th scope="row"><%=dto.getNum()%></th>
		                  <td><%=dto.getWriter()%></td>
		                  <td><a href="view.jsp"><%=dto.getTitle()%></a></td>
		                  <td><%=dto.getRegdate()%></td>
		                </tr>
		              <%} 
		              %>
						<tr>
							<th scope="row">1</th>
							<td>박영상</td>
							<td><a href="view.jsp">타이틀</a></td>
							<td>1996-08-26</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>Jacob</td>
							<td><a href="view.jsp">Thornton</a></td>
							<td>1996-08-26</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>Larry the Bird</td>
							<td><a href="view.jsp">notebook</a></td>
							<td>1996-08-26</td>
						</tr>
					</tbody>
				</table>
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
			</script>
		</div>
	</div>
</div>
<%@ include file="../inc/footer.jsp"%>