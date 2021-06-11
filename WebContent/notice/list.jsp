<!-- template.html -->
<%@page import="kr.or.kpc.dto.NoticeDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.kpc.dao.NoticeDao"%>
<%@ page pageEncoding="utf-8" %>
<%@ include file="../inc/header.jsp" %>
<%
	String tempPage = request.getParameter("page");
	int cPage = 0;
	if(tempPage== null || tempPage.length()==0){
		cPage = 1;
	}
	try{
		cPage = Integer.parseInt(tempPage);
	}catch(NumberFormatException e){
		cPage = 1;
	}
	
	/*
	cPage = 1   -> 0  , 10;
	cPage = 2   -> 10 , 10;
	cPage = 3   -> 20 , 10;
	start = 0, 10 20   , displayCount : 10
	An = a1 + (n-1)*d  
		-> a1 : 0 , n->cPage , d : displayCount		
	
	*/
	int displayCount = 4;
	int pageDispalyCount = 3;
	int totalRows = 0;//128
	int currentBlock = 0;
	int totalBlock = 0;
	int totalPage = 0;
	int startPage = 0;
	int endPage = 0;
	int start = 0 + (cPage-1)*displayCount;
	NoticeDao dao = NoticeDao.getInstance();
	ArrayList<NoticeDto> list = 
			dao.select(start, displayCount);
	
%>
  	<!-- breadcrumb start -->
  	<nav aria-label="breadcrumb">
	  <ol class="breadcrumb">
	    <li class="breadcrumb-item"><a href="/index.jsp">홈</a></li>
	    <li class="breadcrumb-item">공지사항</li>
	 </ol>
	</nav>
	<!-- breadcrumb end -->
  	
  	<!-- container start -->
	<div class="container">
		<!-- col start -->
		<div class="row">
			<div class="col-md-12">
				<%-- table start --%>
				<h5>공지사항 리스트</h5>
				<div class="table-responsive">
				<table class="table table-hover">
				  <colgroup>
				  	<col width="10%">
				  	<col width="10%">
				  	<col width="65%">
				  	<col width="15%">
				  </colgroup>
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
				  	if(list.size() != 0){
				  		for(NoticeDto dto : list){
				  %>
				    <tr>
				      <th scope="row"><%=dto.getNum() %></th>
				      <td><%=dto.getWriter() %></td>
				      <td><a href="view.jsp"><%=dto.getTitle() %></a></td>
				      <td><%=dto.getRegdate() %></td>
				    </tr>
				  <%	
				  		} 
				  	}else{
				  %> 
				  	<tr>
				      <td colspan='4'>데이터가 존재 하지 않습니다.</td>
				    </tr>
				  <%} %>
				  </tbody>
				</table>
				<%--Pagination start --%>
	<%
		/*
			총 rows 128개, displayCount 10개 가정
			Previous 1 2 3 4 5 6 7 8 9 10 Next => currentBlock : 1 block
			Previous 11 12 13 Next			   => currentBlock : 2 block
		*/
		totalRows = dao.getRows();//128
		
		if(totalRows%displayCount==0){
			totalPage = totalRows/displayCount;
		}else{
			totalPage = totalRows/displayCount + 1;
		}
		
		/*
		totalPage = (totalRows%displayCount==0) ? 
					totalRows/displayCount : 
					totalRows/displayCount + 1 ;
		*/
		if(totalPage == 0){
			totalPage = 1;
		}
		/*
		totalPage : 13
		      
		cPage : 1-10  -> currentBlock : 1, pageDisplayCount : 10
		cPage : 11-13 -> currentBlock : 2, pageDisplayCount : 10
		totalBlock = 2 
		....
		totalPage : 13
		cPage : 1-5  -> currentBlock : 1, pageDisplayCount : 5
		cPage : 6-10 -> currentBlock : 2, pageDisplayCount : 5
		cPage : 11-13 -> currentBlock : 3, pageDisplayCount : 5
		totalBlock = 3 
		....
		*/
		if(cPage%pageDispalyCount == 0){
			currentBlock = cPage/pageDispalyCount;
		}else {
			currentBlock = cPage/pageDispalyCount +1;
		}
			
		if(totalPage%pageDispalyCount == 0){
			totalBlock = totalPage/pageDispalyCount;
		}else {
			totalBlock = totalPage/pageDispalyCount +1;
		}
		/*
		cPage : 1-10  -> currentBlock : 1
		cPage : 11-20 -> currentBlock : 2
		.....
		startPage : 1, 11, 20
		endPage : 10, 20, 30
		*/
		startPage = 1 + (currentBlock -1)*pageDispalyCount;
		endPage = pageDispalyCount + (currentBlock -1)*pageDispalyCount;
		
		if(currentBlock == totalBlock){
			endPage = totalPage;
		}
	%>
				<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
				    
				    <li class="page-item <%if(currentBlock==1){%>disabled<%}%>">
				      <a class="page-link" href="list.jsp?page=<%=startPage-1 %>" tabindex="-1" aria-disabled="true">Previous</a>
				    </li>
				    
				    <%for(int i=startPage;i<=endPage;i++){ %>
				    <li class="page-item"><a class="page-link" href="list.jsp?page=<%=i%>"><%=i %></a></li>
				    <%} %>
				    
				    <li class="page-item  <%if(totalBlock==currentBlock){ %>disabled<%}%>">
				      <a class="page-link" href="list.jsp?page=<%=endPage+1%>">Next</a>
				    </li>
				    
				  </ul>
				</nav>
				<%--Pagination end --%>
				<div class="text-right">
					<a class="btn btn-success" href="write.jsp?page=<%=cPage %>" role="button">글쓰기</a>
				</div>
				</div>
				<%-- table end--%>
			</div>
		</div>
		<!-- col end -->
	</div>
	<!-- container end -->
<%@ include file="../inc/footer.jsp" %>