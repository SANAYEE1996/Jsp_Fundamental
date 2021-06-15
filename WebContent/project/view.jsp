<!-- step01_grid_lg.html -->
<%@page import="kr.or.kpc.dto.NoticeDto"%>
<%@page import="kr.or.kpc.dao.NoticeDao"%>
<%@page pageEncoding="utf-8" %>
<%
String tempPage = request.getParameter("page");
String tempNum = request.getParameter("num");
int cPage = 0;
int num = 0;
if(tempPage == null || tempPage.length() == 0){
	cPage=1;
}
try{
cPage = Integer.parseInt(tempPage);
}catch(NumberFormatException e){
cPage = 1;
}

if(tempNum == null || tempNum.length()==0){
	num = -1;
}
try{
num = Integer.parseInt(tempNum);
}catch(NumberFormatException e){
num = -1;
}

NoticeDao dao = NoticeDao.getInstance();
NoticeDto dto = dao.select(num);
if(dto == null){
	num = -1;
}

if(num == -1){
%>
<script>
alert('해당글이 존재하지 않습니다.');
location.href="list.jsp?page=<%=cPage%>";
</script>
<%}else{ %>
<%@include file="../inc/header.jsp" %>
  <!-- breadcrumb start -->

<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="/index.jsp">홈</a></li>
    <li class="breadcrumb-item"><a href="/notice/list.jsp">공지사항</a></li>
  </ol>
</nav>
  
  <!-- breadcrumb end -->
  <!-- container start -->
    <div class="container">
    	
  <!-- col start -->
 	<div class="row">
    	<div class="col-md-12">
    		<h6>공지사항 보기</h6>
    		<%--form start --%>
    		
    		<form name="noticeForm" method="post" action="saveDb.jsp">
			  <div class="form-group">
			    작성자:<%=dto.getWriter() %>
			    </div>
			    
			  <div class="form-group">
			    <strong>날짜</strong> : <p><%=dto.getRegdate() %></p>
			  </div>

			  <div class="form-group">	
			   <strong>제목</strong> : <p><%=dto.getTitle() %></p>
			  </div>											<%--입력하는 창에는 무조건 name이 있어야한다. --%>
			  								
			  <div class="form-group">
			    <strong>내용</strong> : <p><%=dto.getContent().replaceAll("\n", "<br>") %></p>
			  </div>
			  
			</form>
    		
    		<%--form end --%>
    		<div class="text-right">
			<a class="btn btn-outline-secondary" href="list.jsp?page=<%=cPage %>" role="button">리스트</a>
			<a class="btn btn-outline-success" href="modify.jsp?num=<%=num %>&page=<%=cPage %>" id="saveNotice" role="button">수정</a>
			<a class="btn btn-outline-danger" href="deleteDb.jsp?num=<%=num %>&page=<%=cPage %>" id="saveNotice" role="button">삭제</a>
			</div>
			
    		
    	</div>
    </div>
  <!-- col end -->
    </div>
  <!-- container end -->
<%@include file="../inc/footer.jsp" %>
<%}%>