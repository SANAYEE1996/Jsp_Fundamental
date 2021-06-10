<%@ page pageEncoding="utf-8"%>
<%@ include file="../inc/header.jsp"%>

<nav aria-lavel="breadcrumb">
		<ol class = "breadcrumb">
			<li class ="breadcrumb-item"><a href="/index.jsp">홈</a></li>
			<li class ="breadcrumb-item"><a href="/index.jsp">홈</a></li>
		</ol>
</nav>
<!-- container start -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
			<h5>공지사항 보기 </h5>
			<%-- form start --%>
				<form name = "noticeForm" method="post" action="saveDb.jsp">
				  <div class="form-group">
				    작성자 : 박영상
				  </div>
				  <div class="form-group">
				    제목 : 복도에서 규칙
				  </div>
				  <div class="form-group">
				    내용 : 뛰어다니지 말 것.
				  </div>
				</form>	
			<%-- form end --%>
			<div class="text-right">
				<a class="btn btn-secondary" href="list.jsp" role="button">리스트</a>
				<a class="btn btn-success" href="modify.jsp" role="button">수정</a>
				<a class="btn btn-danger" id="DeleteNotice" role="button">삭제</a>
			</div>
			</div>
		</div>
	</div>
<%@ include file="../inc/footer.jsp"%>